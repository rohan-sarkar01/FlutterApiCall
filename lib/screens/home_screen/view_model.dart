
import 'package:flutter_api_call/screens/home_screen/services.dart';

class PublishViewModel {
  static Future getCommandRunViewModel() async {
    var responce=await PublishServices.publishReuest();
    return responce;
  }
}