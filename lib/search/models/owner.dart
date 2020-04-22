class Owner {
  String login;
  int id;
  String url;
  String starredUrl;

  Owner({
    this.login,
    this.id,
    this.url,
    this.starredUrl,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
    login: json["login"],
    id: json["id"],
    url: json["url"],
    starredUrl: json["starred_url"],
  );

  Map<String, dynamic> toJson() => {
    "login": login,
    "id": id,
    "url": url,
    "starred_url": starredUrl,
  };
}