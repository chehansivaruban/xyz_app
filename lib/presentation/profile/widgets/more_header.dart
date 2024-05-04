import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/values/colors.dart';
import '../../core/values/text_styles.dart';

class MoreHeader extends HookConsumerWidget {
  const MoreHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 310,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Positioned(
            child: Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    const Color(0xFFa2ffa6),
                    AppColors.primaryGreen,
                    const Color(0xFF096b0d),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: const [0.0, 0.5, 1.0],
                  tileMode: TileMode.clamp,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:
                        56, // Set the width to match the height for a perfect circle
                    height: 56,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Jessica Monroe',
                    style: sanFranciscoMedium.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'jessicamon@gmail.com',
                    style: sanFranciscoRegular.copyWith(
                      color: AppColors.lightGrey,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
