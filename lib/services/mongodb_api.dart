import 'package:mongo_dart/mongo_dart.dart';

class MongoDbApi
{
  static late final _db;
  static late final _collection;
  
  static void connect() async
  {
    MongoDbApi._db = await Db.create('mongodb+srv://flutteradminpanel:<flutteradminpanel>@cluster0.jraea.mongodb.net/flutteradminpanel_db?retryWrites=true&w=majority');
    await MongoDbApi._db.open();
    MongoDbApi._collection = MongoDbApi._db.collection('Tasks');
  }

  static void insert() async => await MongoDbApi._collection.insertOne({'testkey': 'testvalue'});
  static void disconnect() => MongoDbApi._db.close();
}