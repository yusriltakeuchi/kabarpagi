
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kabarpagi/core/utils/global/shared_manager.dart';

/// Creating news provider
final themeProvider = StateNotifierProvider<ThemeNotifier, bool>((ref) => ThemeNotifier());
/// ----------------------

/// Creating theme notifier
class ThemeNotifier extends StateNotifier<bool> {
  ThemeNotifier() : super(false) {
    getThemeIsDark();
  }

  Future<void> getThemeIsDark() async {
    final shared = SharedManager<bool>();
    final value = await shared.read("theme_mode");
    state = value ?? false;
  }

  Future<void> setThemeDark(bool value) async {
    final shared = SharedManager<bool>();
    await shared.store("theme_mode", value);
    state = value;
  }
}
/// ----------------------