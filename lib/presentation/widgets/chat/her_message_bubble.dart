import 'package:flutter/material.dart';

import '../../../domain/entities/message.dart';

class HerMessageBubble extends StatelessWidget {

  final Message message;
  
  // Constructor
  const HerMessageBubble({
    super.key, 
    required this.message
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              message.text,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(message.imageUrl!),
        // Todo: image

        const SizedBox(height: 10),
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {

  final String imageUrl;

  const _ImageBubble(this.imageUrl);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        // para establcer que las imagenes sean solo de este tamano
        width: size.width * 0.7,
       height: 150,
        fit: BoxFit.cover, // Imagen redonda
        loadingBuilder: (context, child, loadingProgress){
        
        if( loadingProgress == null) return child;

        return Container(
          width: size.width * 0.7,
          height: 150,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: const Text('Mi amor esta enviando una imagen'),
        );
      } ,
      ));
  }
}
