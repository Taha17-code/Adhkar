class  Dua_Model{

   String Dua_name;
  String Dua_Adkar;
  int Dua_Repeat;

   Dua_Model(this.Dua_name, this.Dua_Adkar, this.Dua_Repeat);

   Dua_Model.map(dynamic obj){

     this.Dua_name=obj['_Dua_name'];
     this.Dua_Adkar=obj['_Dua_Adkar'];
     this.Dua_Repeat=obj['_Dua_Repeat'];

   }

   String get _Dua_name =>Dua_name;
   String get _Dua_Adkar =>Dua_Adkar;
   int  get _Dua_Repeat => Dua_Repeat;


   Map<String,dynamic>toMap(){

     var map=new Map<String,dynamic>();
     map['Dua_name']= _Dua_name;
     map['Dua_Adkar']= _Dua_Adkar;
     map['Dua_Repeat']= _Dua_Repeat;

     return map;
   }


   Dua_Model.fromMap(Map<String,dynamic> map){

     this.Dua_name =map['Dua_name'];
     this.Dua_Adkar =map['Dua_Adkar'];
     this.Dua_Repeat=map['Dua_Repeat'];
   }


}