import 'dart:convert';

import 'package:learning_app_benaya/data/model/post.dart';
import 'package:learning_app_benaya/service/data_repository.dart';

class ApiRepository {
  final DataService dataService;

  ApiRepository({required this.dataService});
  Future<List<Post>> getPostsList() async {
    final response = await dataService.getPosts();
    if (response!.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final posts = json.map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw Exception('Failed to load Posts');
    }
  }
}
