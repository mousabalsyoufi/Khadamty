import 'package:flutter/material.dart';

// state management to manage state page
class BaseProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool _isError = false;


  bool get isLoading => _isLoading;
  bool get isError => _isError;


  set setLoading(bool loading){ _isLoading = loading; }
  set setError(bool error){_isError = error;}

  void updateUi(){
    notifyListeners();
  }

  void changeLoading(){
    _isLoading  = !_isLoading;
  }

  void changeError(){
    _isError  = !_isError;
  }


}