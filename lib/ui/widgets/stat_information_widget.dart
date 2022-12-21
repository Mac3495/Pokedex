import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex/core/utils/app_colors.dart';

class StatInformationWidget extends ConsumerWidget {
  final String titleStatOne;
  final String valueStatOne;
  final String titleStatTwo;
  final String valueStatTwo;

  const StatInformationWidget({
    super.key,
    required this.titleStatOne,
    required this.valueStatOne,
    required this.titleStatTwo,
    required this.valueStatTwo
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleStatOne,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )
              ),
              Text(
                valueStatOne,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryText
                )
              ),
            ],
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                titleStatTwo,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                )
              ),
              Text(
                valueStatTwo,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: AppColors.secondaryText
                )
              ),
            ],
          ),
        ),
      ],
    );
  }
}