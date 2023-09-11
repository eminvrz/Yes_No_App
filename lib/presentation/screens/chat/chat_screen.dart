import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';

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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return const MyMessageBubble();
              },
            )),
            const  Text('Mundo')
          ],
        ),
      ),
    );
  }
}
