class Sleep_Model{

 String Sleep_Adkar;
 int Sleep_Repeat;

 Sleep_Model(this.Sleep_Adkar, this.Sleep_Repeat);

 Sleep_Model.fromMap(Map<String,dynamic>map){

   this.Sleep_Adkar=map['Sleep_Adkar'];
   this.Sleep_Repeat=map['Sleep_Repeat'];


 }
}


