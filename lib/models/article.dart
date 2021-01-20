class Article {
  final String id;
  final String title;
  final String renderedBody;
  final String body;
  final int likesCount;

  Article(this.title, this.id, this.body, this.renderedBody, this.likesCount);

  Article.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        renderedBody = json["rendered_body"],
        body = json["body"],
        likesCount = json["likes_count"];
}
