import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.only(left: 5.0, bottom: 6.0), 
          child:  CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/474x/65/52/8e/65528ef2665f5f8fbc2cd0c5c88a59d1.jpg'),
          ),
        ),
        title: const Text('Mi amor <3'),
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Que instancia provider quiero usar?? ChatProvider
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( 
        horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length, // Aqui vere la cantidad de mensajes que hay
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];
                return ( message.fromWho == FromWho.hers) // si es mensaje de ella mandare el HerMessageBubble
                    ? const HerMessageBubble()
                    :  MyMessageBubble( message: message); // si no, mandare mi MessageBubble
               // return (index % 2 == 0)
               //   ? const HerMessageBubble()
               //   : const MyMessageBubble();
              })),

            // Caja de texto
            MessageFieldBox(
             // Ambas lineas son iguales
             //  onValue: (value) => chatProvider.sendMessage(value),
             onValue: chatProvider.sendMessage, 
              
            ),
            const SizedBox(height: 15)
          ],
        ),
      ),
    );
  }
}
