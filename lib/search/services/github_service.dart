import 'package:githubsearch/search/models/github_repositories.dart';

abstract class GithubService {

  Future<GithubRepositories> getRepositories(String name);

}