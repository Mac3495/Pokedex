import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({
    Key? key,
    required this.description,
    required this.lottieAsset,
     this.size = 200,
  }) : super(key: key);
  final String description;
  final String lottieAsset;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            lottieAsset,
            height: size,
            width: size
          ),
          const SizedBox(
            height: 32,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          )
        ],
      ),
    );
  }
}
