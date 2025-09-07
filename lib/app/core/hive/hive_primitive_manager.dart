import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:note_plus/feature/note/model/note_model_adapter.dart';
import 'package:path_provider/path_provider.dart';

class HivePrimitiveManager {
  HivePrimitiveManager._privateConstructor();

  static final HivePrimitiveManager _instance = HivePrimitiveManager._privateConstructor();

  factory HivePrimitiveManager() => _instance;

  Future<void> init() async {
    if (!kIsWeb) {
      Hive.init((await getApplicationDocumentsDirectory()).path);
    }

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(NoteModelAdapter());
    }

    await Future.wait([
      Hive.openBox<String>('string'),
      Hive.openBox<int>('int'),
      Hive.openBox<double>('double'),
      Hive.openBox<bool>('bool'),
      Hive.openBox('notes'),
    ]);
  }

  Future<void> clear() async {
    await Hive.deleteFromDisk();
    await Hive.close();
  }
}
