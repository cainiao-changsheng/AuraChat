import 'package:flutter/foundation.dart';
import '../models/message.dart';
import '../memory/memory_service.dart';
import '../persona/persona_provider.dart';

class ChatProvider extends ChangeNotifier {
  final List<Message> _messages = [];

  List<Message> get messages => List.unmodifiable(_messages);

  void sendMessage(String text) {
    final userMsg = Message(role: MessageRole.user, content: text);
    _messages.add(userMsg);
    notifyListeners();

    // Simulate AI response (replace with real LLM call)
    _generateResponse(text);
  }

  Future<void> _generateResponse(String userInput) async {
    // Add loading indicator
    final loadingMsg = Message(role: MessageRole.assistant, content: '...');
    _messages.add(loadingMsg);
    notifyListeners();

    try {
      // Retrieve relevant memories
      final memories = await MemoryService.instance.search(userInput, topK: 3);
      final memoryContext = memories.join('\n');

      // TODO: Replace with real LLM API call
      await Future.delayed(const Duration(seconds: 1));
      final response = '收到你的消息了！这是一条模拟回复。\n记忆片段：$memoryContext';

      // Replace loading with real response
      _messages[_messages.length - 1] = Message(
        role: MessageRole.assistant,
        content: response,
      );

      // Store to memory
      await MemoryService.instance.add(userInput);
    } catch (e) {
      _messages[_messages.length - 1] = Message(
        role: MessageRole.system,
        content: '回复生成失败：$e',
      );
    }
    notifyListeners();
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}
