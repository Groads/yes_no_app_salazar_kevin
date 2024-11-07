import 'package:dio/dio.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';

class GetYesNoAnswer {

  //Se crea instancia de la clase dio 
  //Para majera las peticiones de HTTP
  final _dio = Dio();

//Obtener la respuesta
Future<Message> getAnswer() async{
  //Almacenar la peticion GETen una variable 
  final Response = await _dio.get ('https://yesno.wtf/api');
  //Generar el error 
  throw UnimplementedError();
 
 }
}