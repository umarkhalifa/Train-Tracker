import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/data/models/ticket_model.dart';
import 'package:train_tracking/features/ticket_detail/data/seats.dart';

class CheckOutScreen extends ConsumerWidget {
  final Ticket ticket;

  const CheckOutScreen(this.ticket, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seats = ref.watch(seatProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        iconTheme: const IconThemeData(color: AppColors.base),
        title: TextSemiBold(
          "Checkout",
          fontSize: 17,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Container(
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: AppColors.blue,
                            radius: 8,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                20,
                                (index) => Container(
                                  height: 1,
                                  width: 10,
                                  color: AppColors.grey,
                                ),
                              ),
                            ),
                          ),
                          const CircleAvatar(
                            backgroundColor: AppColors.blue,
                            radius: 8,
                            child: CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      gapMedium,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextSemiBold(ticket.locationFrom),
                          TextSemiBold(ticket.locationTo),
                        ],
                      ),
                      gapSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBody(
                            "${DateFormat('d MMM').format(ticket.date)}, ${ticket.timeFrom['hour']}:${ticket.timeFrom['minute']}",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          TextBody(
                              "${DateFormat('d MMM').format(ticket.date)}, ${ticket.timeTo['hour']}:${ticket.timeTo['minute']}",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                gapMedium,
                Container(
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBody(
                            "Full Name",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          TextSemiBold(
                            FirebaseAuth.instance.currentUser!.displayName!,
                            fontSize: 16,
                          ),
                        ],
                      ),
                      gapSmall,
                      const Divider(),
                      gapSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBody(
                            "Number of Seats",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          TextSemiBold(
                            seats.length.toString(),
                            fontSize: 16,
                          ),
                        ],
                      ),
                      gapSmall,
                      const Divider(),
                      gapSmall,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBody(
                            "Seats",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          TextSemiBold(
                            seats.join(','),
                            fontSize: 16,
                          ),
                        ],
                      ),
                      gapSmall,
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBody(
                            "Price",
                            color: AppColors.base.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          TextSemiBold(
                            "N${seats.length * ticket.price}",
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                gapMedium,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Heading(
                    "Payment Method",
                    fontSize: 20,
                  ),
                ),
                gapMedium,
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      const Icon(FontAwesomeIcons.paypal,color: AppColors.blue,),
                      gapMedium2,
                      TextSemiBold("PayStack",fontSize: 18,)
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  height: 56,
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: TextSemiBold("PAY NOW",color:AppColors.white,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
