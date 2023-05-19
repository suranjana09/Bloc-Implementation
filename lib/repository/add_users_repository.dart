import 'package:ecom_app/data/api_client.dart';

addUserRequest(name, jobName) {
  String url = '/api/users';
  print(url);
  Map<String, String> data = {"name": name, "job": jobName};
  final response = BaseApiClient().post(url, data);
  print(response);
}
