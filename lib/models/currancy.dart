class Currancy{
  String name, symbol;

  Currancy({required this.name, required this.symbol});

  factory Currancy.Json(dynamic json){
    return Currancy(name: json['name']?? "", symbol: json['symbol']?? "");


  }
}