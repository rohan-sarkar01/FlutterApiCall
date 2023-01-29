import 'package:flutter/cupertino.dart';
import 'package:flutter_api_call/screens/charger_status/services.dart';

class ChargerStatusViewModel with ChangeNotifier{

  Future getChargerStatusViewModel() async {
    var responce=await ChargerStatusServices.getChargerStatusServices();
    return responce;
  }
}