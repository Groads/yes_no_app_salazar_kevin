import 'package:flutter/material.dart';
import 'package:yes_no_app_salazar_kevin/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app_salazar_kevin/presentation/widgets/chat/my_message_bubble.dart';


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
        title: const Text('Jakipz❤️') ,
        centerTitle: false,
      ),
      body: _ChatView() ,
    );
  }
}

class _ChatView extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
        children: [
            
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder:(context, index) {
                return (index % 2 == 0)
                ? const HerMessageBubble()
                : const MyMessageBubble();
              })),
            
             
           Text('Mundo'),
         ],
        ),
      ),
    );
  }
}