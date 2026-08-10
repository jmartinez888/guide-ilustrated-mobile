// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;


import 'package:species/src/presentation/pages/main/left_tabs/game/memory/widgets/memory_table.dart';


class MemoryGameController {

  static const String defaultAssetPath = 'assets/json/leves.json';
  static const int defaultUniqueCards = 6;
  static Map<String, dynamic>? _jsonCache;
  static final Map<String, List<MemoryCardData>> _levelCache = {};
  static List<String>? _orderedLevelKeys;


  static Future<List<MemoryCardData>> loadCards({
    String levelKey = 'level_1',
    String assetPath = defaultAssetPath,
    int uniqueCards = defaultUniqueCards,
  }) async {
    final String cacheKey = '$assetPath::$levelKey::$uniqueCards';
    final cached = _levelCache[cacheKey];
    if (cached != null) return cached;

    await _ensureJsonLoaded(assetPath);
    final Map<String, dynamic> map = _jsonCache!;

    if (!map.containsKey(levelKey)) {
      throw Exception('Nivel no encontrado: $levelKey');
    }

    final List<dynamic> items = map[levelKey] as List<dynamic>;
    if (items.isEmpty) {
      throw Exception('El nivel $levelKey no tiene imágenes disponibles.');
    }

    final int take = items.length >= uniqueCards ? uniqueCards : items.length;

    final List<MemoryCardData> cards = items.take(take).map<MemoryCardData>((e) {
      final m = e as Map<String, dynamic>;
      return MemoryCardData(
        imagePath: (m['path'] ?? '').toString(),
        title: (m['name'] ?? '').toString(),
      );
    }).toList();

    _levelCache[cacheKey] = cards;
    return cards;
  }

  static Future<List<String>> loadLevelKeys({String assetPath = defaultAssetPath}) async {
    if (_orderedLevelKeys != null) return _orderedLevelKeys!;
    await _ensureJsonLoaded(assetPath);

    final keys = _jsonCache!.keys
        .where((k) => k.toString().startsWith('level_'))
        .map((k) => k.toString())
        .toList();

    keys.sort((a, b) {
      int pa = int.tryParse(a.split('_').last) ?? 0;
      int pb = int.tryParse(b.split('_').last) ?? 0;
      return pa.compareTo(pb);
    });

    _orderedLevelKeys = keys;
    return _orderedLevelKeys!;
  }

  static Future<int> indexOfLevelKey(String levelKey, {String assetPath = defaultAssetPath}) async {
    final keys = await loadLevelKeys(assetPath: assetPath);
    final idx = keys.indexOf(levelKey);
    return idx >= 0 ? idx : 0;
  }

  static Future<int> levelCount({String assetPath = defaultAssetPath}) async {
    final keys = await loadLevelKeys(assetPath: assetPath);
    return keys.length;
  }

  static void clearCache() {
    _jsonCache = null;
    _levelCache.clear();
    _orderedLevelKeys = null;
  }

  static Future<void> _ensureJsonLoaded(String assetPath) async {
    if (_jsonCache != null) return;
    final String raw = await rootBundle.loadString(assetPath);
    _jsonCache = json.decode(raw) as Map<String, dynamic>;
  }
}
