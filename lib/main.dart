import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:githubsearch/search/models/github_repositories.dart';
import 'package:githubsearch/search/services/rest_github_service.dart';
import 'package:githubsearch/search/stores/search_delegate_store.dart';
import 'package:githubsearch/search/widgets/github_item_widget.dart';
import 'package:mobx/mobx.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Github Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SearchDelegateStore _searchDelegateStore;

  @override
  void initState() {
    _searchDelegateStore = SearchDelegateStore(new RestGithubService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Github Search"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              TextField(
                onChanged: _searchDelegateStore.setQuery,
                onSubmitted:(s) => _searchDelegateStore.search(),
              ),
              Expanded(
                child: Observer(builder: (_) {
                  final items = _searchDelegateStore.results?.value?.items;
                  if (_searchDelegateStore.query.isEmpty) {
                    return Container(
                      child: Text("Search"),
                    );
                  }
                  if (_searchDelegateStore.results.status ==
                      FutureStatus.rejected) {
                    print(_searchDelegateStore.results.error);
                    return Container(
                      color: Colors.red,
                      child: Text("Houve um problema ao carregar os resultados",
                          style: TextStyle(color: Colors.white)),
                    );
                  } else if (_searchDelegateStore.results.status ==
                      FutureStatus.pending) {
                    return Container(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                  if(items.isEmpty) {
                    return Container( child : Center(child: Text("Repositório não encontrado")));
                  }
                  return ListView.separated(
                    itemCount: items?.length,
                    itemBuilder: (BuildContext context, int i) {
                      var item = items[i];
                      return GithubItemWidget(
                        projectDirectory: Text("${item.fullName}"),
                        description: Text("${item.description}"),
                        stars: FlatButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.star,
                            color: Colors.black,
                          ),
                          focusColor: Colors.blueAccent[700],
                          label: Text("${item.stargazersCount}"),
                        ),
                        language: Text("${item.language}"),
                        updatedAt: Text("${item.updatedAt}"),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
