import 'package:flutter/material.dart';

/// Character display widget.
/// Phase 1: Static image placeholder with Flutter native animations.
/// Phase 2 (Week 21-26): Replace with Live2D Cubism SDK.
class CharacterDisplay extends StatefulWidget {
  const CharacterDisplay({super.key});

  @override
  State<CharacterDisplay> createState() => _CharacterDisplayState();
}

class _CharacterDisplayState extends State<CharacterDisplay>
    with SingleTickerProviderStateMixin {
  late AnimationController _animController;
  late Animation<double> _breathAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);
    _breathAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.3),
            Theme.of(context).colorScheme.surface,
          ],
        ),
      ),
      child: AnimatedBuilder(
        animation: _breathAnimation,
        builder: (context, child) {
          return Transform.scale(
            scale: _breathAnimation.value,
            child: child,
          );
        },
        child: Container(
          width: 160,
          height: 160,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(
              image: AssetImage('assets/images/character_placeholder.png'),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2),
                blurRadius: 20,
                spreadRadius: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
