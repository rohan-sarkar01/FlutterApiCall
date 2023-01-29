import 'package:flutter/cupertino.dart';
import 'package:flutter_api_call/screens/charging_of_charger/services.dart';

class ChargingViewModel with ChangeNotifier{

   Future getChargingViewModel() async {
    var responce=await ChargingServices.getChargingServices();
    return responce;
  
  }
}