// Este modelo sera utilizado en el archivo get_yes_no_answer por si en algun caso la respuesta del api cambia el nombre de las variables, tendriamos que cambiar todas las variables de nuestro proyecto a como son exactamente, es por eso que creamos este modelo para solo cambiarlo desde aqui y no desde varios archivos.

// Este modelo tiene por objetivo mapear la respuesta de la api y despues creamos la instancia de la linea 18
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

     // el factory es utilizado por si en algun caso a la larga llame a este constructor, va a terminar creando una instancia que ocupamos
    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "answer": answer,
        "forced": forced,
        "image": image,
    };

    // Metodo para regresar un Message, se usa en el archivo get.yes.no.answer linea 17
    Message toMessageEntity() => Message(
      text: answer == 'yes' ? 'Si' : 'No',
      fromWho: FromWho.hers,
      imageUrl: image
    );
}
