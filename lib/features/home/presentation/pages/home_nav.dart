import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/core/constants/app_assets.dart';
import 'package:train_tracking/features/home/presentation/pages/home_screen.dart';
import 'package:train_tracking/features/tickets/presentation/my_tickets_screen.dart';

final navIndex = StateProvider((ref) => 0);

class HomeNav extends ConsumerWidget {
  const HomeNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabs = [
      const HomeScreen(),
      const MyTicketScreen(),
      Container(),
    ];
    final currentIndex = ref.watch(navIndex);
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: currentIndex,
        items: [
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.homeFill,
              color: currentIndex == 0 ? AppColors.blue : AppColors.grey,
            ),
            title: TextBody(
              "Home",
              color: currentIndex == 0 ? AppColors.blue : AppColors.grey,
              fontSize: 12,

            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.ticket,
              color: currentIndex == 1 ? AppColors.blue : AppColors.grey,

            ),
            title: TextBody(
              "Ticket",
              color: currentIndex == 1 ? AppColors.blue : AppColors.grey,
              fontSize: 12,

            ),
          ),
          CustomNavigationBarItem(
            icon: SvgPicture.asset(
              AppAssets.person,
              color: currentIndex == 2 ? AppColors.blue : AppColors.grey,
            ),
            title: TextBody(
              "Profile",
              color: currentIndex == 2 ? AppColors.blue : AppColors.grey,
              fontSize: 12,

            ),

          ),
        ],
        onTap: (value){
          ref.read(navIndex.notifier).state = value;
        },
      ),
    );
  }
}
