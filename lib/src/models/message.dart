enum MessageRole { user, assistant, system }

class Message {
  final MessageRole role;
  final String content;
  final DateTime timestamp;

  Message({
    required this.role,
    required this.content,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}
