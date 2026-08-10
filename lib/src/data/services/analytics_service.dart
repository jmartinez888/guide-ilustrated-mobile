import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';

/// Servicio centralizado de analytics que envuelve Firebase Analytics.
///
/// Provee métodos semánticos para registrar eventos personalizados
/// de la app (vistas de especies, uso de juegos, etc.).
class AnalyticsService {
  final FirebaseAnalytics _analytics;

  AnalyticsService({FirebaseAnalytics? analytics})
      : _analytics = analytics ?? FirebaseAnalytics.instance;

  /// Obtiene el observer para rastreo automático de pantallas.
  FirebaseAnalyticsObserver get observer =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  // ─────────────────────────────────────────────
  // Eventos de Especies
  // ─────────────────────────────────────────────

  /// Registra que el usuario vio el detalle de una especie.
  ///
  /// Parámetros enviados a Firebase:
  /// - `species_id`: ID numérico de la especie
  /// - `species_name`: Nombre común
  /// - `species_scientific_name`: Nombre científico
  /// - `species_type`: Tipo/categoría (ave, mamífero, etc.)
  Future<void> logViewSpecies({
    required int speciesId,
    String? speciesName,
    String? speciesScientificName,
    String? speciesType,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'view_species',
        parameters: {
          'species_id': speciesId,
          'species_name': speciesName ?? 'unknown',
          'species_scientific_name': speciesScientificName ?? 'unknown',
          'species_type': speciesType ?? 'unknown',
        },
      );
      debugPrint(
          '[Analytics] view_species: $speciesId - $speciesName ($speciesType)');
    } catch (e) {
      debugPrint('[Analytics] Error logging view_species: $e');
    }
  }

  /// Registra que el usuario descargó contenido de una especie.
  ///
  /// Parámetros enviados a Firebase:
  /// - `species_id`: ID numérico de la especie
  /// - `species_name`: Nombre común
  /// - `content_type`: Tipo de contenido descargado (pdf, image, audio)
  Future<void> logDownloadSpecies({
    required int speciesId,
    String? speciesName,
    required String contentType,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'download_species',
        parameters: {
          'species_id': speciesId,
          'species_name': speciesName ?? 'unknown',
          'content_type': contentType,
        },
      );
      debugPrint(
          '[Analytics] download_species: $speciesId - $speciesName ($contentType)');
    } catch (e) {
      debugPrint('[Analytics] Error logging download_species: $e');
    }
  }

  /// Registra que el usuario compartió una especie.
  ///
  /// Parámetros enviados a Firebase:
  /// - `species_id`: ID numérico de la especie
  /// - `species_name`: Nombre común
  Future<void> logShareSpecies({
    required int speciesId,
    String? speciesName,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'share_species',
        parameters: {
          'species_id': speciesId,
          'species_name': speciesName ?? 'unknown',
        },
      );
      debugPrint('[Analytics] share_species: $speciesId - $speciesName');
    } catch (e) {
      debugPrint('[Analytics] Error logging share_species: $e');
    }
  }

  /// Registra que el usuario agregó una especie a favoritos.
  ///
  /// Parámetros enviados a Firebase:
  /// - `species_id`: ID numérico de la especie
  /// - `species_name`: Nombre común
  Future<void> logFavoriteSpecies({
    required int speciesId,
    String? speciesName,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'favorite_species',
        parameters: {
          'species_id': speciesId,
          'species_name': speciesName ?? 'unknown',
        },
      );
      debugPrint('[Analytics] favorite_species: $speciesId - $speciesName');
    } catch (e) {
      debugPrint('[Analytics] Error logging favorite_species: $e');
    }
  }

  // ─────────────────────────────────────────────
  // Eventos de Juegos
  // ─────────────────────────────────────────────

  /// Registra que el usuario inició un juego.
  ///
  /// [gameName] debe ser uno de: `trivia`, `memory`, `puzzle`, `relationship`
  Future<void> logPlayGame({required String gameName}) async {
    try {
      await _analytics.logEvent(
        name: 'play_game',
        parameters: {
          'game_name': gameName,
        },
      );
      debugPrint('[Analytics] play_game: $gameName');
    } catch (e) {
      debugPrint('[Analytics] Error logging play_game: $e');
    }
  }

  /// Registra que el usuario completó un juego.
  ///
  /// [gameName] debe ser uno de: `trivia`, `memory`, `puzzle`, `relationship`
  /// [score] es el puntaje obtenido (opcional).
  Future<void> logCompleteGame({
    required String gameName,
    int? score,
  }) async {
    try {
      await _analytics.logEvent(
        name: 'complete_game',
        parameters: {
          'game_name': gameName,
          if (score != null) 'score': score,
        },
      );
      debugPrint('[Analytics] complete_game: $gameName (score: $score)');
    } catch (e) {
      debugPrint('[Analytics] Error logging complete_game: $e');
    }
  }
}
