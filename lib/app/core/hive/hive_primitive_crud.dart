import 'package:hive/hive.dart';
import 'package:note_plus/feature/note/model/note_model.dart';

class HivePrimitiveCrud<T> {
  final String _key;

  HivePrimitiveCrud(this._key);

  /// Helper method to parse the notes map from dynamic type
  Map<String, List<NoteModel>>? _parseNotesMap(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      final result = <String, List<NoteModel>>{};
      for (final entry in data.entries) {
        final key = entry.key.toString();
        final value = entry.value;

        if (value is List) {
          final notesList = <NoteModel>[];
          for (final item in value) {
            if (item is NoteModel) {
              notesList.add(item);
            }
          }
          result[key] = notesList;
        }
      }
      return result;
    }

    return null;
  }

  T? get get => switch (T) {
    String => Hive.box<T>('string').get(this._key),
    int => Hive.box<T>('int').get(this._key),
    double => Hive.box<T>('double').get(this._key),
    bool => Hive.box<T>('bool').get(this._key),
    const (Map<String, List<NoteModel>>) => _parseNotesMap(Hive.box('notes').get(this._key)) as T?,
    _ => throw const FormatException('Invalid'),
  };

  Future<void> get delete => switch (T) {
    String => Hive.box<T>('string').delete(this._key),
    int => Hive.box<T>('int').delete(this._key),
    double => Hive.box<T>('double').delete(this._key),
    bool => Hive.box<T>('bool').delete(this._key),
    const (Map<String, List<NoteModel>>) => Hive.box('notes').delete(this._key),
    _ => throw const FormatException('Invalid'),
  };

  Future<void> save(T value) => switch (T) {
    String when value is String => Hive.box<T>('string').put(this._key, value),
    int when value is int => Hive.box<T>('int').put(this._key, value),
    double when value is double => Hive.box<T>('double').put(this._key, value),
    bool when value is bool => Hive.box<T>('bool').put(this._key, value),
    const (Map<String, List<NoteModel>>) => Hive.box('notes').put(this._key, value),
    _ => throw const FormatException('Invalid'),
  };
}
