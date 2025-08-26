// ignore_for_file: unnecessary_this

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

// Usa el mismo modelo que ya utilizas en MemoryTable
import 'package:species/src/presentation/global/widgets/widgets_games/memory_game/memory_table.dart';

/// Controlador para el juego de memoria.
/// - Carga el JSON desde assets (una sola vez) y expone un método para
///   obtener las cartas por nivel.
/// - Incluye un caché en memoria para evitar volver a parsear/armar listas
///   cuando se pide el mismo nivel.
class MemoryGameController {
  /// Ruta por defecto del JSON. (Respeta tu archivo 'leves.json')
  static const String defaultAssetPath = 'assets/json/leves.json';

  /// Cantidad por defecto de cartas únicas a tomar (se duplican en el grid).
  static const int defaultUniqueCards = 6;

  /// Cache del JSON crudo (mapa de niveles).
  static Map<String, dynamic>? _jsonCache;

  /// Cache de listas de cartas por combinación (asset + nivel + cantidad).
  static final Map<String, List<MemoryCardData>> _levelCache = {};

  /// Carga las cartas de un [levelKey] desde el JSON de [assetPath].
  /// Devuelve exactamente [uniqueCards] (o menos si el nivel no alcanza).
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

  /// Fuerza limpiar caché (por si actualizas el JSON en caliente).
  static void clearCache() {
    _jsonCache = null;
    _levelCache.clear();
  }

  /// Carga el JSON una única vez en memoria.
  static Future<void> _ensureJsonLoaded(String assetPath) async {
    if (_jsonCache != null) return;
    final String raw = await rootBundle.loadString(assetPath);
    _jsonCache = json.decode(raw) as Map<String, dynamic>;
  }
}
