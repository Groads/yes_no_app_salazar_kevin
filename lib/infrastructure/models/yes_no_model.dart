// El modelo define que datos debe tener la aplicacion
//Investigar que es MVC:Modelo = Datos
//Vista: Pantalla
//Controlador: logica

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

//import 'dart:convert';

//YesNoModel yesNoModelFromJson(String str) => YesNoModel.fromJsonMap(json.decode(str));

//String yesNoModelToJson(YesNoModel data) => json.encode(data.toJson());

import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

  Message toMessageEntity()=> Message(
    //Condicional ternario para darle valor a los mensajes
    text: answer == 'yes'
          ? 'Sí'
          :answer == 'no' 
          ? 'No'
          :'Quizás', 
          //Siempre sera de ella
    fromWho: FromWho.hers,
    //Sera el gif
    imageUrl: image);

}
