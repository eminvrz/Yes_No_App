import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final ScrollController chatScrollController = ScrollController();

  List<Message> messageList = [
     Message(text: 'Hola amor!', fromWho: FromWho.me),
     Message(text: 'Ya regresastes del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{

    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // Esto se usa para los providers, para notificar a los demas que de este provider algo cambio
    // que seria notificado al chatScreen en la linea 34
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {

    await Future.delayed(const Duration(milliseconds: 100));
    
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
    );
  }


}
