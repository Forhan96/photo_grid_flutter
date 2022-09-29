import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:photo_grid_flutter/presentation/screens/home_screen.dart';

class PhotoGridApp extends StatelessWidget {
  const PhotoGridApp({Key? key}) : super(key: key);

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
      ),
    );
  }
}
