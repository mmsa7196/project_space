import 'package:flutter/material.dart';
import 'package:project_space/Core/Constants/app_colors.dart';
import 'package:project_space/Models/planet_model.dart';
import 'package:project_space/Ui/Planet_details/planet_details_screen.dart';
import 'package:project_space/Ui/Screens/header_widget.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController=PageController(initialPage: 0);
  int selectedIndex=0;
  @override
  void initState() {
    super.initState();
    pageController.addListener((){
      if(pageController.page! % 1 ==0){
        selectedIndex=pageController.page!.toInt();
        setState(() {

        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          const HeaderWidget(),
          Expanded(child: PageView.builder(
            controller:pageController ,
              itemBuilder: (context,index)=>Image.asset("assets/images/${SolarSystemData.planets[index%9].image}"),
          ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilledButton(onPressed: (){
                  if(selectedIndex!=0){
                    pageController.animateToPage((selectedIndex-1), duration:const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  }
                },
                  style: FilledButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor:AppColors.red ,
                  padding: const EdgeInsets.all(16),
                  shape:const CircleBorder() ,
                ),
                    child: const Icon(Icons.arrow_back),),
                Text(SolarSystemData.planets[selectedIndex%9].name,style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),),
                FilledButton(onPressed: (){
                    pageController.animateToPage((selectedIndex+1), duration:const Duration(milliseconds: 300), curve: Curves.easeInOut);
                }, style: FilledButton.styleFrom(
                  foregroundColor: AppColors.white,
                  backgroundColor:AppColors.red ,
                  padding: const EdgeInsets.all(16),
                  shape:const CircleBorder() ,
                ),
                  child: const Icon(Icons.arrow_forward),)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
              ),
              onPressed: (){
                Navigator.pushNamed(context,PlanetDetailsScreen.roteName,
                    arguments:SolarSystemData.planets[selectedIndex%9]);
              },
              child:  Row(
              children: [
                Text("Explore ${SolarSystemData.planets[selectedIndex%9].name}",
                  style:const TextStyle(
                    color:AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ) ,
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward,
                  color:AppColors.white,
                  size: 30,
                ),
              ],
            ),),
          ),

        ],
      ),
    );
  }
}
