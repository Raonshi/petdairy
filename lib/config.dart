import 'package:logger/logger.dart';

get lgr => Logger();

abstract class LocalStorageKey {
  static String fcmToken = 'FCM_TOKEN';
}
