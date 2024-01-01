import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart';
import 'network_response.dart';



class NetWorkCaller{

  Future<NetworkResponse>getRequest(String url)async{

    try {
      Response response = await get(Uri.parse(url));
      //final Map<String,dynamic> decodeResponse = jsonDecode(response.body);
      log(response.statusCode.toString());
      log(response.body);
      if (response.statusCode == 200){
        return NetworkResponse(true,response.statusCode, jsonDecode(response.body));
      }
      else {
        return NetworkResponse(false,response.statusCode,null);
      }
    }catch(e){
      log(e.toString());
    }
    return NetworkResponse(false,-1, null);
  }

}