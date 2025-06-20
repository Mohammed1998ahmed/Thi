class ProfileAuctionModel {
  String? message;
  List<Auctions>? auctions;
  bool? status;

  ProfileAuctionModel({this.message, this.auctions, this.status});

  ProfileAuctionModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['auctions'] != null) {
      auctions = <Auctions>[];
      json['auctions'].forEach((v) {
        auctions!.add(new Auctions.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.auctions != null) {
      data['auctions'] = this.auctions!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class Auctions {
  int? id;
  String? end;
  String? begin;
  String? limit;
  String? description;
  int? initialPrice;
  int? profileId;
  String? status;
  TimeLeft? timeLeft;
  String? theOwner;
  String? theOwnerEmail;
  String? offeredPrice;
  Horses? horses;

  Auctions(
      {this.id,
      this.end,
      this.begin,
      this.limit,
      this.description,
      this.initialPrice,
      this.profileId,
      this.status,
      this.timeLeft,
      this.theOwner,
      this.theOwnerEmail,
      this.offeredPrice,
      this.horses});

  Auctions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    end = json['end'];
    begin = json['begin'];
    limit = json['limit'];
    description = json['description'];
    initialPrice = json['initialPrice'];
    profileId = json['profile_id'];
    status = json['status'];
    timeLeft = json['timeLeft'] != null
        ? new TimeLeft.fromJson(json['timeLeft'])
        : null;
    theOwner = json['theOwner'];
    theOwnerEmail = json['theOwnerEmail'];
    offeredPrice = json['offeredPrice'];
    horses =
        json['horses'] != null ? new Horses.fromJson(json['horses']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['end'] = this.end;
    data['begin'] = this.begin;
    data['limit'] = this.limit;
    data['description'] = this.description;
    data['initialPrice'] = this.initialPrice;
    data['profile_id'] = this.profileId;
    data['status'] = this.status;
    if (this.timeLeft != null) {
      data['timeLeft'] = this.timeLeft!.toJson();
    }
    data['theOwner'] = this.theOwner;
    data['theOwnerEmail'] = this.theOwnerEmail;
    data['offeredPrice'] = this.offeredPrice;
    if (this.horses != null) {
      data['horses'] = this.horses!.toJson();
    }
    return data;
  }
}

class TimeLeft {
  int? daysLeft;
  int? hoursLeft;
  int? minutesLeft;

  TimeLeft({this.daysLeft, this.hoursLeft, this.minutesLeft});

  TimeLeft.fromJson(Map<String, dynamic> json) {
    daysLeft = json['days left : '];
    hoursLeft = json['hours left : '];
    minutesLeft = json['minutes left : '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['days left : '] = this.daysLeft;
    data['hours left : '] = this.hoursLeft;
    data['minutes left : '] = this.minutesLeft;
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
