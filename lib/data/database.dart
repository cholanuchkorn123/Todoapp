import 'package:dbcrypt/dbcrypt.dart';
import 'package:hive/hive.dart';

class TodoDataBase {
  String username = '';
  String pincode = '';
  List<String> deleteItem = [];
  final _todoStore = Hive.box('boxtodo');
  //local username
  void updateTodousename() {
    _todoStore.put("USERNAME", username);
  }

  //local pincode save and bcrypt
  void updateTodopincode(String pincode) {
    String hashedPassword = DBCrypt().hashpw(pincode, DBCrypt().gensalt());

    _todoStore.put('PINCODE', hashedPassword);
  }

  //local deleteitem to pull
  void updateDeleteItem(String id) {
    deleteItem = _todoStore.get('DELETEITEM')??[];
    deleteItem.add(id);
    _todoStore.put('DELETEITEM', deleteItem);
  }

  //check pincode in  local
  bool checkPincode(String pinNew) {
  
    pincode = _todoStore.get("PINCODE") ?? "";
    return DBCrypt().checkpw(pinNew, pincode);
  }

  void loadData() {
    username = _todoStore.get("USERNAME") ?? "";
    deleteItem = _todoStore.get('DELETEITEM') ?? [];
  }

  bool isPincodeEmpty() {
    pincode = _todoStore.get("PINCODE") ?? "";
    return pincode.isEmpty;
  }

  bool isUsernameEmpty() {
    username = _todoStore.get("USERNAME") ?? "";
    return username.isEmpty;
  }
}
