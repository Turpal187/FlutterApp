import 'package:admin/services/google_auth_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis_auth/googleapis_auth.dart';
import 'package:collection/collection.dart';

class GoogleDriveApi
{

  static AuthClient? _authClient;
  static DriveApi? _driveApi;
  static final String _rootName = 'FlutterTodoApp';
  static String? _rootId;

  static Future<void> upload(String directory, PlatformFile toupload) async
  {
    GoogleDriveApi._authClient = await GoogleAuthApi.googleSignIn.authenticatedClient();
    GoogleDriveApi._driveApi = new DriveApi(GoogleDriveApi._authClient!);

    GoogleDriveApi._find(GoogleDriveApi._rootName).then(
      
      (response) async
      {
        if (response == null)
        { // Root folder doesnt exist yet, so create it
          print('Creating root file... ${ GoogleDriveApi._rootName }');
          final rootfile = await GoogleDriveApi._create([''], GoogleDriveApi._rootName);
          GoogleDriveApi._rootId = rootfile?.id;
        } else { GoogleDriveApi._rootId = response; }

        print('Found root file... ${ GoogleDriveApi._rootId }');

        // Check if the directory already exists otherwise create it
        GoogleDriveApi._find(directory).then(
          (foundfile) async 
          {
            String? directoryId;
            if (foundfile == null) 
            { // Directory not found
              print('Creating subdirectory...  $directory');
              final createdfile = await GoogleDriveApi._create([GoogleDriveApi._rootId!], directory);
              directoryId = createdfile?.id;
            }
            else { directoryId = foundfile; }
            print('Found subdirectory... $directoryId');

            print('Uploading file... ${ toupload.name }');
            GoogleDriveApi._driveApi?.files.create(
              new File(name: toupload.name, 
                       parents: [directoryId!]
                       ), 
                       uploadMedia: new Media(toupload.readStream!, toupload.size));
          }
        );
      }
      
    );

  }

  static Future<PlatformFile?> choose() async
  {
    var file = await FilePicker.platform.pickFiles(withReadStream: true);
    return file?.files.first;
  }

  static Future<String?> _find(String folder) async
  {
    print('Searching file $folder');
    return GoogleDriveApi._driveApi?.files.list().then((files) => 
      files.files?.firstWhereOrNull((element) => element.name == folder)?.id);
  }

  static Future<File?> _create(List<String> path, String fname) async => await GoogleDriveApi._driveApi?.files.create
  (new File(name: fname, mimeType: 'application/vnd.google-apps.folder', parents: path));
}