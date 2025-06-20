class IdOfferClubModel {
  List<int>? clubs;

  IdOfferClubModel({this.clubs});

  IdOfferClubModel.fromJson(Map<String, dynamic> json) {
    clubs = json['clubs'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clubs'] = this.clubs;
    return data;
  }
}
