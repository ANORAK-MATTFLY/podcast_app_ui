import 'dart:math';

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../static/creators.dart';
import '../static/posters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final thumbnails = ['assets/thumbnail/5.png', 'assets/thumbnail/6.png'];
    final random = Random();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Center(
          child: Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(360),
                ),
                border: Border.all(color: Colors.black, width: 0.1)),
            child: const Icon(
              Icons.window,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5.0),
            height: 40.0,
            width: 40.0,
            child: CircleAvatar(
              radius: 18,
              child: ClipOval(
                child: Image.asset(
                  'assets/profile.png',
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 150.0,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(TextSpan(
                        text: 'Find out your \nfavorite ',
                        style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w500, fontSize: 35.0),
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Podcasts 🎤',
                            style: GoogleFonts.merriweather(
                                fontWeight: FontWeight.w900,
                                fontSize: 35.0,
                                color: Colors.purple[800]),
                          )
                        ])),
                    Form(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(360),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 233, 233, 233),
                              blurRadius: 40.0, // soften the shadow
                              spreadRadius: 1.0, //extend the shadow
                              offset: Offset(
                                7.0, // Move to right 10  horizontally
                                20.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                        ),
                        child: TextField(
                            controller: null,
                            onChanged: (value) {
                              // Perform search logic based on the input value
                              // You can call a function or update the search results here
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search for podcast or music',
                                hintStyle: GoogleFonts.merriweather(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13.0,
                                  color:
                                      const Color.fromARGB(255, 205, 205, 205),
                                ),
                                prefixIcon: const Icon(Icons.search),
                                suffixIcon: const Icon(Icons.mic))),
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 220.0,
              width: (width - 40),
              child: Stack(
                children: [
                  Positioned(
                    top: 38,
                    child: Container(
                      height: 180.0,
                      width: (width - 40),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 183, 40),
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 18,
                    child: SizedBox(
                      height: 300,
                      width: width + 10,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            thumbnails[random.nextInt(thumbnails.length)],
                            width: 300,
                            height: 200,
                            fit: BoxFit.fill,
                            alignment: Alignment.centerRight,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 30,
                    child: SizedBox(
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Make Your \nMind Up",
                            style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.w700,
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Creative studio",
                            style: GoogleFonts.merriweather(
                              fontWeight: FontWeight.w200,
                              fontSize: 13.0,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 110.0,
              width: width - 20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Top creators",
                      style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 70,
                      width: width,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: creators.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 25.0),
                            height: 60.0,
                            width: 60.0,
                            child: CircleAvatar(
                              radius: 360,
                              backgroundImage: AssetImage(
                                creators[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ]),
            ),
            Expanded(
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Tending Podcasts",
                      style: GoogleFonts.merriweather(
                        fontWeight: FontWeight.w600,
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
                    const Icon(
                      Icons.more_horiz,
                      color: Color.fromARGB(255, 54, 54, 54),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: posters.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            image: DecorationImage(
                              image: AssetImage(
                                posters[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          "Motivational - 20 episodes",
                          style: GoogleFonts.merriweather(
                            fontWeight: FontWeight.w200,
                            fontSize: 13.0,
                            color: Colors.grey,
                          ),
                        ),
                        trailing: Container(
                            height: 40,
                            width: 40,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 137, 47, 255),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(80)),
                            ),
                            child: const Center(
                              child:
                                  Icon(Icons.play_arrow, color: Colors.white),
                            )),
                      );
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(92, 120, 120, 120),
                blurRadius: 25,
                offset: Offset(8, 20),
              )
            ]),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 126, 71, 188),
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: const Center(
                child: Icon(CupertinoIcons.house, color: Colors.white),
              )),
          Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.compass,
                  color: Color.fromARGB(255, 119, 119, 119),
                  size: 35,
                ),
              )),
          Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.heart,
                  color: Color.fromARGB(255, 119, 119, 119),
                  size: 35,
                ),
              )),
          Container(
              height: 50,
              width: 50,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.tray_arrow_down,
                  color: Color.fromARGB(255, 119, 119, 119),
                  size: 35,
                ),
              )),
        ]),
      ),
    );
  }
}
