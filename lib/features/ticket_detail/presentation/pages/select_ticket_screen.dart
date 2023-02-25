import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/core/navigators/route_names.dart';
import 'package:train_tracking/data/models/ticket_model.dart';
import 'package:train_tracking/features/checkout/presentation/pages/checkout_screen.dart';
import 'package:train_tracking/features/ticket_detail/data/seats.dart';

class SelectTicketScreen extends ConsumerWidget {
  final Ticket ticket;

  const SelectTicketScreen({Key? key, required this.ticket}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mySeats = ref.watch(seatProvider);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: screenHeight(context),
        width: screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              gapLarge,
              gapLarge,
              gapSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppColors.background,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 17,
                        color: AppColors.base,
                      ),
                    ),
                  ),
                  TextSemiBold(
                    "Select Seat",
                    fontSize: 16,
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              ),
              gapMedium2,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextSemiBold(
                    ticket.locationFrom,
                    fontSize: 16,
                  ),
                  TextSemiBold(
                    ticket.locationTo,
                    fontSize: 16,
                  ),
                ],
              ),
              gapMedium,
              Expanded(
                child: Container(
                  height: screenHeight(context),
                  width: screenWidth(context),
                  decoration: BoxDecoration(
                      color: AppColors.background,
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Wrap(
                        children: ticket.seats.map((seat) {
                          return Builder(
                            builder: (context) {
                              if (mySeats.contains(seat['name'])) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(seatProvider.notifier)
                                          .remove(seat['name']);
                                    },
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: AppColors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: TextBody(
                                          seat['name'],
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              } else if (takenSeats.contains(seat['name'])) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 5),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: AppColors.blue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: TextBody(
                                        seat['name'],
                                        color: AppColors.base.withOpacity(0.5),
                                      ),
                                    ),
                                  ),
                                );
                              } else {
                                return GestureDetector(
                                  onTap: () {
                                    ref
                                        .read(seatProvider.notifier)
                                        .add(seat['name']);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 5),
                                    child: Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Center(
                                        child: TextBody(seat['name']),
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        } ).toList()
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          gapSmall,
                          TextBody(
                            "Available",
                            fontSize: 13,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.blue,
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          gapSmall,
                          TextBody(
                            "Selected",
                            fontSize: 13,
                          ),
                          const Spacer(),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                color: AppColors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                          gapSmall,
                          TextBody(
                            "unavailable",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      gapLarge,
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CheckOutScreen(ticket),
                            ),
                          );
                        },
                        child: Container(
                          height: 56,
                          width: screenWidth(context),
                          decoration: BoxDecoration(
                            color: AppColors.blue,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: TextSemiBold(
                              "Checkout",
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              gapMedium
            ],
          ),
        ),
      ),
    );
  }
}
