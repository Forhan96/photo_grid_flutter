import 'package:flutter/material.dart';
import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
import 'package:photo_grid_flutter/presentation/common/router/routes.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PhotoProvider>(context, listen: false).fetchPhotos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PhotoProvider>(
        builder: (context, photoProvider, child) {
          return SafeArea(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 3,
              ),
              itemCount: photoProvider.photos.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.getDetailsScreenRoute(index.toString()));
                  },
                  child: Hero(
                    tag: "imageHero",
                    child: Image.network(photoProvider.photos[index].thumbnailUrl ?? ""),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
