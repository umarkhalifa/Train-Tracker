import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/data/models/ticket_model.dart';
import 'package:train_tracking/features/ticket_detail/presentation/pages/select_ticket_screen.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectTicketScreen(ticket: ticket),
                ),
              );
            },
            child: Container(
              width: screenWidth(context),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextSemiBold(
                        ticket.city,
                        color: AppColors.blue,
                        fontSize: 18,
                      ),
                      TextSemiBold(
                        "N${ticket.price}",
                        color: AppColors.blue,
                        fontSize: 18,
                      ),
                    ],
                  ),
                  gapSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        "Available",
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 13,
                      ),
                      TextBody(
                        "Available",
                        fontSize: 13,
                        color: Colors.green,
                      )
                    ],
                  ),
                  gapSmall,
                  gapSmall,
                  gapSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      20,
                          (index) => Container(
                        height: 1,
                        width: 9,
                        color: AppColors.base.withOpacity(0.3),
                      ),
                    ),
                  ),
                  gapMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        ticket.locationFrom,
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 14,
                      ),
                      TextBody(
                        ticket.locationTo,
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  gapSmall,
                  Row(
                    children: [
                      TextSemiBold(
                        "${ticket.timeFrom['hour']}:${ticket.timeFrom['minute']}",
                        color: AppColors.blue,
                        fontSize: 16,
                      ),
                      const Spacer(),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.blue,
                      ),
                      SizedBox(
                        width: screenWidth(context) * 0.3,
                        child: Stack(
                          children: [
                            Divider(
                              color: AppColors.base.withOpacity(0.5),
                            ),
                            Positioned(
                              bottom: 0,
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Icon(
                                Icons.directions_bus_filled_outlined,
                                color: AppColors.base.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        radius: 3,
                        backgroundColor: AppColors.blue,
                      ),
                      const Spacer(),
                      TextSemiBold(
                        "${ticket.timeTo['hour']}:${ticket.timeTo['minute']}",
                        color: AppColors.blue,
                        fontSize: 16,
                      ),
                    ],
                  ),
                  gapSmall,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextBody(
                        DateFormat('MMM dd, yyyy').format(ticket.date),
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 12,
                      ),
                      TextBody(
                        "Duration 1h 20 min",
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 12,
                      ),
                      TextBody(
                        "Dec,21 2022",
                        color: AppColors.base.withOpacity(0.5),
                        fontSize: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            bottom: 20,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.background,
                ),
                CircleAvatar(
                  radius: 15,
                  backgroundColor: AppColors.background,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
