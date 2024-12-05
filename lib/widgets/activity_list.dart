import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:townsquare_app/data/activities_event_data.dart';
import 'package:townsquare_app/data/category_data.dart';
import 'package:townsquare_app/model/activities_event_model.dart';
import 'package:townsquare_app/model/category_model.dart';
import 'package:townsquare_app/widgets/category_card_widget.dart';
import 'package:townsquare_app/widgets/error_widgets/column_error_widgets.dart';
import 'package:townsquare_app/widgets/error_widgets/row_error_widgets.dart';
import 'package:townsquare_app/widgets/event_card_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/activities_card_loading_widget.dart';
import 'package:townsquare_app/widgets/loading_widgets/filter_category_loading_widget.dart';

class ActivityList extends StatefulWidget {
  const ActivityList({super.key});

  @override
  State<ActivityList> createState() => _ActivityListState();
}

class _ActivityListState extends State<ActivityList> {
  Set<int> selectedIds = {};
  Set<String> selectedCategoryNames = {};

  //Temporary approachment
  final _fetchProses = 'success';

  @override
  void initState() {
    super.initState();
    selectedIds.add(1);
    selectedIds.addAll(CategoryDetails().categoryData.map((c) => c.id));
    selectedCategoryNames.addAll(CategoryDetails().categoryData.map((c) => c.categoryName));
  }

  void toggleFilter(CategoryModel category) {
    setState(() {
      if (category.categoryName == 'All') {
        if (selectedIds.contains(category.id)) {
          // Deselect all
          selectedIds.clear();
          selectedCategoryNames.clear();
        } else {
          // Select all
          selectedIds = CategoryDetails().categoryData.map((c) => c.id).toSet();
          selectedCategoryNames = CategoryDetails().categoryData.map((c) => c.categoryName).toSet(); // Select all category names as well
        }
      } else {
        if (selectedIds.contains(category.id)) {
          selectedIds.remove(category.id);
          selectedCategoryNames.remove(category.categoryName);
        } else {
          selectedIds.add(category.id);
          selectedCategoryNames.add(category.categoryName);
        }

        // If any non-"All" is deselected, deselect "All"
        if (selectedIds.length != CategoryDetails().categoryData.length) {
          selectedIds.remove(1); // ID of "All"
          selectedCategoryNames.remove('All');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SizedBox(
              height: 50,
              child: Row(children: [
                GestureDetector(
                  onTap: () {
                    print('Rotated icon button pressed');
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 3, right: 3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFEEE1F5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Transform.rotate(
                        angle: 90 * pi / 180,
                        child: const Icon(
                          Icons.tune_rounded,
                          color: Colors.black,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                fetchProcessCategory(_fetchProses),
              ]),
            ),
          ),
          SizedBox(height: 15),
          fetchProcessActivities(_fetchProses),
        ],
      ),
    );
  }

  Widget buildCategoryWidgets() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: CategoryDetails().categoryData.map((category) {
        return CategoryWidget(
          category: category,
          isSelected: selectedIds.contains(category.id),
          onTap: () => toggleFilter(category),
        );
      }).toList(),
    );
  }

  Widget buildActivitiesCardWidgets() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: EventDetails().groupEventsByDate(selectedCategoryNames).entries.map((entry) {
        String dateKey = entry.key;
        return EventCardRenderList(entry.value, dateKey); // your card widget
      }).toList(),
    );
  }

  Widget fetchProcessCategory(String process) {
    switch (process) {
      case 'success':
        return buildCategoryWidgets();
      case 'loading':
        return FilterCategoryLoadingShimmer();
      case 'failed':
        return RowErrorWidgets();
      default:
        return Container();
    }
  }

  Widget fetchProcessActivities(String process) {
    switch (process) {
      case 'success':
        return buildActivitiesCardWidgets();
      case 'loading':
        return ActivitiesCardLoadingShimmer();
      case 'failed':
        return Center(child: ColumnErrorWidgets());
      default:
        return Container();
    }
  }
}

class EventCardRenderList extends StatefulWidget {
  final List<ActivitiesEventModel> datas;
  final String date;

  EventCardRenderList(this.datas, this.date);

  @override
  State<EventCardRenderList> createState() => _EventCardRenderListState();
}

class _EventCardRenderListState extends State<EventCardRenderList> {
  final GlobalKey _keyRed = GlobalKey();
  double? containerHeight;
  double dotHeight = 6.0;

  void _getContainerHeight() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = _keyRed.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox != null) {
        setState(() {
          containerHeight = renderBox.size.height;
        });
      }
    });
  }

  Widget _getFormattedDate(String date) {
    final parsedDate = DateTime.parse(date);
    final today = DateTime.now();

    // Check if the parsed date is today's date (ignoring time)
    if (parsedDate.year == today.year && parsedDate.month == today.month && parsedDate.day == today.day) {
      return RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "Today ",
              style: TextStyle(
                color: Colors.black, // Black color for "Today"
                fontSize: 16, // Adjust font size as needed
                fontWeight: FontWeight.bold, // Optional: Make it bold
              ),
            ),
            TextSpan(
              text: "/ ",
              style: TextStyle(
                color: Colors.grey, // Grey color for "/"
                fontSize: 16,
              ),
            ),
            TextSpan(
              text: "${DateFormat('EEEE, MMM d').format(parsedDate)}",
              style: TextStyle(
                color: Colors.grey, // Grey color for "tuesday"
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    } else {
      return Text(
        DateFormat('EEEE, MMM d').format(parsedDate),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _getContainerHeight();
    return Column(
      children: [
        // Row for the dot line and event details
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Colors.amber,
              width: 35,
              padding: EdgeInsets.only(right: 10), // The width for the line and the dot
              child: Column(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFF2AC),
                      borderRadius: BorderRadius.circular(999),
                    ),
                  ),
                  Container(
                    height: containerHeight ?? 100, // Fallback value for null containerHeight
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: List.generate(
                        (containerHeight ?? 100) ~/ (dotHeight + dotHeight), // Adjust the number of dots
                        (index) {
                          double totalDotHeight = (containerHeight ?? 100) / (containerHeight ?? 100) * dotHeight; // Dynamically adjust dot height
                          return Container(
                            width: 2, // Width of the dot
                            height: totalDotHeight, // Adjusted height for each dot
                            margin: EdgeInsets.symmetric(vertical: dotHeight - (dotHeight / 2)), // Margin between dots
                            decoration: BoxDecoration(
                              color: Colors.grey, // Color of the dot// Make the dot round
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container for event details
            Expanded(
              child: Container(
                key: _keyRed,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _getFormattedDate(widget.date),
                    SizedBox(height: 10),
                    ...widget.datas
                        .map(
                          (e) => Column(
                            children: [
                              EventCardWidget(
                                time: e.time,
                                duration: e.duration,
                                title: e.title,
                                location: e.location,
                                availableSpots: e.availableSpots,
                                price: e.price,
                                tags: e.tags,
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
