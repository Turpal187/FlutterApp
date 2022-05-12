import 'package:admin/services/google_drive_api.dart';
import 'package:googleapis/drive/v3.dart';

class RecentFilesModel
{
  static List<RecentFile> _filesList = [];
  static List<RecentFile> get files => RecentFilesModel._filesList;
  static Future<void> fetch() async
  {
    print('Fetching application files for dashboard');
    RecentFilesModel._filesList.clear();
    GoogleDriveApi.list().then((FileList? files)
    {
      files?.files?.forEach((element)
      {
        print('Adding file ${ element.name } to RecentFiles tree');
        RecentFilesModel._filesList.add(
          RecentFile(icon: 'assets/icons/doc_file.svg', title: element.name, date: element.modifiedTime.toString(), size: element.size ?? ''));
      });
    });
  }
}

class RecentFile 
{
  final String? icon, title, date, size;
  RecentFile({this.icon, this.title, this.date, this.size});

  @override
  String toString() => '$title, $date, $size';
}
