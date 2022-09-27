import 'package:fluro/fluro.dart';
import 'package:photo_grid_flutter/presentation/common/router/routes.dart';
import 'package:photo_grid_flutter/presentation/screens/splash_screen.dart';

class RouterHelper {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashScreenHandler = Handler(handlerFunc: (context, parameters) => SplashScreen());

  static final Handler _notFoundHandler = Handler(handlerFunc: (context, parameters) {
    print("No Router Found!");
    return null;
  });
  void setupRouter() {
    router.define(
      Routes.SPLASH_SCREEN,
      handler: _splashScreenHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.notFoundHandler = _notFoundHandler;
  }
}
