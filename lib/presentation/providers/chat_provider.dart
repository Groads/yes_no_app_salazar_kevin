import 'package:flutter/material.dart';
import 'package:yes_no_app_salazar_kevin/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

 List<Message> messageList = [
  Message(
    text: 'Hola Ader',
    fromWho: FromWho.me,
    timestamp: DateTime.now(),
    isRead: true, // Asegúrate de añadir esto
  ),
  Message(
    text: '¿Lloras porque reprobaste tópicos?',
    fromWho: FromWho.me,
    timestamp: DateTime.now(),
    isRead: true, // Asegúrate de añadir esto
  ),
];



 //Controlador para manejar la posicion del scroll
 final ScrollController chatScrollController=ScrollController();


//instancia de la clase GetYesNoAnswer
final getYesNoAnswer = GetYesNoAnswer();


//Enviar mensaje
Future<void> sendMessage(String text) async {
  if (text.isEmpty) {
    return; // No envía el mensaje si está vacío
  }
    
    //El mensaje siempre va a ser "me" porque yo lo envio
    final newMessage= Message(text: text, fromWho: FromWho.me,timestamp: DateTime.now(),isRead: true);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
    print("Cantidad de mensajes en la lista: ${messageList.length}");
    if(text.endsWith('?')){
      herReply();
    }
   //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
}
  
//Mover el scroll al ultimo mensaje

Future<void> moveScrollToBottom() async{
  if (chatScrollController.hasClients){
  //Un pequeño atraso en la animacion para garantizar que siempre
  // se vera aun cuando se envien mensajes cortos y rapidos
    await Future.delayed(const Duration(seconds: 1));
    chatScrollController.animateTo(
      //Offset:Posicion de la animacion
      //maxScrollExtent determina lo maximo que el scrool puede dar
      chatScrollController.position.maxScrollExtent, 
      //duracion de la animacion
      duration: const Duration(microseconds: 300), 
      //"Rebote" al final de la animacion
      curve: Curves.easeOut);
     }
       }
       
         Future<void> herReply() async {
           //Obtener el mensaje de la peticion
           final herMessage= await getYesNoAnswer.getAnswer();
           //Añadir el mensaje de mi crush
           messageList.add(herMessage);
           //Notifica si algo de provider cambio para el estado
           notifyListeners();
           //mueve el croll hasta el ultimo mensaje recibido
           moveScrollToBottom();
         }
 
}


//¿Cual es el equivalente del future en JavaScript? Promesa