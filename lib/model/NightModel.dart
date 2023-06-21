class Night_Model{

  String Night_Adkar;
  int Night_Repeat;

  Night_Model(this.Night_Adkar,this.Night_Repeat);

  Night_Model.map(){

   this.Night_Adkar ;
    this.Night_Repeat;
  }

  Night_Model.fromMap(Map<String,dynamic> map){

    this.Night_Adkar =map['Night_Adkar'];
    this.Night_Repeat=map['Night_Repeat'];
  }

}