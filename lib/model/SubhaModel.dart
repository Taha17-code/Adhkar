class Subha_Model{
  String praise_Adkar;
  int praise_Repeat;

  Subha_Model(this.praise_Adkar, this.praise_Repeat);

  String get _praise_Adkar =>praise_Adkar;

  int  get _praise_Repeat => praise_Repeat;

  Subha_Model.map(dynamic obj){

    this.praise_Adkar=obj['_praise_Adkar'];
    this.praise_Repeat=obj['_praise_Repeat'];

  }




  Map<String,dynamic>toMap(){

    var map=new Map<String,dynamic>();
    map['praise_Adkar']= _praise_Adkar;
    map['praise_Repeat']= _praise_Repeat;

    return map;
  }


  Subha_Model.fromMap(Map<String,dynamic> map){

    this.praise_Adkar =map['praise_Adkar'];
    this.praise_Repeat=map['praise_Repeat'];
  }

}
