class Repository {
  final String id;
  final String title;
  final String rendered_body;
  final String body;

  Repository(this.title, this.id, this.body, this.rendered_body);

  Repository.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        title = json["title"],
        rendered_body = json["rendered_body"],
        body = json["body"];
}
