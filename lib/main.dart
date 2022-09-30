import 'package:flutter/material.dart';
import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
import 'package:photo_grid_flutter/photo_grid_app.dart';
import 'package:provider/provider.dart';

import 'utils/di_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init(); //initializing Dependency Injection

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => di.sl<PhotoProvider>()),
      ],
      child: const PhotoGridApp(),
    ),
  );
}
