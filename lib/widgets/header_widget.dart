import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:townsquare_app/util/responsive.dart';
import 'package:townsquare_app/widgets/error_widgets/card_error_widgets.dart';
import 'package:townsquare_app/widgets/error_widgets/row_error_widgets.dart';
import 'package:townsquare_app/widgets/goals_progress_card_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/goals_progress_loading_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/header_date_loading_widget.dart';

String _formatDate(DateTime date) {
  return DateFormat('E, MMM d').format(date);
}

var _fetchProcess = 'success';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (Responsive.isMobile(context))
              Padding(
                padding: const EdgeInsets.only(left: 2),
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      fetchHeader(_fetchProcess),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            if (!Responsive.isMobile(context))
              Expanded(
                child: Container(
                  color: Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (Responsive.isTablet(context))
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                fetchHeader(_fetchProcess),
                                SizedBox(height: 5),
                              ],
                            ),
                            Spacer(),
                            Builder(
                              builder: (context) => IconButton(
                                icon: Icon(Icons.info_outline_rounded),
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                },
                              ),
                            )
                          ],
                        ),
                      if (Responsive.isDesktop(context))
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            fetchHeader(_fetchProcess),
                            SizedBox(height: 5),
                          ],
                        ),
                      const SizedBox(height: 10),
                      searchBar(context),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            if (Responsive.isMobile(context))
              Container(
                color: Colors.transparent,
                padding: EdgeInsets.only(right: 2),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: () {
                        context.go('/notifications');
                      },
                    ),
                    InkWell(
                      //onTap: () => Scaffold.of(context).openEndDrawer(),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          "assets/images/avatar.png",
                          width: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        if (Responsive.isMobile(context))
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                _fetchGoalProgressWidget(_fetchProcess),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: searchBar(context),
                ),
                SizedBox(height: 10),
              ],
            ),
          )
      ],
    );
  }

  Widget searchBar(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(8.0),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Theme.of(context).primaryColor),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          hintText: 'What do you feel like doing?',
          suffixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 21,
          ),
        ),
      ),
    );
  }

  Widget buildDateNowWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          _formatDate(DateTime.now()),
          style: TextStyle(color: Colors.grey, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const Text(
          'This week in Estopona',
          style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget fetchHeader(String process) {
    switch (process) {
      case 'success':
        return buildDateNowWidget();
      case 'loading':
        return const HeaderDateLoadingShimmer();
      case 'failed':
        return const RowErrorWidgets();
      default:
        return Container();
    }
  }

  Widget _fetchGoalProgressWidget(String process) {
    switch (process) {
      case 'success':
        return GoalProgressCardWidget(currentPoints: 25, targetPoints: 50);
      case 'loading':
        return GoalsProgressLoadingShimmer();
      case 'failed':
        return const CardErrorWidgets();
      default:
        return Container();
    }
  }
}
