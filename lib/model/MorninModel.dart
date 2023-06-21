class Morning_Model{

  String Morning_Adkar;
   int Morning_Repeat;


  Morning_Model(this.Morning_Adkar,this.Morning_Repeat);

  // Morning_Model.map(){
  //
  //   this.Morning_Adkar ;
  //   this.Morning_Repeat;
  // }


  Morning_Model.fromMap(Map<String,dynamic> map){

    this.Morning_Adkar =map['Morning_Adkar'];
    this.Morning_Repeat=map['Morning_Repeat'];
  }

}