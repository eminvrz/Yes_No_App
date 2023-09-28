// Codigo puro de dart
enum   FromWho{ me, hers} // enumeracion: mio o de ella
class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho
  });
}
