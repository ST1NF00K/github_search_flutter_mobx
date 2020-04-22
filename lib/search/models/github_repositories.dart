import 'dart:convert';

import 'package:githubsearch/search/models/item.dart';

GithubRepositories githubRepositoriesFromJson(String str) => GithubRepositories.fromJson(json.decode(str));

String githubRepositoriesToJson(GithubRepositories data) => json.encode(data.toJson());

class GithubRepositories {
  int totalCount;
  bool incompleteResults;
  List<Item> items;

  GithubRepositories({
    this.totalCount,
    this.incompleteResults,
    this.items,
  });

  factory GithubRepositories.fromJson(Map<String, dynamic> json) => GithubRepositories(
    totalCount: json["total_count"],
    incompleteResults: json["incomplete_results"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_count": totalCount,
    "incomplete_results": incompleteResults,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
  };
}
