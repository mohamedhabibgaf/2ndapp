import 'package:flutter/material.dart';
import 'package:hupptest/Modal/allinonboardscreen.dart';
import 'package:hupptest/View/welcome/welcome.dart';
import 'package:hupptest/constant.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int currentIndex = 0;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/images/designf.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Prepard by exparts"),
    AllinOnboardModel(
        "assets/images/designs.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Delivery to your home"),
    AllinOnboardModel(
        "assets/images/designt.jpg",
        "There are many variations of passages of Lorem Ipsum available. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary",
        "Enjoy with everyone"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                itemCount: allinonboardlist.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(
                      title: allinonboardlist[currentIndex].titlestr,
                      description: allinonboardlist[currentIndex].description,
                      imgurl: allinonboardlist[currentIndex].imgStr);
                }),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.28,
              left: MediaQuery.of(context).size.width * 0.44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  allinonboardlist.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
            currentIndex < allinonboardlist.length - 1
                ? Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentIndex--;
                            });
                          },
                          child: Text(
                            "Previous",
                            style: TextStyle(fontSize: 18, color: primarygreen),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: lightgreenshede1,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0))),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              currentIndex++;
                            });
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(fontSize: 18, color: primarygreen),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: lightgreenshede1,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    bottomLeft: Radius.circular(20.0))),
                          ),
                        )
                      ],
                    ),
                  )
                : Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.33,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Welcome();
                          }));
                        });
                      },
                      child: Text(
                        "Get Started",
                        style: TextStyle(fontSize: 18, color: primarygreen),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: lightgreenshede1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? primarygreen : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: primarygreen,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Text(description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: primarygreen,
                fontSize: 14,
              ))
        ],
      ),
    );
  }
}
