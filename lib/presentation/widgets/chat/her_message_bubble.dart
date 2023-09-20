import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.secondary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Laboris exercitation',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 5),

        _ImageBubble(),
        // Todo: image

        const SizedBox(height: 10),
      ],
    );
  }
}


class _ImageBubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    print(size);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network("https://media.tenor.com/AzNJtG4GXToAAAAM/yes.gif",
      // para establcer que las imagenes sean solo de este tamano
      width: size.width * 0.7,
      height: 150,
      fit: BoxFit.cover, // Imagen redonda
      ));
  }
}
