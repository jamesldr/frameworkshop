class RatingsModel {
  double? rate;
  int? count;

  RatingsModel({this.rate, this.count});

  RatingsModel.fromJson(Map<String, dynamic> json) {
    rate =
        json['rate'] is int ? (json['rate'] as int).toDouble() : json['rate'];
    count = json['count'] is int ? json['count'] : int.tryParse(json['count']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
