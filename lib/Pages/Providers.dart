import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePageModel extends ChangeNotifier {
  int _counterAll = 0;
  int _counterAll_completed = 0;
  int _counterM = 0;
  int _counterAll_M = 0;
  int _counterN = 0;
  int _counterAll_N = 0;
  int _counterS = 0;
  int _counterAll_S = 0;
  int _counterP = 0;
  int _counterAll_P = 0;
  bool Notification;
  double fontSize;

//=====================================Font Size======================
  void SetFontSize(double size)async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setDouble('FontSize', size);
  }

  Future<int>GetFontSize()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    fontSize=preferences.getDouble('FontSize')??15;
    //return fontSize;
    notifyListeners();

  }
  //==========================Notification=====================================

 void SetNotification(bool notify)async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   preferences.setBool('notify', notify);
 }

 void GetNotification()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   Notification = (prefs.getBool('notify') ?? false);
   notifyListeners();
 }


  //==============================إحصائيات ===================================================

// =============================================== Morning ===============================================

  void _setPrefMItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterM);
  }

  void _MorningPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterM = (prefs.getInt('MorningCount') ?? 0);
    notifyListeners();
  }

  addCounter(String Tu) {
    _counterM++;
    _setPrefMItems('$Tu');
    notifyListeners();

  }

  int getMCounter() {
    _MorningPrefItems();
    //notifyListeners();
    return _counterM;
  }

  // ==========================Night====================================================================

  void _setPrefNItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterN);
  }

  void _NightPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterN = (prefs.getInt('NightCount') ?? 0);
    notifyListeners();
  }

  int addCounter2(String Tu) {
    _counterN++;
    _setPrefNItems('$Tu');
    notifyListeners();

  }

  int getNCounter() {
    _NightPrefItems();
    //notifyListeners();
    return _counterN;
  }

  // ======================================Sleep=====================================

  void _setPrefSItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterS);
  }

  void _SleepPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterS = (prefs.getInt('SleepCount') ?? 0);
    notifyListeners();
  }

  int addCounter3(String Tu) {
    _counterS++;
    _setPrefSItems('$Tu');
   // notifyListeners();

  }

  int getSCounter() {
    _SleepPrefItems();
    //notifyListeners();
    return _counterS;
  }

  // ====================================Pray=============================================
  void _setPrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterP);
  }

  void _PrayPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterP = (prefs.getInt('PrayCount') ?? 0);
    notifyListeners();
  }

  int addCounterP(String Tu) {
    _counterP++;
    _setPrefPItems('$Tu');
    notifyListeners();

  }

  int getPCounter() {
    _PrayPrefItems();
    //notifyListeners();
    return _counterP;
  }

  // =====================================All================================

  void _setAllrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll);
  }

  void _AllrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll = (prefs.getInt('All') ?? 0);
    notifyListeners();
  }

  addAllCounter(String Tu) {
    _counterAll++;
    _setAllrefPItems('$Tu');
    //notifyListeners();

  }

  int getAllCounter() {
    _AllrefItems();
    //notifyListeners();
    return _counterAll;
  }

// ========================== AllMorning ==================================================

  void _setAllMrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll_M);
  }

  void _AllMPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll_M = (prefs.getInt('All_M') ?? 0);
    notifyListeners();
  }

  addAllMCounter(String Tu) {
    _counterAll_M++;
    _setAllMrefPItems('$Tu');
    notifyListeners();
    //return _counterAll_M;
  }

  int getAllMCounter() {
    _AllMPrefItems();
    //notifyListeners();
    return _counterAll_M;
  }

// ========================== AllNight==================================================

  void _setAllNrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll_N);
  }

  void _AllNrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll_N = (prefs.getInt('All_N') ?? 0);
    notifyListeners();
  }

  addAllNCounter(String Tu) {
    _counterAll_N++;
    _setAllNrefPItems('$Tu');
    notifyListeners();
   // return _counterAll_N;
  }

  int getAllNCounter() {
    _AllNrefItems();
    //notifyListeners();
    return _counterAll_N;
  }

// ========================== AllSleep ==================================================

  void _setAllSrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll_S);
  }

  void _AllSrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll_S = (prefs.getInt('All_S') ?? 0);
    notifyListeners();
  }

  addAllSCounter(String Tu) {
    _counterAll_S++;
    _setAllSrefPItems('$Tu');
   // notifyListeners();
    //return _counterAll_S;
  }

  int getAllSCounter() {
    _AllSrefItems();
    //notifyListeners();
    return _counterAll_S;
  }

  // ========================== AllPray ==================================================

  void _setAllPrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll_P);
  }

  void _AllPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll_P = (prefs.getInt('All_P') ?? 0);
    notifyListeners();
  }

  addAllPCounter(String Tu) {
    _counterAll_P++;
    _setAllPrefPItems('$Tu');
    // notifyListeners();
    // return _counterAll_P;
  }

  int getAllPCounter() {
    _AllPrefItems();
    //notifyListeners();
    return _counterAll_P;
  }

  // ========================== All_Completed ==================================================

  void _setAll_CompletedPrefPItems(String type) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('$type', _counterAll_completed);
  }

  void _All_CompletedPrefItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counterAll_completed = (prefs.getInt('All_Completed') ?? 0);
    notifyListeners();
  }

  addAll_CompletedCounter(String Tu) {
    _counterAll_completed++;
    _setAll_CompletedPrefPItems('$Tu');
    // notifyListeners();
    // return _counterAll_completed;
  }

  int getAll_CompletedCounter() {
    _All_CompletedPrefItems();
    //notifyListeners();
    return _counterAll_completed;
  }
}

///////////

class DuaPass extends ChangeNotifier {
  String DuaName = "";
  int duaRepeat = 0;

// DuaPass(this.DuaName, this.duaRepeat);

}
