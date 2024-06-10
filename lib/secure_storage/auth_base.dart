import 'package:mami_onesignal_flutter/secure_storage/user_model.dart';

abstract class AuthBase {
  Future<UserModel?> googleWithSingIn();
  Future<bool> singOut();
}
