import 'app_localizations.dart';

/// The translations for English (`en`).
class LocEn extends Loc {
  LocEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Flutter Starter App';

  @override
  String get youHavePushedTheButton => 'You have pushed the button this many times:';
}
