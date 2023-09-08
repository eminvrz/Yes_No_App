import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding:  EdgeInsets.all(3.0),
          child:  CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/474x/65/52/8e/65528ef2665f5f8fbc2cd0c5c88a59d1.jpg'),
          ),
        ),
        title: const Text('Mi amor <3'),
      ),
    );
  }
}
