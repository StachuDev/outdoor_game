import 'package:envied/envied.dart';

part 'env.g.dart';

@envied
abstract class Env {
  @EnviedField(varName: 'GOOGLE_MAPS_API_KEY', obfuscate: true)
  static final String googleMapsApiKey = _Env.googleMapsApiKey;
}
