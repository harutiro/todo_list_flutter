import 'package:uuid/uuid.dart';

class UUIDUtility {
  static String generateUUID() {
    var uuid = const Uuid();
    return uuid.v4();
  }
}