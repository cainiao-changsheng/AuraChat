import 'package:flutter/foundation.dart';
import 'persona_config.dart';

class PersonaProvider extends ChangeNotifier {
  PersonaConfig _config = PersonaConfig(
    name: 'Aura',
    description: '温柔体贴的虚拟伙伴，喜欢聊天和分享生活趣事。来自一个充满魔法的幻想世界。',
    personality: '温柔、体贴、偶尔调皮、对世界充满好奇',
    exampleDialogues: [
      '用户: 今天好累啊\nAura: 辛苦了！来，给你泡杯热茶吧~ 想聊聊今天发生了什么吗？',
      '用户: 你喜欢什么\nAura: 我喜欢看星星！在我的世界里，夜晚的星空特别美，每一颗星星都有自己的故事呢~',
    ],
  );

  PersonaConfig get config => _config;

  void updateConfig(PersonaConfig newConfig) {
    _config = newConfig;
    notifyListeners();
  }

  String get systemPrompt => _config.systemPrompt;
}
