
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_provider/app_provider.dart';
import 'core/route/app_router.dart';
import 'core/util/app_color.dart';
import 'data/services/api_service.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  ApiService.init();
  runApp(
    AppProviders.provide(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {

        final size = MediaQuery.of(context).size;
        Size designSize;
        if (size.width > 900) {
          // **Tablets or Large Screens**
          designSize = orientation == Orientation.landscape ? const Size(1400, 900) : const Size(900, 1400);
        } else if (size.width > 600) {
          // **Medium-sized tablets**
          designSize = orientation == Orientation.landscape ? const Size(1200, 800) : const Size(800, 1200);
        } else if (size.width > 430) {
          // **Big Phones like Galaxy S24 Ultra, iPhone 15 Pro Max**
          designSize = orientation == Orientation.landscape
              ? const Size(1000, 450) // Adjust for landscape
              : const Size(450, 1000); // Adjust for portrait
        } else {
          // **Default mobile phones**
          designSize = orientation == Orientation.landscape ? const Size(812, 375) : const Size(375, 812);
        }

        return ScreenUtilInit(
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          rebuildFactor: (old, data) => true,
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            themeMode: ThemeMode.dark,
            theme: ThemeData(
                primarySwatch: Colors.blue
            ),

            builder: (context, child) {
              return MaterialApp.router(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.light,
                darkTheme: ThemeData(
                  scaffoldBackgroundColor: AppColor.white,
                  brightness: Brightness.light,
                  useMaterial3: true,
                ),
                theme: ThemeData(primarySwatch: Colors.blue),
                routerConfig: AppRouter.router,
                builder: (context, child) {
                  return MediaQuery(
                    data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: child!,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
