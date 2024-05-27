import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:space_explorer/planets_screen.dart';
import 'planet_model.dart';
import 'dart:ui' as ui;
class SinglePlanetScreen extends StatelessWidget {
  final Planet planet;
  final int index;

  const SinglePlanetScreen(
      {Key? key, required this.planet, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            right: -50,
            child: Hero(
              tag: 'planet-image-$index',
              child: Image.asset(
                planet.planetPNG,
                width: 350,
                height: 350,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const Positioned(
            top: 100,
            left: 30,
            child: CircleDecoration(
              size: 25,
              color: Colors.green,
            ),
          ),
          const Positioned(
            top: 350,
            right: 150,
            child: CircleDecoration(
              size: 25,
              color: Colors.orange,
            ),
          ),
          Positioned(
              top: 150,
              left: 50,
              child: Text(
                '${planet.number}', // Display the index + 1
                style: TextStyle(
                  color: Colors.grey[300],
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                ),
              )),

          Positioned(
            top: 380,
            left: 50,
            child: Text(
              planet.name,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blue[800],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 430,
            left: 50,
            child: SizedBox(
              width: 350,
              child: Text(
                planet.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
             width: 120,
              height: 120,
              decoration:  BoxDecoration(
                color:planet.planetColor
              ),
            ),
          ),
          blurredImageWithPlayIcon(),

          Positioned(
              top: 40,
              left: 10,
              child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    context.pop();
                  }))

          // Add other widgets here as needed
        ],
      ),
    );
  }

  Widget blurredImageWithPlayIcon() {
    return Stack(
      children: [
        Positioned(
          top: 730,
          left: 50,
          child: Container(
            height: 160,
            width: 350,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(planet.surfacePNG),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.black.withOpacity(0.2,),
                  child: Center(
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}
