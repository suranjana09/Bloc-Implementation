import 'dart:convert';

import 'package:ecom_app/data/api_client.dart';

Future<List<dynamic>> getUserData() async {
  String api = '/api/users?page=2';
  var response = await BaseApiClient().get(api);
  final jsonData = json.decode(response);
  // print(jsonData);
  List<dynamic> userList = List.from(jsonData['data']);
  // print(userList);
  return userList;
}
