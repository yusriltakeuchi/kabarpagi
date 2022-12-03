import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kabarpagi/core/utils/navigation/navigation_utils.dart';
import 'package:kabarpagi/injector.dart';
import 'package:kabarpagi/ui/constant/constant.dart';
import 'package:kabarpagi/ui/constant/themes.dart';
import 'package:kabarpagi/ui/router/route_list.dart';
import 'package:kabarpagi/ui/router/router_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /// Setup injector
  await setupLocator();
  await ScreenUtil.ensureScreenSize();
  await initializeDateFormatting("id", null);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kabar Pagi',
      navigatorKey: locator<NavigationUtils>().navigatorKey,
      theme: lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      builder: (ctx, child) {
        setupScreenUtil(ctx);
        return MediaQuery(
          data: MediaQuery.of(ctx).copyWith(
            textScaleFactor: 1.0
          ),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: child!,
          ),
        );
      },
      initialRoute: routeHome,
      onGenerateRoute: RouterGenerator.generate,
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}