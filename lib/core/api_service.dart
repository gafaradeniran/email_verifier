import 'dart:convert';
import 'package:verify_mail/core/model.dart';
import 'package:http/http.dart' as http;
import 'base_api.dart';

class ApiService extends BaseApi {
  @override
  Future<VerifyModel> verifyEmailApi(String email) async {
    String baseUrl =
        'https://api.emailvalidation.io/v1/info?apikey=ksef5c4tpz6WdnAHXK2zeSh8LdUDFmY4lWbaVpVd&email=$email';
    print(email);
    try {
      final response = await http.get(Uri.parse(baseUrl));
      final res = jsonDecode(response.body);
      print(res);
      if (response.statusCode == 200) {
        VerifyModel verifyModel = verifyModelFromJson(response.body);
        return VerifyModel(
            email: verifyModel.email,
            user: verifyModel.user,
            domain: verifyModel.domain,
            formatValid: verifyModel.formatValid,
            didYouMean: verifyModel.didYouMean,
            smtpCheck: verifyModel.smtpCheck,
            mxFound: verifyModel.mxFound);
      }
      return VerifyModel(
          email: res['email'],
          user: res['user'],
          domain: res['domain'],
          mxFound: res['mxFound'],
          smtpCheck: res['smtpCheck']);
    } catch (e) {
      throw e.toString();
    }
  }
}
