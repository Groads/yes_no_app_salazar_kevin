import 'package:flutter/material.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

 List<Message> messageList= [
     Message(text: 'Hola Ader', fromWho: FromWho.me),
     Message(text: '¿Lloras porque reprobaste topicos?',  fromWho: FromWho.me)

 ];
 //Controlador para manejar la posicion del scroll
 final ScrollController chatScrollController=ScrollController();


//Enviar mensaje
Future<void> sendMessage(String text) async {
    //El mensaje siempre va a ser "me" porque yo lo envio
    final newMessage= Message(text: text, fromWho: FromWho.me);
    //Agrega un elemento a la lista "messageList"
    messageList.add(newMessage);
   //Notifica si algo de provider cambio para que se guarde en el estado
    notifyListeners();
    //Mueve el scroll
    moveScrollToBottom();
}
  
//Mover el scroll al ultimo mensaje

Future<void> moveScrollToBottom() async{
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


