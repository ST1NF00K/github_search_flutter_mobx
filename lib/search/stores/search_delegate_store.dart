import 'package:githubsearch/search/models/github_repositories.dart';
import 'package:githubsearch/search/services/github_service.dart';
import 'package:githubsearch/search/services/rest_github_service.dart';
import 'package:mobx/mobx.dart';

part 'search_delegate_store.g.dart';


class SearchDelegateStore = _SearchDelegateStore with _$SearchDelegateStore;

abstract class _SearchDelegateStore with Store {

  final GithubService _githubService;

  _SearchDelegateStore(this._githubService);

  @observable
  String query = '';

  @observable
  ObservableFuture<GithubRepositories> results = ObservableFuture.value(new GithubRepositories(items: []));

  @action
  void setQuery(String param){
   query = param;
  }

  @action
   void search(){
    results = _githubService.getRepositories(query).asObservable();
  }

}