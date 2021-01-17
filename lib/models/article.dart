class Article {
  final String id;
  final String title;
  final String renderedBody;
  final String body;

  Article(this.title, this.id, this.body, this.renderedBody);

  Article.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        renderedBody = json["rendered_body"],
        body = json["body"];
}
