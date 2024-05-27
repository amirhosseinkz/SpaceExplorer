import 'package:flutter/material.dart';

class Planet {
  final String name;
  final String description;
  final String planetPNG;
  final String surfacePNG;

  final Color planetColor;

  final int number;

  Planet({required this.name, required this.description, required this.planetPNG , required this.surfacePNG , required this.number , required this.planetColor});



}

final List<Planet> planetList = [
  Planet(
    name: "Mercury",
    description: "Mercury is the smallest planet in the Solar System and the closest to the Sun. It has a very thin atmosphere, which causes extreme temperature variations. Mercury's surface is heavily cratered, similar to the Moon. Despite its small size, it has a significant impact on the dynamics of the Solar System.",
    planetPNG: 'assets/planets/mercury.png',
    surfacePNG: 'assets/surface/mercury.jpg',
    number: 1,
      planetColor: Colors.grey,
  ),
  Planet(
    name: "Venus",
    description: "Venus is known for its thick, toxic atmosphere composed mainly of carbon dioxide, with clouds of sulfuric acid. It has the hottest surface temperature of any planet, due to a runaway greenhouse effect. Venus rotates very slowly and in the opposite direction to most planets. Its surface features include vast plains, highland regions, and volcanic landscapes.",
    planetPNG: 'assets/planets/venus.png',  surfacePNG: 'assets/surface/venus.jpg',
    number: 2,
    planetColor: Colors.orange[300]!,
  ),
  Planet(
    name: "Earth",
    description: "Earth is the only planet known to harbor life, with a diverse range of ecosystems and climates. It has a rich atmosphere that supports life and a magnetic field that protects it from harmful solar radiation. Earth's surface is 71% water, with large landmasses called continents. The planet has a dynamic geological history, including plate tectonics and volcanic activity.",
    planetPNG: 'assets/planets/earth.png',  surfacePNG: 'assets/surface/earth.jpg',
    number: 3,
    planetColor: Colors.green,
  ),
  Planet(
    name: "Mars",
    description: "Mars, known for its red appearance, is often called the Red Planet. Its surface is covered with iron oxide, giving it a reddish color. Mars has the largest volcano and the deepest, longest canyon in the Solar System. Scientists believe that ancient Mars had liquid water and possibly life. Today, it has polar ice caps and a thin atmosphere primarily composed of carbon dioxide.",
    planetPNG: 'assets/planets/mars.png',  surfacePNG: 'assets/surface/mars.jpg',
    number: 4,   planetColor: Colors.brown,
  ),
  Planet(
    name: "Jupiter",
    description: "Jupiter is the largest planet in the Solar System, more massive than all the other planets combined. It has a Great Red Spot, a giant storm larger than Earth that has raged for centuries. Jupiter's atmosphere is mostly hydrogen and helium, with fast-moving clouds and dynamic weather systems. It has a strong magnetic field and dozens of moons, including the largest, Ganymede.",
    planetPNG: 'assets/planets/jupiter.png',  surfacePNG: 'assets/surface/jupiter.jpeg',
    number: 5,    planetColor: Colors.brown[700]!,
  ),
];
