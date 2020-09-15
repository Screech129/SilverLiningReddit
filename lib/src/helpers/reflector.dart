import 'package:reflectable/reflectable.dart';

//Use 'flutter pub run build_runner watch' in terminal to generate files
// Annotate with this class to enable reflection.
class Reflector extends Reflectable {
  const Reflector()
      : super(
          invokingCapability,
          typingCapability,
          reflectedTypeCapability,
        ); // Request the capability to invoke methods.
}

const reflector = Reflector();
