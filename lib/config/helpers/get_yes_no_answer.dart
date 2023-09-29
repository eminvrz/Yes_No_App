import 'package:dio/dio.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

import '../../domain/entities/message.dart';

// Para hacer las peticiones lo realizamos con Dio
class GetYesNoAnswer {
  // Propiedades
  final _dio = Dio();

  Future<Message> getAnswer() async { 
    
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJsonMap(response.data);

    return yesNoModel.toMessageEntity();
  }
}
