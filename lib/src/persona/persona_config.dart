class PersonaConfig {
  String name;
  String description;
  String personality;
  List<String> exampleDialogues;
  String avatarPath;

  PersonaConfig({
    this.name = '未命名角色',
    this.description = '',
    this.personality = '友好、开朗',
    this.exampleDialogues = const [],
    this.avatarPath = '',
  });

  String get systemPrompt => '''
你是$name。$description

性格特征：$personality

示例对话：
${exampleDialogues.join('\n')}

请始终以角色的身份和语气回复，保持性格一致。
''';
}
