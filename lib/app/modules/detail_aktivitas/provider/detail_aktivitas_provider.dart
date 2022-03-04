import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AktivitasProvider extends GetConnect with ChangeNotifier {
  String id, tittle;
  bool status;

  AktivitasProvider({
    required this.id,
    required this.tittle,
    this.status = false,
  });

  void toogleStatus() {
    status = !status;
    notifyListeners();
  }
}
