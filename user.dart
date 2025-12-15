import 'package:flutter/material.dart';
import 'package:task/model_class/task_class.dart';
class UserProvider extends ChangeNotifier{
  PriorityModel?_userModel;
  void setUser(PriorityModel val){
    _userModel= val;
notifyListeners();
  }
  PriorityModel?getUser()=>_userModel;
}