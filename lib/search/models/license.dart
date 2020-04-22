class License {
  String name;
  String url;

  License({
    this.name,
    this.url,
  });

  factory License.fromJson(Map<String, dynamic> json) => License(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}