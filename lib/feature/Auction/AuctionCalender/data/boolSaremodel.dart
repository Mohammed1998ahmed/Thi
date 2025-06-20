class BoolShareAuction {
  List<int>? auctions;

  BoolShareAuction({this.auctions});

  BoolShareAuction.fromJson(Map<String, dynamic> json) {
    auctions = json['auctions'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auctions'] = this.auctions;
    return data;
  }
}
