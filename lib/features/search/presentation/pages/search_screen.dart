import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/app_assets.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/data/models/ticket_model.dart';
import 'package:train_tracking/data/providers.dart';
import 'package:train_tracking/features/home/presentation/pages/home_screen.dart';
import 'package:train_tracking/features/home/presentation/pages/widgets/ticket_widget.dart';
import 'package:train_tracking/features/ticket_detail/presentation/pages/select_ticket_screen.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final destination = ref.watch(fromProvider);
    final date = ref.watch(dateProvider);
    final tickets = ref.watch(ticketProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: tickets.when(data: (data){
        final List<Ticket> sorted = data
            .where((element) => element.locationTo.contains(destination))
            .toList();
        return SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: screenHeight(context) * 0.18,
                  width: screenWidth(context),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppAssets.map), fit: BoxFit.cover),
                  ),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      gapMedium2,
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.white,
                              )),
                          const Spacer(),
                          TextSemiBold(
                            "Abuja",
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                          gapSmall,
                          const Icon(
                            Icons.arrow_forward,
                            color: AppColors.white,
                          ),
                          gapSmall,
                          TextSemiBold(
                            destination,
                            fontSize: 18,
                            color: AppColors.white,
                          ),
                          const Spacer(),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextBody(
                          DateFormat('EEE dd, MMM').format(date),
                          color: AppColors.background,
                        ),
                      ),
                    ],
                  ),
                ),
                gapMedium,
                sorted.isNotEmpty
                    ? Flexible(
                        child: ListView.separated(
                          padding: const EdgeInsets.only(bottom: 20),
                          itemBuilder: (context, index) {
                            final ticket = sorted[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SelectTicketScreen(ticket: ticket),
                                  ),
                                );
                              },
                              child: TicketWidget(ticket: ticket),
                            );
                          },
                          separatorBuilder: (_, __) {
                            return gapMedium2;
                          },
                          itemCount: sorted.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                        ),
                      )
                    : Center(child: TextSemiBold("No Tickets Available"))
              ],
            ),
          ),
        );
      }, error: (_,__){
        return Center(child: TextSemiBold("Error fetching data"),);
      }, loading: (){
        return SizedBox(height: 40,width: 40,child: CircularProgressIndicator(),);
      }),
    );
  }
}
