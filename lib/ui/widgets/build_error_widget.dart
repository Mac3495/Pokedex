import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class BuildErrorWidget extends ConsumerWidget {
  const BuildErrorWidget({Key? key, required this.errorMessage , this.onTap}) : super(key: key);
  final String errorMessage;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64, vertical: 42),
              child: Lottie.asset('assets/lottie/pokeball.json'),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: onTap,
                child: const Text('Try again'))
          ],
        ),
      ),
    );
  }
}