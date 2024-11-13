

enum FromWho { me, hers }

class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWho;
  final DateTime timestamp;
  final bool isRead;

  Message({
    required this.text,
    this.imageUrl,
    required this.fromWho,
    required this.timestamp,
    required this.isRead,
  });

  // Método para convertir JSON a una instancia de Message
  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      text: json['text'] ?? '',
      imageUrl: json['imageUrl'],
      fromWho: FromWho.values[json['fromWho'] ?? 0], // Asumiendo que 'fromWho' se almacena como un índice
      timestamp: DateTime.parse(json['timestamp']),
      isRead: json['isRead'] ?? true, // Valor por defecto si es nulo
    );
  }

  // Método para convertir una instancia de Message a JSON
  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'imageUrl': imageUrl,
      'fromWho': fromWho.index, // Convertir enum a índice
      'timestamp': timestamp.toIso8601String(),
      'isRead': isRead,
    };
  }
}







