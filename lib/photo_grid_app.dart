import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_grid_flutter/presentation/common/router/router_helper.dart';
import 'package:photo_grid_flutter/presentation/screens/home_screen.dart';

class PhotoGridApp extends StatefulWidget {
  const PhotoGridApp({Key? key}) : super(key: key);

  @override
  State<PhotoGridApp> createState() => _PhotoGridAppState();
}

class _PhotoGridAppState extends State<PhotoGridApp> {
  @override
  void initState() {
    super.initState();
    RouterHelper().setupRouter();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Photo Grid',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
        onGenerateRoute: RouterHelper.router.generator,
        // initialRoute: Routes.SPLASH_SCREEN,
      ),
    );
  }
}
