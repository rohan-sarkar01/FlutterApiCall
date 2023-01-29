// import 'package:flutter_api_callservices/api_services.dart';
// import 'package:flutter_api_callutils/constant.dart';

import '../../services/api_services.dart';
import '../../utils/constant.dart';

class ChargerStatusServices{
  static Future getChargerStatusServices() async {
    try{
       var response = await ApiServices.getRequest(url:ApiUrl.baseUrl+ApiUrl.chargerState);
        if(response.statusCode==200){
        return response.body;
       }else{
        print("Faild to call API, Status code = ${response.statusCode}");
       }
    }catch(e){
      throw "Error While Retrieving Data API $e";
    }
  }
}