import '../../services/api_services.dart';
import '../../utils/constant.dart';

class PublishServices{
  static Future publishReuest() async {
    try{
      var body = {
        "cp_cmd":8,
        "request_id":"sdjwheddw"
      };
      var response = await ApiServices.postRequest(
        url: ApiUrl.baseUrl+ApiUrl.publish,
        body: body
      );
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