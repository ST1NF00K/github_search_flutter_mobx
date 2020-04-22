
import 'package:dio/dio.dart';
import 'package:githubsearch/search/models/github_repositories.dart';
import 'package:githubsearch/search/services/github_service.dart';

class RestGithubService implements GithubService{
  Dio dio = new Dio();
  final String _baseUrl = 'https://api.github.com/search/repositories';

  @override
  Future<GithubRepositories> getRepositories(String name) async{
    try{
      final response = await dio.get(_baseUrl, queryParameters: {"q": name});
        return GithubRepositories.fromJson(response.data);
    } catch(e) {
      print(e);
      rethrow;
    }

  }

}