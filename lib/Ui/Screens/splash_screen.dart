import 'package:flutter/material.dart';
import 'package:project_space/Core/Constants/app_colors.dart';
import 'package:project_space/Ui/Screens/home_screen.dart';

import '../../Core/Constants/app_images.dart';

class SplashScreen extends StatelessWidget {
  static const routName='/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      body: Stack(
        children: [
          Image.asset(AppImages.splashScreenImage),
          const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text("Explore\nThe\nUniverse ",
                       style: TextStyle(
               fontSize: 48,
               color: AppColors.white,
               fontWeight: FontWeight.bold
                       ) ,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 32),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                ),
                onPressed: ()=>Navigator.of(context).pushReplacementNamed(HomeScreen.routeName)
                , child: const Row(
                children: [
                  Text("Explore",
                  style:TextStyle(
                    color:AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ) ,
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward,
                    color:AppColors.white,
                    size: 30,
                  ),
                ],
              ),),
            ),
          ),
        ],
      ),
    );
  }
}
