import 'package:get_it/get_it.dart';
import 'package:kabarpagi/core/data/api.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator() async {
  /// Registering api endpoint
  locator.registerSingleton(Api());

  /// Registering utils
  locator.registerSingleton(NavigationUtils());

  /// Registering services
}