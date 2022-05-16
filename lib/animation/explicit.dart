// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Explicit extends StatefulWidget {
  Explicit({Key? key}) : super(key: key);

  @override
  State<Explicit> createState() => _ExplicitState();
}

class _ExplicitState extends State<Explicit>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 2),
        upperBound: 1,
        lowerBound: 0)
      ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Explicit Animation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //build in
            FadeTransition(
              opacity: controller,
              child: Container(
                color: Colors.amberAccent,
                child: Text(
                  'Hello world',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 50,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),

            //Animated Widget
            ButtonTransition(controller: controller),
            SizedBox(
              height: 100,
            ),

            //Animated Builder

            AnimatedBuilder(
              animation: controller,
              builder: (context, child) => Container(
                alignment: Alignment.center,
                height: 100,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'Animated Builder',
                  style: TextStyle(fontSize: controller.value * 35),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Divider(height: 10, color: Colors.black),

            Text(
              'Hero Animation',
              style: TextStyle(
                  fontSize: 25, color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
                onPressed: () {
                  Get.to(HeroAnimatiion());
                },
                child: Hero(
                    tag: 'flutter',
                    child: FlutterLogo(
                      size: 50,
                    )))
          ],
        ),
      ),
    );
  }
}

class ButtonTransition extends AnimatedWidget {
  ButtonTransition({required AnimationController controller})
      : super(listenable: controller);
  Animation<double> get width => listenable as Animation<double>;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 100,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(width: width.value * 10),
        color: Colors.amber,
      ),
      child: Text(
        'Animated Widget',
        style: TextStyle(fontSize: 33),
      ),
    );
  }
}

class HeroAnimatiion extends StatelessWidget {
  HeroAnimatiion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: 200,
        child: Center(
          child: Hero(
              tag: "flutter",
              child: FlutterLogo(
                size: 300,
              )),
        ),
      ),
    );
  }
}
