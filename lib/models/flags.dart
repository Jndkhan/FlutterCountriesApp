class Flags{
  String png;
  String svg;

  Flags({required this.png, required this.svg});


  factory Flags.Json (dynamic json){
    return Flags(png: json['png'], svg: json['svg']);
  }


}