import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:project_1/model/user.dart';

class ApiServices{
  String endpoint = 'http://192.168.0.201/Project1/api.php';
  Future<List<UserModel>> getUsers() async {
      Response response = await get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        final List result = jsonDecode(response.body);
        return result.map((e) => UserModel.fromJson(e)).toList();
      } else {
        throw Exception(response.reasonPhrase);
      }
    }
}

final userProvider = Provider<ApiServices>((ref)=>ApiServices());