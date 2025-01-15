import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:project_space/Core/Constants/app_colors.dart';
import 'package:project_space/Models/planet_model.dart';
import 'package:project_space/Ui/Planet_details/Widget/header_widget.dart';
import 'package:project_space/Ui/Planet_details/Widget/info_widget.dart';

class PlanetDetailsScreen extends StatelessWidget {
  static const String roteName="/planet_details";
   PlanetDetailsScreen({super.key});
 final Flutter3DController controller = Flutter3DController();


  @override
  Widget build(BuildContext context) {
    Planet planet=ModalRoute.of(context)?.settings.arguments as Planet;
    return Scaffold(
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          HeaderWidget(title:planet.title,name: planet.name,),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                AspectRatio(aspectRatio: 1,
                  child: Flutter3DViewer(
                    controller: controller,
                      src: "assets/models/${planet.model3D}"),
                ),
                const Text(
                  "About",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.white),
                ),
                const SizedBox(height: 16,),
                Text(
                  planet.about,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: AppColors.white),
                ),
                PlanetInfoWidget(title: "Distance from Sun (km) :${planet.distanceFromSun}"),
                PlanetInfoWidget(title: "Length of Day (hours)  :${planet.lengthOfDay}"),
                PlanetInfoWidget(title: "Orbital Period (Earth years) :${planet.orbitalPeriod}"),
                PlanetInfoWidget(title: "Radius (km) :${planet.radius}"),
                PlanetInfoWidget(title: "Mass (kg)  :${planet.mass}"),
                PlanetInfoWidget(title: "Gravity (m/s²)  :${planet.gravity}"),
                PlanetInfoWidget(title: "Surface Area (km²)   :${planet.surfaceArea}"),

              ],
            ),
          )
        ],
      ),
    );
  }
}

