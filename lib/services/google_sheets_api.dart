import 'package:admin/models/EmployeeModel.dart';
import 'package:admin/models/TaskModel.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:admin/services/google_auth_api.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:admin/services/google_drive_api.dart';

class GoogleSheetsApi
{
  static AuthClient? _authClient;
  static SheetsApi? _sheetsApi;
  static String _sheetTitle = 'FlutterTodoSheet';
  static String? _sheetId;

  static Future<void> init() async
  {
    GoogleSheetsApi._authClient = await GoogleAuthApi.googleSignIn.authenticatedClient();
    GoogleSheetsApi._sheetsApi = new SheetsApi(GoogleSheetsApi._authClient!);

    // Search for the application sheet inside the google drive of the logged in user
    GoogleDriveApi.find(GoogleSheetsApi._sheetTitle).then((sheet) async
    {
      if (sheet == null)
      {
        print('Sheet not found... ${ GoogleSheetsApi._sheetTitle }');
        await GoogleSheetsApi._initSheets();
        await GoogleSheetsApi._initHeaders();

      } else { GoogleSheetsApi._sheetId = sheet; }

      print('Found sheet ${ GoogleSheetsApi._sheetId }');
      GoogleSheetsApi._syncData();

    });
  }
  
  static Future<void> create() async => 
  GoogleSheetsApi._sheetsApi?.spreadsheets.create(new Spreadsheet(sheets: [new Sheet(properties: new SheetProperties(title: 'FlutterTestSheet'))]));

  static Future<void> _initSheets() async
  {
    print('Creating new sheet...');
    final addedsheet = await GoogleSheetsApi._sheetsApi?.spreadsheets.create
    (
      new Spreadsheet(properties: new SpreadsheetProperties(title: GoogleSheetsApi._sheetTitle),
                      sheets: [new Sheet(properties: new SheetProperties(title: 'employees')), 
                               new Sheet(properties: new SheetProperties(title: 'tasks'))])
    );

    GoogleSheetsApi._sheetId = addedsheet?.spreadsheetId;
    await GoogleDriveApi.move(GoogleDriveApi.rootName!, GoogleSheetsApi._sheetTitle);
  }

  static Future<void> _initHeaders() async
  {
    print('Writing headers on sheets...');
    await GoogleSheetsApi._sheetsApi?.spreadsheets.values.append
    (ValueRange(majorDimension: 'COLUMNS', range: 'employees!A1:D1', values: [['id'], ['name'], ['surname'], ['email']]), 
      GoogleSheetsApi._sheetId!, 'employees!A1:D1', valueInputOption: 'USER_ENTERED', insertDataOption: 'OVERWRITE');

    await GoogleSheetsApi._sheetsApi?.spreadsheets.values.append
    (ValueRange(majorDimension: 'COLUMNS', range: 'tasks!A1:F1', values: [['title'], ['employee'], ['date'], ['time'], ['duration'], ['status']]), 
      GoogleSheetsApi._sheetId!, 'tasks!A1:F1', valueInputOption: 'USER_ENTERED', insertDataOption: 'OVERWRITE');
  }

  static Future<void> _syncData() async
  {
    print('Syncing employees...');
    GoogleSheetsApi._sheetsApi?.spreadsheets.values.get(GoogleSheetsApi._sheetId!, 'employees!B2:D').then(
      (values)
      {
        values.values?.forEach((element) { EmployeeModel.add(new Employee(name: element[0].toString(), surname: element[1].toString(), email: element[2].toString())); });
      }
    );

    print('Syncing tasks...');
    GoogleSheetsApi._sheetsApi?.spreadsheets.values.get(GoogleSheetsApi._sheetId!, 'tasks!A2:F').then(
      (values)
      {
        values.values?.forEach((element) { TaskModel.addTask(
          new Task(title: element[0].toString(), employee: element[1].toString(), date: element[2].toString(), 
                   time: element[3].toString(), duration: int.parse(element[4].toString()), status: element[5].toString())); });
      }
    );
  }

  static void saveEmployee(Employee employee)
  {
    print('Saving employee ${ employee.toString() }');
    GoogleSheetsApi._sheetsApi?.spreadsheets.values.append
    (ValueRange(majorDimension: 'COLUMNS', range: 'employees!A:D', values: [[employee.id], [employee.name], [employee.surname], [employee.email]]), 
      GoogleSheetsApi._sheetId!, 'employees!A:D', valueInputOption: 'USER_ENTERED', insertDataOption: 'OVERWRITE');
  }

  static void saveTask(Task task)
  {
    print('Saving task ${ task.title }');
    GoogleSheetsApi._sheetsApi?.spreadsheets.values.append
    (ValueRange(majorDimension: 'COLUMNS', range: 'tasks!A:F', values: [[task.title], [task.employee], [task.date], [task.time], [task.duration], [task.status]]), 
      GoogleSheetsApi._sheetId!, 'tasks!A:F', valueInputOption: 'USER_ENTERED', insertDataOption: 'OVERWRITE');
  }
}