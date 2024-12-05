import 'package:flutter/material.dart';
import 'package:townsquare_app/widgets/error_widgets/card_error_widgets.dart';
import 'package:townsquare_app/widgets/goals_progress_card_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/goals_progress_loading_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/popular_near_loading_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/weekly_info_loading_widget.dart';
import 'package:townsquare_app/widgets/popular_event_near_widget.dart';
import 'package:townsquare_app/widgets/weekly_information_widget.dart';

var _fetchProcess = 'success';

class GeneralInformationWidget extends StatelessWidget {
  const GeneralInformationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.lightBlue.shade50,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              _fetchGoalProgressWidget(_fetchProcess),
              SizedBox(height: 20),
              _fetchWeeklyInfoWidget(_fetchProcess),
              SizedBox(height: 25),
              _fetchPopularNearWidget(_fetchProcess),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fetchGoalProgressWidget(String process) {
    switch (process) {
      case 'success':
        return GoalProgressCardWidget(currentPoints: 25, targetPoints: 50);
      case 'loading':
        return GoalsProgressLoadingShimmer();
      case 'failed':
        return CardErrorWidgets();
      default:
        return Container();
    }
  }

  Widget _fetchWeeklyInfoWidget(String process) {
    switch (process) {
      case 'success':
        return WeeklyInformationWidget();
      case 'loading':
        return WeeklyInfoLoadingShimmer();
      case 'failed':
        return CardErrorWidgets();
      default:
        return Container();
    }
  }

  Widget _fetchPopularNearWidget(String process) {
    switch (process) {
      case 'success':
        return PopularEventNearWidget();
      case 'loading':
        return PopularNearLoadingShimmer();
      case 'failed':
        return CardErrorWidgets();
      default:
        return Container();
    }
  }
}
