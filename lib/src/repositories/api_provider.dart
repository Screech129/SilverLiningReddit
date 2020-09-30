import 'dart:convert';

import 'package:http/http.dart';
import 'package:silverliningsreddit/src/dtos/auth_response_dto.dart';
import 'package:silverliningsreddit/src/helpers/constants.dart';
import 'package:silverliningsreddit/src/models/post.dart';
import 'package:silverliningsreddit/src/models/subreddit.dart';
import 'package:silverliningsreddit/src/repositories/repository.dart';

class ApiProvider {
  Client _client = Client();

  Future<List<Subreddit>> getSubscribedSubreddits() async {
    List<Subreddit> subreddits = List<Subreddit>();
    try {
      final response = await _executeCommand(UrlConstants.subscribedSubs);

      if (response != null) {
        response.forEach((value) {
          subreddits.add(Subreddit.fromJson(value['data']));
        });
        return subreddits;
      } else {
        print(response);
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<List<Post>> getFrontPage() async {
    List<Post> subreddits = List<Post>();
    try {
      final response = await _executeCommand('');

      if (response != null) {
        response.forEach((value) {
          subreddits.add(Post.fromJson(value['data']));
        });
        return subreddits;
      } else {
        print(response);
        return null;
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  Future<AuthResponseDto> getAccessToken(String authToken) async {
    var encodedSecrets = utf8.encode("${NetworkConstants.clientIdRaw}:''");
    var rawBody = {
      "grant_type": "authorization_code",
      "code": "$authToken",
      "redirect_uri": NetworkConstants.redirectUriRaw
    };

    var response = await _client.post(
      NetworkConstants.tokenUrl,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Basic ${base64Encode(encodedSecrets)}"
      },
      body: rawBody,
      encoding: Encoding.getByName("utf-8"),
    );
    return AuthResponseDto.fromJson(json.decode(response.body));
  }

  Future<AuthResponseDto> refreshAccessToken(String refreshToken) async {
    var encodedSecrets = utf8.encode("${NetworkConstants.clientIdRaw}:''");
    var rawBody = {
      "grant_type": "refresh_token",
      "refresh_token": "$refreshToken"
    };

    var response = await _client.post(
      NetworkConstants.tokenUrl,
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
        "Authorization": "Basic ${base64Encode(encodedSecrets)}"
      },
      body: rawBody,
      encoding: Encoding.getByName("utf-8"),
    );
    return AuthResponseDto.fromJson(json.decode(response.body));
  }

  Future<List<dynamic>> _executeCommand(commandName) async {
    var response = await _client.get(
      '${NetworkConstants.baseUrl}$commandName?raw_json=1',
      headers: await _buildHeaders(),
    );

    var succeeded = await json.decode(response.body)['data'] != null;
    if (succeeded) {
      var payload = await json.decode(response.body)['data']['children'];
      return payload;
    } else {
      print(response.body);
      return null;
    }
  }

  Future<Map<String, String>> _buildHeaders() async {
    var token = await repository.getToken();
    Map<String, String> headers = Map<String, String>();
    headers = <String, String>{"Authorization": "bearer $token"};

    return headers;
  }
}
