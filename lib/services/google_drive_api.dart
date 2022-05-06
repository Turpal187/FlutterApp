import 'package:admin/services/google_auth_api.dart';
import 'package:file_picker/file_picker.dart';
import 'package:googleapis/drive/v3.dart';
import 'package:extension_google_sign_in_as_googleapis_auth/extension_google_sign_in_as_googleapis_auth.dart';
import 'package:googleapis_auth/googleapis_auth.dart';

class GoogleDriveApi
{

  static AuthClient? _authClient;
  static DriveApi? _driveApi;
  static final String _directoryName = 'FlutterTodoApp';
  static String? _directoryId;

  static Future<void> upload() async
  {
    GoogleDriveApi._authClient = await GoogleAuthApi.googleSignIn.authenticatedClient();
    GoogleDriveApi._driveApi = new DriveApi(GoogleDriveApi._authClient!);

    // Search for the _directoryName inside the drive root
    GoogleDriveApi._find().then((e) async
    {
      // If not found create and assign the folderId
      if (e == null) { await GoogleDriveApi._create(); }
      else { GoogleDriveApi._directoryId = e; }

      GoogleDriveApi._choose();

    });

  }

  static Future<void> _choose() async
  {
    var file = await FilePicker.platform.pickFiles(withReadStream: true);
    if (file != null)
    {
      final platformFile = file.files.first;
      GoogleDriveApi._driveApi?.files.create
      (
        new File(name: platformFile.name, parents: [GoogleDriveApi._directoryId!]), 
        uploadMedia: new Media(platformFile.readStream!, platformFile.size)
      );
    }
  }

  static Future<String?> _find() async
  {
    return GoogleDriveApi._driveApi?.files.list().then((files)
    {
      return files.files?.map((e)
      { if (e.name == GoogleDriveApi._directoryName) { return e.id; }
      }).first;
    });
  }

  static Future<void> _create() async => await GoogleDriveApi._driveApi?.files.create(new File(name: GoogleDriveApi._directoryName, mimeType: 'application/vnd.google-apps.folder'));
}