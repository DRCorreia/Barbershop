import 'package:dw_barbershop/core/ui/constants.dart';
import 'package:dw_barbershop/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 100 * _scale;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1.0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageConstats.backgroundChair),
                opacity: 0.4,
                fit: BoxFit.cover)),
        child: AnimatedOpacity(
            duration: const Duration(seconds: 3),
            curve: Curves.easeIn,
            opacity: _animationOpacityLogo,
            onEnd: () {
              Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                    settings: const RouteSettings(name:'/auth/login'),
                      pageBuilder: (context, animation, secondaryAnimation){
                        return const LoginPage();
                      },
                      transitionsBuilder:(_, animation, __ , child) {
                          return FadeTransition(opacity: animation, child: child);
                      },
                      ),
                  (route) => false);
            },
            child: Center(
                child: AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    width: _logoAnimationWidth,
                    height: _logoAnimationHeight,
                    curve: Curves.linearToEaseOut,
                    child: Image.asset(
                      ImageConstats.imageLogo,
                      fit: BoxFit.contain,
                    )))),
      ),
    );
  }
}
