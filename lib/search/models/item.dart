import 'package:githubsearch/search/models/license.dart';
import 'package:githubsearch/search/models/owner.dart';

class Item {
  int id;
  String nodeId;
  String name;
  String fullName;
  bool private;
  Owner owner;
  String htmlUrl;
  dynamic description;
  String url;
  int stargazersCount;
  DateTime createdAt;
  DateTime updatedAt;
  String language;
  License license;

  Item({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.url,
    this.stargazersCount,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.license,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    nodeId: json["node_id"],
    name: json["name"],
    fullName: json["full_name"],
    private: json["private"],
    owner: Owner.fromJson(json["owner"]),
    htmlUrl: json["html_url"],
    description: json["description"],
    url: json["url"],
    stargazersCount: json["stargazers_count"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    language: json["language"],
    license: json["license"] != null ? License.fromJson(json["license"]) : null,
  );
  Map<String, dynamic> toJson() => {
    "id": id,
    "node_id": nodeId,
    "name": name,
    "full_name": fullName,
    "private": private,
    "owner": owner.toJson(),
    "html_url": htmlUrl,
    "description": description,
    "url": url,
    "stargazers_count": stargazersCount,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "language": language,
    "license": license.toJson(),
  };
}
