class ClubIDCategoriesModel {
  List<Clubs>? clubs;
  bool? status;

  ClubIDCategoriesModel({this.clubs, this.status});

  ClubIDCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['clubs'] != null) {
      clubs = <Clubs>[];
      json['clubs'].forEach((v) {
        clubs!.add(new Clubs.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.clubs != null) {
      data['clubs'] = this.clubs!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Clubs {
  int? id;
  String? name;
  String? address;
  String? description;
  String? profile;
  String? day;
  String? start;
  String? end;
  String? license;
  String? website;
  String? lat;
  String? long;
  int? userId;
  String? createdAt;
  String? updatedAt;

  Clubs(
      {this.id,
      this.name,
      this.address,
      this.description,
      this.profile,
      this.day,
      this.start,
      this.end,
      this.license,
      this.website,
      this.lat,
      this.long,
      this.userId,
      this.createdAt,
      this.updatedAt});

  Clubs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    profile = json['profile'];
    day = json['day'];
    start = json['start'];
    end = json['end'];
    license = json['license'];
    website = json['website'];
    lat = json['lat'];
    long = json['long'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['description'] = this.description;
    data['profile'] = this.profile;
    data['day'] = this.day;
    data['start'] = this.start;
    data['end'] = this.end;
    data['license'] = this.license;
    data['website'] = this.website;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
