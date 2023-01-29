import 'package:flutter/cupertino.dart';
import 'package:flutter_api_call/screens/command_run/services.dart';

class CommandRunViewModel with ChangeNotifier{
   Future getCommandRunViewModel() async {
    var responce=await CommandRunServices.getCommandRunServices();
    return responce;
  }
}