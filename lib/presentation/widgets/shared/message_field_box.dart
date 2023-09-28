import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {

  // Quiero que este onValue sea igual o similar al onFieldSubbmited de la linea 42, de tipo ValueChanged
  final ValueChanged<String> onValue;

  // y siempre sera obligatorio 
  const MessageFieldBox({ 
    super.key, 
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
        hintText: 'End your message with a "??"',
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
    );

    return TextFormField(
      
      onTapOutside: (event) {
        // cuando yo haga click afuera este input, se removera el focus
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        // onSubmitted cuando presione enter o cuando envie el mensaje
        textController.clear();
        focusNode.requestFocus();
        onValue(value);
      },
    );
  }
}
