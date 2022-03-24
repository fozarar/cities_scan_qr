class ResponseModel {
  String? name;
  String? created;
  String? description;
  String? image;
  List<Populations>? populations;
  String? id;

  ResponseModel(
      {this.name,
      this.created,
      this.description,
      this.image,
      this.populations,
      this.id});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    created = json['created'];
    description = json['description'];
    image = json['image'];
    if (json['populations'] != null) {
      populations = <Populations>[];
      json['populations'].forEach((v) {
        populations!.add(Populations.fromJson(v));
      });
    }
    id = json['id'];
  }
}

class Populations {
  int? year;
  String? population;

  Populations({this.year, this.population});

  Populations.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    population = json['population'];
  }
}
