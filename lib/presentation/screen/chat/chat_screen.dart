import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_salazar_kevin/domain/entities/message.dart';
import 'package:yes_no_app_salazar_kevin/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_salazar_kevin/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_salazar_kevin/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_salazar_kevin/presentation/widgets/chat/shared/message_field_box.dart';


 class ChatScreen extends StatelessWidget {
  const ChatScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
  leading: const Padding(
    padding: EdgeInsets.all(4.0),
    child: CircleAvatar(
      backgroundImage: NetworkImage('https://images.crunchbase.com/image/upload/c_thumb,h_256,w_256,f_auto,g_face,z_0.7,q_auto:eco,dpr_1/bjmk3buzj92rirsqn0vy'),
    ),
  ),
  title: const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Text('Jakipz❤️'),
       SizedBox(height: 5),
       Text(
        'en línea',
        style: TextStyle(fontSize: 12, color: Colors.green),
      ),
    ],
  ),
  centerTitle: false,
),
      body: _ChatView() ,
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {


    final chatProvider = context.watch<ChatProvider>();
  

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:5),
        child: Column(
        children: [
            
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder:(context, index) {
                //instancia del message que sabra de quien es el mensaje
                final message = chatProvider.messageList[index];

                return( message.fromWho == FromWho.hers)
                ? HerMessageBubble(message: message,)
                : MyMessageBubble(message:message,);
              })),
            
          /// Caja de texto
          MessageFieldBox(onValue: chatProvider.sendMessage,),
          //que se guarde el mensaje enviado
         ],
        ),
      ),
    );
  }
}