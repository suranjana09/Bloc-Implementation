import 'package:ecom_app/data/api_client.dart';

sendLoginRequest(email, password) async {
  String url = '/api/login';
  print(url);
  Map<String, String> data = {'email': email, 'password': password};
  var response = await BaseApiClient().post(url, data);
  print(response);
}
