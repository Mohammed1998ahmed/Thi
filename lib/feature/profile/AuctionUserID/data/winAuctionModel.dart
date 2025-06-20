class WinAcutionModel {
  List<Auctions>? auctions;

  WinAcutionModel({this.auctions});

  WinAcutionModel.fromJson(Map<String, dynamic> json) {
    if (json['auctions'] != null) {
      auctions = <Auctions>[];
      json['auctions'].forEach((v) {
        auctions!.add(new Auctions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.auctions != null) {
      data['auctions'] = this.auctions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Auctions {
  int? id;
  String? end;
  String? begin;
  String? limit;
  int? winnerId;
  String? description;
  int? initialPrice;
  int? profileId;
  String? status;
  String? theOwner;
  String? theOwnerEmail;
  Horses? horses;

  Auctions(
      {this.id,
      this.end,
      this.begin,
      this.limit,
      this.winnerId,
      this.description,
      this.initialPrice,
      this.profileId,
      this.status,
      this.theOwner,
      this.theOwnerEmail,
      this.horses});

  Auctions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    end = json['end'];
    begin = json['begin'];
    limit = json['limit'];
    winnerId = json['winner_id'];
    description = json['description'];
    initialPrice = json['initialPrice'];
    profileId = json['profile_id'];
    status = json['status'];
    theOwner = json['theOwner'];
    theOwnerEmail = json['theOwnerEmail'];
    horses =
        json['horses'] != null ? new Horses.fromJson(json['horses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['end'] = this.end;
    data['begin'] = this.begin;
    data['limit'] = this.limit;
    data['winner_id'] = this.winnerId;
    data['description'] = this.description;
    data['initialPrice'] = this.initialPrice;
    data['profile_id'] = this.profileId;
    data['status'] = this.status;
    data['theOwner'] = this.theOwner;
    data['theOwnerEmail'] = this.theOwnerEmail;
    if (this.horses != null) {
      data['horses'] = this.horses!.toJson();
    }
    return data;
  }
}

class Horses {
  int? id;
  String? name;
  String? color;
  String? category;
  String? birth;
  String? gender;
  String? address;
  List<String>? images;
  String? video;
  int? auctionId;

  Horses(
      {this.id,
      this.name,
      this.color,
      this.category,
      this.birth,
      this.gender,
      this.address,
      this.images,
      this.video,
      this.auctionId});

  Horses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    color = json['color'];
    category = json['category'];
    birth = json['birth'];
    gender = json['gender'];
    address = json['address'];
    images = json['images'].cast<String>();
    video = json['video'];
    auctionId = json['auction_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['color'] = this.color;
    data['category'] = this.category;
    data['birth'] = this.birth;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['images'] = this.images;
    data['video'] = this.video;
    data['auction_id'] = this.auctionId;
    return data;
  }
}
