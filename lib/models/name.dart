class Name{

  String common;
  String official;

  Name({required this.common, required this.official});


  factory Name.Json(dynamic json){
    return Name(common: json['common']?? "", official: json['official']?? "");
  }

}