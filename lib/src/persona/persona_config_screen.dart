import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'persona_provider.dart';

class PersonaConfigScreen extends StatefulWidget {
  const PersonaConfigScreen({super.key});

  @override
  State<PersonaConfigScreen> createState() => _PersonaConfigScreenState();
}

class _PersonaConfigScreenState extends State<PersonaConfigScreen> {
  late TextEditingController _nameController;
  late TextEditingController _descController;
  late TextEditingController _personalityController;

  @override
  void initState() {
    super.initState();
    final config = context.read<PersonaProvider>().config;
    _nameController = TextEditingController(text: config.name);
    _descController = TextEditingController(text: config.description);
    _personalityController = TextEditingController(text: config.personality);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _personalityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('角色设定')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: '角色名称',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descController,
            maxLines: 3,
            decoration: const InputDecoration(
              labelText: '角色描述',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _personalityController,
            maxLines: 2,
            decoration: const InputDecoration(
              labelText: '性格特征',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              context.read<PersonaProvider>().updateConfig(
                    context.read<PersonaProvider>().config
                      ..name = _nameController.text
                      ..description = _descController.text
                      ..personality = _personalityController.text,
                  );
              Navigator.pop(context);
            },
            icon: const Icon(Icons.save),
            label: const Text('保存设定'),
          ),
        ],
      ),
    );
  }
}
