import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/app_assets.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/features/home/data/models/ticket.dart';

class MyTicketScreen extends StatelessWidget {
  const MyTicketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.13,
              width: screenWidth(context),
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppAssets.map), fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    gapMedium,
                    TextSemiBold(
                      "My Tickets",
                      color: AppColors.white,
                      fontSize: 18,
                    ),
                  ],
                ),
              ),
            ),
            gapMedium,
            gapMedium,
            // Expanded(
            //     child: PageView.builder(
            //   itemBuilder: (context, index) {
            //     final ticket = tickets[index];
            //     return Stack(
            //       children: [
            //         Container(
            //           width: screenWidth(context),
            //           margin: const EdgeInsets.symmetric(horizontal: 15),
            //           padding:
            //               const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            //           decoration: BoxDecoration(
            //             color: AppColors.white,
            //             borderRadius: BorderRadius.circular(20),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Row(
            //                 children: [
            //                   TextSemiBold(
            //                     ticket.locationFrom,
            //                     fontSize: 18,
            //                   ),
            //                   gapSmall,
            //                   const Icon(Icons.arrow_forward),
            //                   gapSmall,
            //                   TextSemiBold(
            //                     ticket.locationTo,
            //                     fontSize: 18,
            //                   ),
            //                 ],
            //               ),
            //               gapSmall,
            //               TextBody(
            //                 DateFormat('EEE, dd MMM').format(ticket.date),
            //                 fontSize: 14,
            //                 color: AppColors.base.withOpacity(0.5),
            //               ),
            //               gapMedium2,
            //               Row(
            //                 children: [
            //                   TextSemiBold(
            //                     ticket.timeFrom.format(context),
            //                     fontSize: 18,
            //                     color: AppColors.blue,
            //                   ),
            //                   const Spacer(),
            //                   SizedBox(
            //                     height: 30,
            //                     width: screenWidth(context) * 0.4,
            //                     child: Stack(
            //                       children: [
            //                         Positioned(
            //                           bottom: 0,
            //                           left: 0,
            //                           right: 0,
            //                           top: 0,
            //                           child: Row(
            //                             children: [
            //                               const CircleAvatar(
            //                                 radius: 4,
            //                                 backgroundColor: AppColors.blue,
            //                               ),
            //                               Expanded(
            //                                 child: Container(
            //                                   height: 0.3,
            //                                   color: AppColors.base,
            //                                 ),
            //                               ),
            //                               const CircleAvatar(
            //                                 radius: 4,
            //                                 backgroundColor: AppColors.blue,
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Positioned(
            //                           bottom: 0,
            //                           top: 0,
            //                           left: 0,
            //                           right: 0,
            //                           child: Icon(
            //                               Icons.directions_bus_filled_outlined),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                   const Spacer(),
            //                   TextSemiBold(
            //                     ticket.timeTo.format(context),
            //                     fontSize: 18,
            //                     color: AppColors.blue,
            //                   ),
            //                 ],
            //               ),
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   TextBody(
            //                     DateFormat('MMM, dd yyyy').format(ticket.date),
            //                     fontSize: 14,
            //                     color: AppColors.base.withOpacity(0.5),
            //                   ),
            //                   TextBody(
            //                     'Duration 1h 20m',
            //                     fontSize: 14,
            //                     color: AppColors.base.withOpacity(0.5),
            //                   ),
            //                   TextBody(
            //                     DateFormat('MMM, dd yyyy').format(ticket.date),
            //                     fontSize: 14,
            //                     color: AppColors.base.withOpacity(0.5),
            //                   ),
            //                 ],
            //               ),
            //               gapMedium2,
            //               SizedBox(
            //                 width: screenWidth(context),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: List.generate(
            //                     30,
            //                     (index) => Container(
            //                       height: 1,
            //                       width: 7,
            //                       color: AppColors.base.withOpacity(0.3),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               gapMedium,
            //               Row(
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       TextBody(
            //                         "Name",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "Khalifa Umar",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                   const Spacer(),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.end,
            //                     children: [
            //                       TextBody(
            //                         "Ticket Number",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "VG1231",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               gapMedium,
            //               Row(
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       TextBody(
            //                         "Passenger",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "2",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                   const Spacer(),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.end,
            //                     children: [
            //                       TextBody(
            //                         "Seat",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "A1,A3",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               gapMedium,
            //               Row(
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       TextBody(
            //                         "Passenger",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "2",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                   const Spacer(),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.end,
            //                     children: [
            //                       TextBody(
            //                         "Seat",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "A1,A3",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               gapMedium,
            //               Row(
            //                 children: [
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.start,
            //                     children: [
            //                       TextBody(
            //                         "Price",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "N18000",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                   const Spacer(),
            //                   Column(
            //                     crossAxisAlignment: CrossAxisAlignment.end,
            //                     children: [
            //                       TextBody(
            //                         "City",
            //                         color: AppColors.base.withOpacity(0.5),
            //                         fontSize: 12,
            //                       ),
            //                       TextSemiBold(
            //                         "Ilorin",
            //                         fontSize: 18,
            //                       )
            //                     ],
            //                   ),
            //                 ],
            //               ),
            //               gapMedium,
            //               gapMedium,
            //               SizedBox(
            //                 width: screenWidth(context),
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                   children: List.generate(
            //                     30,
            //                     (index) => Container(
            //                       height: 1,
            //                       width: 7,
            //                       color: AppColors.base.withOpacity(0.3),
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               gapLarge
            //             ],
            //           ),
            //         ),
            //         Positioned(
            //           left: 0,
            //           right: 0,
            //           bottom: 80,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: const [
            //               CircleAvatar(radius: 15,backgroundColor: AppColors.background,),
            //               CircleAvatar(radius: 15,backgroundColor: AppColors.background,),
            //             ],
            //           ),
            //         )
            //       ],
            //     );
            //   },
            //   itemCount: 3,
            // )),
            gapLarge,
            Container(
              height: 48,
              width: screenWidth(context),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: TextSemiBold(
                  "DOWNLOAD TICKET",
                  color: AppColors.white,
                ),
              ),
            ),
            gapMedium
          ],
        ),
      ),
    );
  }
}
