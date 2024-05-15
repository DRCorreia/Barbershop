import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/core/ui/widgets/barbershop_loader.dart';
import 'package:dw_barbershop/core/ui/widgets/barbershop_theme.dart';
import 'package:dw_barbershop/features/auth/login/login_page.dart';
import 'package:dw_barbershop/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(customLoader: const BarbershopLoader(), builder: (asyncNavigatorObserver) {
      return MaterialApp(
        title: 'DwBarberShop',
        theme: BarbershopTheme.themeData,
        navigatorObservers: [asyncNavigatorObserver],
        routes: {
          '/': (_) => const SplashPage(),
          '/auth/login' : (_) => const LoginPage()
        },
      );
    });
  }
}
