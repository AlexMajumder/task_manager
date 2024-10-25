import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:task_manager/data/models/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest({ required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url); //to see in Console
      final Response response = await get(uri);
      printResponse(url, response); //to see in Console
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static Future<NetworkResponse> postRequest(
      { required String url, Map<String, dynamic>? body}) async {
    try {
      Uri uri = Uri.parse(url);
      debugPrint(url); //to see in Console
      final Response response = await post(uri,
          headers: {
        'ContentType' : 'application/json'
          },
          body: jsonEncode(
            body,
          ));
      printResponse(url, response); //to see in Console
      if (response.statusCode == 200) {
        final decodeData = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          statusCode: response.statusCode,
          responseData: decodeData,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: -1,
        errorMessage: e.toString(),
      );
    }
  }

  static void printResponse(String url, Response response) {
    debugPrint(
      'URL: $url \nResponseCode: ${response.statusCode} \n Body: ${response.body}', //to see in Console
    );
  }
}