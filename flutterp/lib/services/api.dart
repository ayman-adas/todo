// ignore_for_file: collection_methods_unrelated_type

import 'dart:convert';

import 'package:http/http.dart' as https;
import 'dart:developer' as developer;

class ServicesApi {
  static Future<void> post(
      String domainName, String path, Map<String, dynamic> body) async {
    try {
      developer.log('in post ${body.toString()}');
      Uri url = Uri.parse('$domainName$path');
      var response = await https.post(
        url,
        body: json.encode(
          body,
        ),
        headers: {
          'Content-Type': 'application/json', // Specify content-type
        },
      );
      checkStatus(response.statusCode);
    } catch (e) {
      developer.log(e.toString());
    }
  }

  static Future<List> get(String domainName, String path) async {
    try {
      Uri url = Uri.parse(domainName + path);
      final response = await https.get(url);
      final List body = json.decode(response.body);
      developer.log(json.decode(response.body).toString());

      developer.log(body[0].toString());
      return body;
    } catch (error) {
      developer.log(error.toString());
      return [];
    }
  }

  static Future<void> put(
      String domainName, String path, Map<String, dynamic> body) async {
    try {
      Uri url = Uri.parse('$domainName$path');
      var response = await https.put(
        url,
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json', // Specify content-type
        },
      );
      checkStatus(response.statusCode);
    } catch (error) {
      developer.log(error.toString());
    }
  }

  static Future<void> delete(
      String domainName, String path, Map<String, dynamic> body) async {
    try {
      Uri url = Uri.parse('$domainName$path');
      await https.delete(
        url,
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json', // Specify content-type
        },
      );
    } catch (error) {
      developer.log(error.toString());
    }
  }

  static Future<void> patch(
      String domainName, String path, Map<String, dynamic> body) async {
    try {
      Uri url = Uri.parse('$domainName$path');
      var response = await https.patch(
        url,
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json', // Specify content-type
        },
      );
      checkStatus(response.statusCode);
    } catch (error) {
      developer.log(error.toString());
    }
  }
}

void checkStatus(int status) {
  if (status >= 200 && status < 300) {
    developer.log('succsessful');
  } else {
    developer.log('not sucssess');
  }

  // static Future<String> head(String http, Map<String, dynamic> body) async {
  //   try {
  //     String query = '';
  //     body.forEach((key, value) {
  //       query += '$key=$value';
  //       query += '&';
  //     });
  //     query = query.substring(0, query.length - 1);
  //     developer.log(query);
  //     Uri url = Uri.parse('$http?$query');
  //     final response = await https.head(url);
  //     String body = json.decode(response.body);
  //     developer.log(json.decode(response.body).toString());

  //     developer.log(body[0].toString());
  //     return body;
  //   } catch (e) {
  //     developer.log(e.toString());
  //     return '';
  //   }
  // }
}
