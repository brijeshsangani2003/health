import 'package:flutter/material.dart';
import 'package:health/model/onBording_Model.dart';
import 'package:health/screen/home_screen.dart';

class intro_screen extends StatefulWidget {
  const intro_screen({super.key});

  @override
  State<intro_screen> createState() => _intro_screenState();
}

List<OnbordingModel> onboarding = [
  OnbordingModel(
    img: 'assets/images/Find food you love vector.png',
    title: 'title -1 ',
    description: 'description -1',
  ),
  OnbordingModel(
    img: 'assets/images/Find food you love vector.png',
    title: 'title -2 ',
    description: 'description -2',
  ),
  OnbordingModel(
    img: 'assets/images/Find food you love vector.png',
    title: 'title -3 ',
    description: 'description -3',
  )
];

PageController controller = PageController();

class _intro_screenState extends State<intro_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 650,
              child: PageView.builder(
                controller: controller,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.jumpToPage(onboarding.length - 1);
                            controller.animateToPage(onboarding.length,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut);
                          },
                          child: Text(
                            index == onboarding.length - 1 ? '' : 'Skip >>',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Image.asset(
                          onboarding[index].img,
                          height: 270,
                          width: 270,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          onboarding[index].title,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.green.shade600,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          onboarding[index].description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                              onboarding.length,
                              (i) => Container(
                                    height: index == i ? 15 : 5,
                                    width: index == i ? 15 : 5,
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(
                                            index == i ? 15 : 5)),
                                  )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {
                            if (index == onboarding.length - 1) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => home_scrren(),
                                  ));
                            } else {
                              controller.animateToPage(
                                index + 1,
                                duration: Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            }
                          },
                          color: Colors.orangeAccent,
                          child: Text(
                            index == onboarding.length - 1
                                ? 'Get Started'
                                : 'Next',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                itemCount: onboarding.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
