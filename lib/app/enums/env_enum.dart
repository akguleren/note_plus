import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvEnum {
  baseUrl('BASE_URL');

  const EnvEnum(this.value);
  final String value;
  String? get envValue => dotenv.env[value];
}
