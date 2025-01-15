import 'package:flutter/material.dart';
import 'package:project_space/Core/Constants/app_colors.dart';
import 'package:project_space/Core/Constants/app_images.dart';

class HeaderWidget extends StatelessWidget {
  String name;
  String title;
   HeaderWidget({required this.name,required this.title ,super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.appBarScreenImage,
        ),
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, AppColors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:  SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: AppColors.white),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: AppColors.white),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(child:
        SafeArea(
          child: FilledButton(onPressed: (){
            Navigator.pop(context);

          }, style: FilledButton.styleFrom(
            foregroundColor: AppColors.white,
            backgroundColor:AppColors.red ,
            padding: const EdgeInsets.all(16),
            shape:const CircleBorder() ,
          ),
            child: const Icon(Icons.arrow_back),),
        )
          ,)
      ],
    );
  }
}
