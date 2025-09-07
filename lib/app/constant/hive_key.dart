import 'package:note_plus/feature/note/model/note_model.dart';

import '../core/hive/hive_primitive_crud.dart';

class HiveKey {
  static final baseUrl = HivePrimitiveCrud<String>('baseUrl');
  static final token = HivePrimitiveCrud<String>('token');
  static final language = HivePrimitiveCrud<String>('language');
  static final themeMode = HivePrimitiveCrud<String>('themeMode');
  static final notes = HivePrimitiveCrud<Map<String, List<NoteModel>>>('notes');
}
