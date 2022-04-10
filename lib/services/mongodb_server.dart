import 'package:mongo_dart/mongo_dart.dart';
// import 'package:restful/restful.dart';

class MongoDbServer
{
  static late final _db;
  static late final _collection;

  static void connect() async
  {
    MongoDbServer._db = await Db.create('mongodb+srv://flutteradminpanel:<flutteradminpanel>@cluster0.jraea.mongodb.net/flutteradminpanel_db?retryWrites=true&w=majority');
    await MongoDbServer._db.open();
    MongoDbServer._collection = MongoDbServer._db.collection('Tasks');
  }

  static void initialize() async
  {
    //Api.get('/task', () => print('post request went through'));
    //Api.listen(host: '127.0.0.1', port:5001);
  }

  static void disconnect() => MongoDbServer._db.close();
}