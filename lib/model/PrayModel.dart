class Pray_Model{


  String Pray_Adkar;
  int Pray_Repeat;

  Pray_Model(this.Pray_Adkar, this.Pray_Repeat);

  Pray_Model.fromMap(Map<String,dynamic>map){

    this.Pray_Adkar=map['Pray_Adkar'];
    this.Pray_Repeat=map['Pray_Repeat'];


  }
}


