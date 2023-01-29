

import 'package:flutter_api_call/services/api_services.dart';
import 'package:flutter_api_call/utils/constant.dart';

class CommandRunServices{
  static Future getCommandRunServices() async {
    try{
       var response = await ApiServices.getRequest(url:ApiUrl.baseUrl+ApiUrl.commandRun);
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