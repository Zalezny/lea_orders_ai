import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;
import 'package:injectable/injectable.dart';

@lazySingleton
class ConfigService {
  Map<String, dynamic>? _raw;
  bool _loaded = false;

  // No defaults: all required values must be present in config.

  Future<void> load() async {
    if (_loaded) return;
    try {
      final jsonStr = await rootBundle.loadString('assets/config/app_config.json');
      _raw = json.decode(jsonStr) as Map<String, dynamic>;
    } catch (_) {
      _raw = null; // asset missing or invalid json
    } finally {
      _loaded = true;
    }
  }

  Future<String?> get openAIApiKey async {
    if (!_loaded) await load();
    final key = (_raw?['openai_api_key'] as String?)?.trim();
    return (key != null && key.isNotEmpty) ? key : null;
  }

  Future<AiSettings> get aiSettings async {
    if (!_loaded) await load();
    final ai = (_raw?['ai'] as Map<String, dynamic>?) ?? (throw const ConfigException("Brak sekcji 'ai' w pliku assets/config/app_config.json"));

    final model = (ai['model'] as String?)?.trim();
    if (model == null || model.isEmpty) {
      throw const ConfigException("Brak lub niepoprawna wartość 'ai.model' w assets/config/app_config.json");
    }

    final inputPrompt = (ai['input_prompt'] as String?)?.trim();
    if (inputPrompt == null || inputPrompt.isEmpty) {
      throw const ConfigException("Brak lub niepoprawna wartość 'ai.input_prompt' w assets/config/app_config.json");
    }

    final store = _tryBool(ai['store']);
    if (store == null) {
      throw const ConfigException("Brak lub niepoprawna wartość 'ai.store' (bool) w assets/config/app_config.json");
    }

    final temperature = _tryDouble(ai['temperature']);
    if (temperature == null) {
      throw const ConfigException("Brak lub niepoprawna wartość 'ai.temperature' (number) w assets/config/app_config.json");
    }

    final topP = _tryDouble(ai['top_p']);
    if (topP == null) {
      throw const ConfigException("Brak lub niepoprawna wartość 'ai.top_p' (number) w assets/config/app_config.json");
    }

    return AiSettings(model: model, inputPrompt: inputPrompt, store: store, temperature: temperature, topP: topP);
  }

  Future<double> get matchingThreshold async {
    if (!_loaded) await load();
    final matching =
        (_raw?['matching'] as Map<String, dynamic>?) ?? (throw const ConfigException("Brak sekcji 'matching' w assets/config/app_config.json"));
    final threshold = _tryDouble(matching['threshold']);
    if (threshold == null) {
      throw const ConfigException("Brak lub niepoprawna wartość 'matching.threshold' (number) w assets/config/app_config.json");
    }
    return threshold;
  }

  double? _tryDouble(Object? value) {
    if (value == null) return null;
    if (value is num) return value.toDouble();
    if (value is String) return double.tryParse(value);
    return null;
  }

  bool? _tryBool(Object? value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is String) {
      final lower = value.toLowerCase();
      if (lower == 'true') return true;
      if (lower == 'false') return false;
    }
    return null;
  }
}

class AiSettings {
  final String model;
  final String inputPrompt;
  final bool store;
  final double temperature;
  final double topP;

  const AiSettings({required this.model, required this.inputPrompt, required this.store, required this.temperature, required this.topP});
}

class ConfigException implements Exception {
  final String message;
  const ConfigException(this.message);
  @override
  String toString() => 'ConfigException: $message';
}
