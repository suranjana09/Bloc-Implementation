import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

String baseUrl = 'https://reqres.in';

class BaseApiClient {
  var client = http.Client();

  // GET
  //
  Future<dynamic> get(
    String api, {
    Map<String, String>? headerData = const {},
  }) async {
    var url = Uri.parse(baseUrl + api);
    // print(url);
    headerData = {
      "Content-Type": "application/json",
    };

    // get the response
    var response = await client.get(url, headers: headerData);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      // throw exception and catch it in UI
      throw Exception(response.reasonPhrase);
    }
  }

  Future<dynamic> post(
    String api,
    dynamic object, {
    Map<String, String>? headerData = const {},
    bool loggedIn = true,
  }) async {
    var url = Uri.parse(baseUrl + api);

    Map<String, String> header = {};

    header = {
      "Content-Type": "application/json",
    };

    try {
      // get the response
      var response =
          await client.post(url, body: json.encode(object), headers: header);
      debugPrint("POST: $url");

      if (response.statusCode == 201 || response.statusCode == 200) {
        debugPrint("response received.");
        // print(response.body);
        return response.body;
      } else {
        // throw exception and catch it in UI

        throw Exception(response.reasonPhrase);
      }
    } finally {
      client.close();
    }
  }
}
