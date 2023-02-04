import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:things_todo/core/resources/color_manager.dart';

class LoadingOnStrings extends StatelessWidget {
  const LoadingOnStrings({super.key});

  @override
  Widget build(BuildContext context) => const Shimmer(
        gradient: LinearGradient(
          colors: [
            ColorManager.primary,
            ColorManager.white,
          ],
        ),
        child: SizedBox(
          height: 5,
          width: 50,
        ),
      );
}
