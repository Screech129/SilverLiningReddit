import 'dart:convert';

import 'package:http/http.dart';
import 'package:silverliningsreddit/src/dtos/dtos.dart';
import 'package:silverliningsreddit/src/helpers/helpers.dart';
import 'package:silverliningsreddit/src/models/models.dart';

class ApiProvider {
  Client _client = Client();

  Future<List<Subreddit>> getSubscribedSubreddits(String token) async {
    List<Subreddit> subreddits = List<Subreddit>();
    try {
      final response =
          await _executeCommand(UrlConstants.subscribedSubs, token);

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

  Future<List<Post>> getFrontPage(String token) async {
    List<Post> subreddits = List<Post>();
    try {
      final response = await _executeCommand('', token);

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

  Future<List<String>> getComments(String subreddit, String postId) async {
    try {
      var commentUrl =
          UrlConstants.defaulSubs + subreddit + UrlConstants.comments + postId;
      final response = await _executeCommand(commentUrl, null);

      if (response != null) {
        response.forEach((value) {
          var temp = value;
        });
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

  Future<List<dynamic>> _executeCommand(commandName, String token) async {
    var response = await _client.get(
      '${NetworkConstants.baseUrl}$commandName?raw_json=1',
      headers: token != null ? await _buildHeaders(token) : '',
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

  Future<Map<String, String>> _buildHeaders(String token) async {
    Map<String, String> headers = Map<String, String>();
    headers = <String, String>{"Authorization": "bearer $token"};

    return headers;
  }
}
