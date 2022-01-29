import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicify/models/radio.dart';
import 'package:musicify/utils/ai_util.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<MyRadio> radio;
  @override
  void initState() {
    super.initState();
    fetchRadios();
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString("assets/radio.json");
    radio = MyRadio.fromJson(radioJson) as List<MyRadio>;
    print(radio);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      body: Stack(
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(colors: [
                  AIColor.primaryColor1,
                  AIColor.primaryColor2,
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              )
              .make(),
          AppBar(
            title: 'Musicify'.text.xl4.bold.white.make().shimmer(
                  primaryColor: Vx.purple300,
                  secondaryColor: Colors.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            centerTitle: true,
          ).h(100.0).p16(),
          VxSwiper.builder(
            itemCount: radio.length,
            aspectRatio: 1.0,
            itemBuilder: (context, index) {
              final rad = radio[index];

              return VxBox(child: const ZStack([]))
                  // .bgImage(
                  // //   DecorationImage(
                  // //       image: NetworkImage(rad.image),
                  // //       fit: BoxFit.cover,
                  // //       colorFilter: ColorFilter.mode(
                  // //           Colors.black.withOpacity(0.3), BlendMode.darken)),
                  // // )
                  .make();
            },
          ),
        ],
      ),
    );
  }
}
