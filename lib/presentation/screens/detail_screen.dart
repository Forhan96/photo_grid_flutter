// import 'package:flutter/material.dart';
// import 'package:photo_grid_flutter/domain/providers/photo_provider.dart';
// import 'package:provider/provider.dart';
//
// class DetailScreen extends StatelessWidget {
//   final String index;
//   const DetailScreen({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<PhotoProvider>(
//         builder: (context, photoProvider, child) {
//           return SafeArea(
//             child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Hero(
//                 tag: 'imageHero',
//                 child: Image.network("${photoProvider.photos[int.parse(index)].url}.png"),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
