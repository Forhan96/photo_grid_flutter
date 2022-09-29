import 'package:animations/animations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
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
                return OpenContainer(closedBuilder: (_, openContainer) {
                  return CachedNetworkImage(
                    imageUrl: "${photoProvider.photos[index].thumbnailUrl}.png",
                  );
                }, openBuilder: (_, closeContainer) {
                  return Column(
                    children: [
                      CachedNetworkImage(
                        imageUrl: "${photoProvider.photos[index].url}.png",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          photoProvider.photos[index].title ?? "",
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ],
                  );
                });
                // return GestureDetector(
                //   onTap: () {
                //     Navigator.pushNamed(context, Routes.getDetailsScreenRoute(index.toString()));
                //   },
                //   child: Hero(
                //     tag: "imageHero",
                //     child: CachedNetworkImage(
                //       imageUrl: "${photoProvider.photos[index].thumbnailUrl}.png",
                //       height: 100,
                //       width: 100,
                //     ),
                //   ),
                // );
              },
            ),
          );
        },
      ),
    );
  }
}
