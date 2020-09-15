import 'dart:convert';

import 'package:http/http.dart';
import 'package:silverliningspodcasts/src/helpers/constants.dart';
import 'package:silverliningspodcasts/src/helpers/secure_storage.dart';
import 'package:silverliningspodcasts/src/models/user.dart';

class ApiProvider {
  Client _client = Client();

//EXAMPLE CALL
  Future<List<User>> getUser(
    String commandName,
    Object critieria,
  ) async {
    try {
      final userSearchList = List<User>();

      final response = await _executeCommand(commandName, critieria);

      if (response['errors'] == null) {
        var participantList = response['Participant'];
        participantList.forEach(
          (item) => {
            userSearchList.add(
              User.fromJson(item),
            ),
          },
        );
        return userSearchList;
      } else {
        print(response);
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<User> login(String userName, String password) async {
    Response response;
    try {
      var command = NetworkConstants.login;
      var requestBody = _buildRequestBody(
        command,
        {"Username": userName, "Password": password, "ServiceToken": ""},
      );
      var baseUrl = NetworkConstants.baseUrl;

      response = await _client.post(
        '$baseUrl/$command',
        body: requestBody,
        headers: {
          "Content-Type": "application/json",
        },
      );
      var succeeded = await json.decode(response.body)['Succeeded'];
      if (succeeded) {
        var cookieHeader = response.headers['set-cookie'];
        secureStorage.storage
            .write(key: StorageKeyConstants.cookies, value: cookieHeader);

        var xsrfToken = cookieHeader
            .split("XSRF-TOKEN=")[1]
            .split(';')[0]
            .replaceAll('%2F', '/');
        secureStorage.storage
            .write(key: StorageKeyConstants.xsrfToken, value: xsrfToken);
        var user =
            User.fromJson(json.decode(response.body)['Payload']['UserInfo']);
        return user;
      } else {
        print(await json.decode(response.body));
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<Map<String, dynamic>> _executeCommand(
      commandName, Object requestbody) async {
    var response = await _client.post(
      '${NetworkConstants.baseUrl}/$commandName',
      headers: await _buildHeaders(),
      body: _buildRequestBody(commandName, requestbody),
    );

    var succeeded = await json.decode(response.body)['Succeeded'];
    if (succeeded) {
      var payload = await json.decode(response.body)["Payload"];
      return payload;
    } else {
      print(response.body);
      return {"errors": await json.decode(response.body)['ValidationResults']};
    }
  }

  String _buildRequestBody(String commandName, Object payload) {
    return json.encode(
      {
        "CommandName": "$commandName",
        "PayLoadAsJson": payload == null ? '{}' : json.encode(payload),
        "TimeZoneOffsetFromGMT": 0
      },
    );
  }

  Future<Map<String, String>> _buildHeaders() async {
    final cookie = await secureStorage.storage.read(key: 'cookies');
    final token = await secureStorage.storage.read(key: 'xsrfToken');
    Map<String, String> headers = Map<String, String>();

    headers = <String, String>{
      "cookie": cookie,
      "Content-Type": "application/json",
      "X-XSRF-TOKEN": token,
    };

    return headers;
  }
}
