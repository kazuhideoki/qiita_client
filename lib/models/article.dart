class Article {
  final String id;
  final String title;
  final String rendered_body;
  final String body;

  Article(this.title, this.id, this.body, this.rendered_body);

  Article.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        rendered_body = json["rendered_body"],
        body = json["body"];
}
