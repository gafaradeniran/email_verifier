import 'package:verify_mail/core/model.dart';

abstract class BaseApi {
  Future<VerifyModel> verifyEmailApi(String email);
}
