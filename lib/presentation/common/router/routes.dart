class Routes {
  static String HOME_SCREEN = "/";

  static String SPLASH_SCREEN = "/splash";
  static String DETAIL_SCREEN = "/detail";

  static String getDetailsScreenRoute(String index) {
    return "$DETAIL_SCREEN?index=$index";
  }
}
