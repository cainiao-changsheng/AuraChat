import 'package:flutter/foundation.dart';

/// Three-layer memory system:
/// - Short-term: in-memory recent chat history
/// - Mid-term: SQLite persisted summaries by session
/// - Long-term: ChromaDB vector search for semantic retrieval
class MemoryService {
  static final MemoryService instance = MemoryService._();
  MemoryService._();

  bool _initialized = false;

  // In-memory short-term store
  final List<String> _shortTermMemory = [];
  static const int _shortTermMaxSize = 50;

  Future<void> initialize() async {
    if (_initialized) return;
    // TODO: Initialize SQLite and ChromaDB
    _initialized = true;
  }

  Future<void> add(String text) async {
    _shortTermMemory.add(text);
    if (_shortTermMemory.length > _shortTermMaxSize) {
      _shortTermMemory.removeAt(0);
    }
    // TODO: Persist to SQLite and ChromaDB
  }

  /// Semantic search across memory stores
  Future<List<String>> search(String query, {int topK = 3}) async {
    // TODO: Implement ChromaDB vector search
    // For now, return recent short-term memories
    if (_shortTermMemory.isEmpty) return [];
    final results = _shortTermMemory
        .where((m) => m.toLowerCase().contains(query.toLowerCase()))
        .take(topK)
        .toList();
    return results;
  }

  Future<void> clear() async {
    _shortTermMemory.clear();
  }
}
