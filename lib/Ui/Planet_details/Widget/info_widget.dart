import 'package:flutter/material.dart';
import 'package:project_space/Core/Constants/app_colors.dart';

class PlanetInfoWidget extends StatelessWidget {
 final String title;

  const PlanetInfoWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16,),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: AppColors.white),
        ),
      ],
    );
  }
}
