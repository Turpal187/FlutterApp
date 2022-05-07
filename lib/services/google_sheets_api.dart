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
        print('Creating sheet new sheet...');
        final addedsheet = await GoogleSheetsApi._sheetsApi?.spreadsheets.create
        (
          new Spreadsheet(properties: new SpreadsheetProperties(title: GoogleSheetsApi._sheetTitle),
                          sheets: [new Sheet(properties: new SheetProperties(title: 'main'))])
        );

        GoogleSheetsApi._sheetId = addedsheet?.spreadsheetId;
        GoogleDriveApi.move(GoogleDriveApi.rootName!, GoogleSheetsApi._sheetTitle);

        // Init header of sheet
        print('Writing header on sheet...');
        GoogleSheetsApi._sheetsApi?.spreadsheets.values.append
        (ValueRange(majorDimension: 'COLUMNS', range: 'main!A1:C1', values: [['test1'], ['test2'], ['test3']]), 
         GoogleSheetsApi._sheetId!, 'main!A1:C1', valueInputOption: 'USER_ENTERED', insertDataOption: 'OVERWRITE');

      } else { GoogleSheetsApi._sheetId = sheet; }

      print('Found sheet ${ GoogleSheetsApi._sheetId }');

    });
  }
  
  static Future<void> create() async => 
  GoogleSheetsApi._sheetsApi?.spreadsheets.create(new Spreadsheet(sheets: [new Sheet(properties: new SheetProperties(title: 'FlutterTestSheet'))]));
}