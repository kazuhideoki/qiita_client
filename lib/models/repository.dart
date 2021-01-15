

class Repository {
  final int id;
  final String name;

  Repository(this.name, this.id);

  Repository.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"];

}