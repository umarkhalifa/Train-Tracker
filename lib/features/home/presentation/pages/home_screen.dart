import 'package:dropdown_search/dropdown_search.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:train_tracking/app/styles/app_colors.dart';
import 'package:train_tracking/app/styles/fonts.dart';
import 'package:train_tracking/app/styles/ui_helpers.dart';
import 'package:train_tracking/core/constants/app_assets.dart';
import 'package:train_tracking/core/constants/spacing.dart';
import 'package:train_tracking/core/navigators/route_names.dart';
import 'package:train_tracking/data/models/ticket_model.dart';
import 'package:train_tracking/data/providers.dart';
import 'package:train_tracking/features/home/data/models/ticket.dart';

import 'widgets/ticket_widget.dart';

final fromProvider = StateProvider((ref) => 'Kaduna');
final dateProvider = StateProvider((ref) => DateTime.now());

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateProvider);
    final userName = FirebaseAuth.instance.currentUser!.displayName!.split(' ');
    final tickets = ref.watch(ticketProvider);
    return Scaffold(
      backgroundColor: AppColors.background,
      body: tickets.when(data: (data) {
        return SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight(context) * .56,
                width: screenWidth(context),
                child: Stack(
                  children: [
                    Container(
                      height: screenHeight(context) * .3,
                      width: screenWidth(context),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(AppAssets.map),
                            fit: BoxFit.cover),
                      ),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 19),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Heading(
                                "GLEEM EXPRESS",
                                color: AppColors.white,
                              ),
                              gapMedium,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBody(
                                        "Hello ${userName[0]} 👋",
                                        color: AppColors.white,
                                        fontSize: 12,
                                      ),
                                      TextBody(
                                        "Where are you going?",
                                        color: AppColors.white,
                                        fontSize: 18,
                                      )
                                    ],
                                  ),
                                  const Spacer(),
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColors.white.withOpacity(0.4),
                                    radius: 25,
                                    child: Stack(
                                      children: [
                                        SvgPicture.asset(
                                          AppAssets.bell,
                                          color: AppColors.white,
                                          height: 30,
                                        ),
                                        const Positioned(
                                          right: 4,
                                          top: 3,
                                          child: CircleAvatar(
                                            radius: 4,
                                            backgroundColor: AppColors.red,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 17,
                      right: 17,
                      child: Container(
                        width: screenWidth(context),
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownSearch<String>(
                              popupProps: PopupProps.menu(
                                showSelectedItems: true,
                                showSearchBox: true,
                                disabledItemFn: (String s) =>
                                    s.startsWith('F') == false,
                                searchFieldProps: const TextFieldProps(
                                    cursorColor: AppColors.blue),
                              ),
                              items: states,
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                baseStyle:
                                    const TextStyle(fontFamily: "Poppins"),
                                dropdownSearchDecoration: InputDecoration(
                                    labelText: "Departure",
                                    hintText: "country in menu mode",
                                    labelStyle: TextStyle(
                                      fontFamily: "Poppins",
                                      color: AppColors.base.withOpacity(0.7),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: AppColors.base.withOpacity(0),
                                      ),
                                    ),
                                    border: InputBorder.none),
                              ),
                              onChanged: (value) {},
                              selectedItem:
                                  'Federal Capital Territory'.toUpperCase(),
                            ),
                            Consumer(
                              builder: (BuildContext context, WidgetRef ref,
                                  Widget? child) {
                                return DropdownSearch<String>(
                                  popupProps: const PopupProps.menu(
                                    showSelectedItems: true,
                                    showSearchBox: true,
                                    searchFieldProps: TextFieldProps(
                                        cursorColor: AppColors.blue),
                                  ),
                                  items: states,
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    baseStyle:
                                        const TextStyle(fontFamily: "Poppins"),
                                    dropdownSearchDecoration: InputDecoration(
                                      labelText: "Destination",
                                      hintText: "country in menu mode",
                                      border: InputBorder.none,
                                      labelStyle: TextStyle(
                                        fontFamily: "Poppins",
                                        color: AppColors.base.withOpacity(0.7),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    ref.read(fromProvider.notifier).state =
                                        value!;
                                  },
                                  selectedItem: "Kaduna".toUpperCase(),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            TextBody(
                              'Depart',
                              color: AppColors.base.withOpacity(0.7),
                            ),
                            GestureDetector(
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2030),
                                );
                                if (pickedDate != null) {
                                  ref.read(dateProvider.notifier).state =
                                      pickedDate;
                                }
                              },
                              child: TextSemiBold(
                                DateFormat('dd MMM yyyy').format(date),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.search);
                              },
                              child: Container(
                                height: 50,
                                width: screenWidth(context),
                                decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: TextSemiBold(
                                    "Search Now",
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              gapMedium2,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextSemiBold(
                      "Active Ticket",
                      fontSize: 18,
                    ),
                    TextBody(
                      "See All",
                      color: AppColors.blue,
                      fontSize: 12,
                    )
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: screenHeight(context) * 0.29,
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final Ticket ticket = data[index];
                    return GestureDetector(
                        onTap: () {}, child: TicketWidget(ticket: ticket));
                  },
                  separatorBuilder: (_, __) {
                    return const SizedBox();
                  },
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                ),
              ),
              gapMedium2,
            ],
          ),
        );
      }, error: (_, __) {
        return TextBody("Error getting data");
      }, loading: () {
        return SizedBox(
          height: screenHeight(context),
          width: screenWidth(context),
          child: const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(color: AppColors.blue,),
            ),
          ),
        );
      }),
    );
  }
}
