/// day : "Mon"
/// date : 1

class WeekModel {
  WeekModel({
      String? day, 
      num? date,}){
    _day = day;
    _date = date;
}

  WeekModel.fromJson(dynamic json) {
    _day = json['day'];
    _date = json['date'];
  }
  String? _day;
  num? _date;
WeekModel copyWith({  String? day,
  num? date,
}) => WeekModel(  day: day ?? _day,
  date: date ?? _date,
);
  String? get day => _day;
  num? get date => _date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['day'] = _day;
    map['date'] = _date;
    return map;
  }

}