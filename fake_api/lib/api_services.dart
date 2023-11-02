import 'dart:convert';

import 'package:fake_api/constants.dart';
import 'package:fake_api/post_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  Future<List<PostModel>?> fetchPosts() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.posts);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var l = json.decode(response.body);
        List<PostModel> model =
            List<PostModel>.from(l.map((model) => PostModel.fromJson(model)));
        print(model);
        return model;
      }
    } catch (e) {
      print('Error');
      return null;
    }
    return null;
  }
}
