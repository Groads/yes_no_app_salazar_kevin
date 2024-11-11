import 'package:dio/dio.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';
import 'package:yes_no_app_salazar_kevin/infrastructure/models/yes_no_model.dart';


class GetYesNoAnswer {

  //Se crea instancia de la clase dio 
  //Para majera las peticiones de HTTP
  final _dio = Dio();

//Obtener la respuesta
Future<Message> getAnswer() async{
  //Almacenar la peticion GETen una variable 
  final response = await _dio.get ('https://yesno.wtf/api');

  //Almacenar la data de la respuesta en una variable
  final yesNoModel= YesNoModel.fromJsonMap(response.data);

  //Devolver la instancia de "Message" creada en el modelo"
  return yesNoModel.toMessageEntity();
  
 
 }
}