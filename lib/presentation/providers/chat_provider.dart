import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
     Message(text: 'Hola amor!', fromWho: FromWho.me),
     Message(text: 'Ya regresastes del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async{

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    // Esto se usa para los providers, para notificar a los demas que de este provider algo cambio
    // que seria notificado al chatScreen en la linea 34
    notifyListeners();
  }


}
