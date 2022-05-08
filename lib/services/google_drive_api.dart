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
  static final String _rootName = '123';
  static String? _rootId;

  static String? get rootName => GoogleDriveApi._rootName;

  static Future<void> init() async
  {
    GoogleDriveApi._authClient = await GoogleAuthApi.googleSignIn.authenticatedClient();
    GoogleDriveApi._driveApi = new DriveApi(GoogleDriveApi._authClient!);

    GoogleDriveApi.find(GoogleDriveApi._rootName).then(
      (response) async
      {
        if (response == null)
        { // Root folder doesnt exist yet, so create it
          print('Root file not found...');
          print('Creating root file... ${ GoogleDriveApi._rootName }');
          final rootfile = await GoogleDriveApi._create('', GoogleDriveApi._rootName);
          GoogleDriveApi._rootId = rootfile?.id;
        } else { GoogleDriveApi._rootId = response; }

        print('Found root file... ${ GoogleDriveApi._rootId }');
      }
    );
  }

  static Future<void> upload(String directory, PlatformFile toupload) async
  {
    // Check if the directory already exists otherwise create it
    GoogleDriveApi.find(directory).then(
      (foundfile) async 
      {
        String? directoryId;
        if (foundfile == null) 
        { // Directory not found
          print('Subdirectory not found...');
          print('Creating subdirectory...  $directory');
          final createdfile = await GoogleDriveApi._create(GoogleDriveApi._rootId!, directory);
          directoryId = createdfile?.id;
        }
        else { directoryId = foundfile; }

        print('Uploading file... ${ toupload.name } under $directory');
        GoogleDriveApi._driveApi?.files.create(
          new File(name: toupload.name, 
                    parents: [directoryId!]
                    ), 
                    uploadMedia: new Media(toupload.readStream!, toupload.size));
      }
    );
  }

  static Future<void> move(String parentName, String fileName) async
  {
    final parentId = await GoogleDriveApi.find(parentName);
    final fileId = await GoogleDriveApi.find(fileName);
    print('Moving file $fileName under $parentName');
    GoogleDriveApi._driveApi?.files.update(new File(), fileId!, addParents: parentId!);
  }

  static Future<PlatformFile?> choose() async
  {
    var file = await FilePicker.platform.pickFiles(withReadStream: true);
    return file?.files.first;
  }

  static Future<String?> find(String folder) async
  {
    print('Searching file $folder');
    return GoogleDriveApi._driveApi?.files.list().then((files) => 
      files.files?.firstWhereOrNull((element) => element.name == folder)?.id);
  }

  static Future<File?> _create(String path, String fname) async
  {
    final tocreate = new File(name: fname, mimeType: 'application/vnd.google-apps.folder');
    if (path.isNotEmpty)
    {
      tocreate.parents = [path];
    }

    return await GoogleDriveApi._driveApi?.files.create(tocreate);
  }

  static void list() => GoogleDriveApi._driveApi?.files.list().then((file) => 
    file.files?.forEach((element) => print(element.name) ));
  
  static Future<void> remove(String fileName) async
  {
    final fileId = await GoogleDriveApi.find(fileName);
    if (fileId != null)
    {
      print('Removing file $fileName');
      GoogleDriveApi._driveApi?.files.delete(fileId);
    }
  }

  static Future<void> removeAll() async =>
    GoogleDriveApi._driveApi?.files.list().then((filelist) => filelist.files?.forEach((file) 
      { print('Deleting file ${ file.name }'); GoogleDriveApi._driveApi?.files.delete(file.id!); }));
}