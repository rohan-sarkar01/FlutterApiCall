import 'dart:convert';
import 'package:http/http.dart' as http;
class ApiServices{

  static Future getRequest({required String url})async{
    var clint=http.Client();
    return await clint.get(Uri.parse(url));
  } 

  static Future postRequest({required String url,required Map<String,dynamic> body})async{
    var clint=http.Client();
    return await clint.post(Uri.parse(url),body: jsonEncode(body), headers: {"content-type" : "application/json"});
  } 
}