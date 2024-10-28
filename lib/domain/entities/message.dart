//Identidad atomica: la unidad mas pequeño de un sistema.
enum FromWho{me, him}

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;

  Message({required this.text,  this.imageUrl, required this.fromWho});
}
