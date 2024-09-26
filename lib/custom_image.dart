// import 'package:flutter/material.dart';

// import 'core/constant/colors/app_colors.dart';

// class CustomNetImage extends StatelessWidget {
//   const CustomNetImage({super.key, required this.imageUrl, this.height, this.width, this.fit, this.borderRadius});
//  final String imageUrl;
//   final double? height;
//   final double? width;
//   final BoxFit? fit;
//   final double? borderRadius;
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: BorderRadius.circular(borderRadius??0),
//       child: SizedBox(
//           height: height ?? 150,
//                   width: width ?? 100,
//         child: CachedNetworkImage(
//             imageUrl: imageUrl,
//             fit: fit ?? BoxFit.cover,
//             placeholder: (context, url) => ShimmerWidget.rectangle(
//                   hight: height ?? 150,
//                   width: width ?? 100,
//                   isHorizontalRadius: true,
//                   borderRadius: borderRadius??0,
//                 ),
//             errorWidget: (context, url, error) => Container(
//               alignment: Alignment.center,
//                     color: Colors.cyan,
//                     height: height ?? 150,
//                     width: width ?? 100,
//                     child: Center(
//                       child:   Icon(
//                             Icons.error_rounded,
//                             // size: 35,
//                             color: const Color.fromARGB(115, 252, 252, 252),
//                           ),
//                     ),
//                   )
//                 ),
//       ),
//     );
//   }
// }