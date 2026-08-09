import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'src/chat/chat_provider.dart';
import 'src/chat/chat_screen.dart';
import 'src/persona/persona_provider.dart';
import 'src/memory/memory_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MemoryService.instance.initialize();
  runApp(const AuraChatApp());
}

class AuraChatApp extends StatelessWidget {
  const AuraChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => PersonaProvider()),
      ],
      child: MaterialApp(
        title: 'AuraChat',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF7C4DFF),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
          fontFamily: 'NotoSansSC',
        ),
        home: const ChatScreen(),
      ),
    );
  }
}
