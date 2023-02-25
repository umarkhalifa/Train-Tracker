import 'package:flutter/material.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/app_assets.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/core/navigators/route_names.dart';

List<Map> headers = [
  {
    'title': 'Book Tickets',
    'description':
        'It is now easier to book tickets with our latest user friendly mobile app'
  },
  {
    'title': 'Search Tickets',
    'description':
        "Whether it's your first time or simply your , we work latest we anticipate your every need"
  },
  {
    'title': 'Ticket Status',
    'description':
        "We'll send you real time information about your tickets,check-in and more"
  },
];

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AppAssets.map), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              Heading(
                "ROYAL RIDERS",
                color: AppColors.white,
                fontSize: 40,
              ),
              gapMedium2,
              gapMedium2,
              SizedBox(
                height: screenHeight(context) * 0.23,
                width: screenWidth(context),
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        TextSemiBold(
                          headers[index]['title'],
                          color: AppColors.white,
                          fontSize: 27,
                        ),
                        gapLarge,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60.0),
                          child: TextBody(
                            headers[index]['description'],
                            color: AppColors.white,
                            style: const TextStyle(
                              wordSpacing: 3,
                            ),
                            softWrap: true,
                            textAlign: TextAlign.center,
                            fontSize: 18,
                            maxLines: 5,
                          ),
                        )
                      ],
                    );
                  },
                  itemCount: headers.length,
                  onPageChanged: (value){
                    setState(() {
                      currentIndex = value;
                    });
                  },
                ),
              ),
              gapMedium,
              gapMedium,
              SizedBox(
                width: screenWidth(context) * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    3,
                    (index) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        height: 10,
                        width: currentIndex == index ? 30 : 10,
                        decoration: BoxDecoration(
                            color: currentIndex == index
                                ? AppColors.white
                                : AppColors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(40)),
                      );
                    },
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.signup);
                },
                child: Container(
                  height: 56,
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: Center(
                    child: TextSemiBold("GET STARTED",color: AppColors.blue,),
                  ),
                ),
              ),
              gapMedium,
              GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.login);
                  },
                  child: TextSemiBold("SIGN IN",color: AppColors.white,)),
              gapSmall,
            ],
          ),
        ),
      ),
    );
  }
}
