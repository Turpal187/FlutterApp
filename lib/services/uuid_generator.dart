import 'package:uuid/uuid.dart';

class UuidGenerator
{
  static String generate()
  {
    Uuid _uuid = new Uuid();
    return _uuid.v4();
  }
}