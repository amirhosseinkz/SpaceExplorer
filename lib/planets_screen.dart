import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:space_explorer/planet_model.dart';
import 'package:space_explorer/routes.dart';

class PlanetsScreen extends StatefulWidget {
  const PlanetsScreen({super.key});

  @override
  _PlanetsScreenState createState() => _PlanetsScreenState();
}

class _PlanetsScreenState extends State<PlanetsScreen> {
  final ScrollController _scrollController = ScrollController();
  int activeIndex = 0;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff1A6AB3),
              Color(0xff1C62AA),
              Color(0xff1E5AA3),
              Color(0xff20529B),
              Color(0xff214893),
              Color(0xff21418C),
              Color(0xff253885),
              Color(0xff27307B),
              Color(0xff282A75),
              Color(0xff2A226F),
              Color(0xff2B1D6A),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              const Padding(
                padding:  EdgeInsets.only(top: 150),
                child:  BackgroundOrbit(size: 550,),
              ), const Padding(
                padding:  EdgeInsets.only(top: 160),
                child:  BackgroundOrbit(size: 800,),
              ),
              // Add background circles
              const Positioned(
                top: 240,
                left: 70,
                child: CircleDecoration(
                  size: 25,
                  color: Colors.blue,
                ),
              ), const Positioned(
                top: 290,
                left: -10,
                child: CircleDecoration(
                  size: 25,
                  color: Colors.orange,
                ),
              ),
              const Positioned(
                top: 150,
                right: 50,
                child: CircleDecoration(
                  size: 30,
                  color: Colors.orange,
                ),
              ),
              const   Positioned(
                top: 70,
                right: 100,
                child: CircleDecoration(
                  size: 30,
                  color: Colors.green,
                ),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SpaceExplorerTitle(),
                  const SizedBox(height: 70),
                  ItemsListView(
                    scrollController: _scrollController,
                    activeIndex: activeIndex,
                    onItemTap: (index) {
                      setState(() {
                        activeIndex = index;
                      });
                      // _scrollToItem(index);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CircleDecoration extends StatelessWidget {
  final double size;
  final Color color;

  const CircleDecoration({
    Key? key,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );
  }
}

class BackgroundOrbit extends StatelessWidget {

  final double size;
  const BackgroundOrbit({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/orbit.png",
      height: size,
      fit: BoxFit.fitHeight,
      color: Colors.white.withOpacity(0.1),
    );
  }
}

class SpaceExplorerTitle extends StatelessWidget {
  const SpaceExplorerTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 300,
      child: Text(
        "Space Explorer",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
class ItemsListView extends StatefulWidget {
  final ScrollController scrollController;
  final int activeIndex;
  final Function(int) onItemTap;

  const ItemsListView({
    Key? key,
    required this.scrollController,
    required this.activeIndex,
    required this.onItemTap,
  }) : super(key: key);

  @override
  _ItemsListViewState createState() => _ItemsListViewState();
}

class _ItemsListViewState extends State<ItemsListView> {
  late int activeIndex;


  @override
  void initState() {

    super.initState();
    activeIndex = widget.activeIndex;
    widget.scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    const double itemExtent = 220; // Adjust based on item size
    final double offset = widget.scrollController.offset + (MediaQuery.of(context).size.width - itemExtent) / 2;
    final int newIndex = (offset / itemExtent).round();
    // && newIndex < 3
    if (newIndex != activeIndex && newIndex >= 0 ) {
      setState(() {
        activeIndex = newIndex;
      });

      widget.onItemTap(newIndex);


    }
  }



  @override
  Widget build(BuildContext context) {



    return SizedBox(
      height: 480,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        controller: widget.scrollController,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PlanetWidget(
              planet: planetList[index],
              index: index,
              isActive: index == activeIndex,
              onTap: () {
                if(activeIndex == index) {
                  context.push('/singlePlanet/$index');
                }
                setState(() {
                  activeIndex = index;
                  widget.onItemTap(index);
                });

              }
            ),
          );
        },
      ),
    );
  }
}

class PlanetWidget extends StatelessWidget {
  final Planet planet;
  final bool isActive;
  final VoidCallback onTap;

  final int index;
  const PlanetWidget({
    Key? key,
    required this.planet,
    required this.isActive,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double scaleFactor = isActive ? 1.0 : 0.8;
    double opacity = isActive ? 1.0 : 0.7;
    FontWeight fontWeight = isActive ? FontWeight.bold : FontWeight.normal;

    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: opacity,
        child: Transform.scale(
          scale: scaleFactor,
          child: SizedBox(
            height: 480,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [

                PlanetCard(planet: planet, fontWeight: fontWeight),

                Positioned(
                  top: 0,
                  child: Hero(
                    tag: 'planet-image-$index',
                    child: PlanetImage(planet: planet),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlanetCard extends StatelessWidget {
  final Planet planet;
  final FontWeight fontWeight;

  const PlanetCard({
    Key? key,
    required this.planet,
    required this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Stack(
        alignment: AlignmentDirectional.center,
        children: [

        Container(
        width: 200,
        height: 250,
        decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(0.2),
    spreadRadius: 2,
    blurRadius: 5,
    offset: const Offset(0, 4),
    ),
    ],
    ),

    child: Stack(
      children: [
         Positioned(
            bottom: 15,
            right: 10,
            child: Text(
              '${planet.number}', // Display the index + 1
              style:  TextStyle(
                color: Colors.grey[300],
                fontSize: 120,
                fontWeight: FontWeight.bold,
              ),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                planet.name,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.blue[800],
                  fontSize: 30,
                  fontWeight: fontWeight,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                planet.description,
                textAlign: TextAlign.start,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
        ),

          const Positioned(
            bottom: 0,
            child: CircleButton(),
          ),

        ],
        ),
    );
  }
}

class PlanetImage extends StatelessWidget {
  final Planet planet;

  const PlanetImage({
    Key? key,
    required this.planet,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
      ),
      child: Image.asset(
        planet.planetPNG,
        fit: BoxFit.cover,
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  const CircleButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(4),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.yellow[800],
        ),
        child: const Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}