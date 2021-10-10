import 'package:breakingbad/bussiness_logic/conestants/strings.dart';
import 'package:dio/dio.dart';

class CharacterApi {
  Dio? dio;

  CharacterApi() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacters() async{
    try{
      Response response = await dio!.get('characters');
      // print(response.data.tostring());
      return response.data;
    }catch(e){
      print('${e.toString()} eee');
      return [];
    }
  }
}