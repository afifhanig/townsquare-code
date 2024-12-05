import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:townsquare_app/const/constant.dart';

typedef Callback = void Function(int index);

class CustomBottomNavigation extends StatefulWidget {
  final Callback onTap;
  final int selectedIndex;
  const CustomBottomNavigation({super.key, required this.onTap, required this.selectedIndex});

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentLocation = GoRouter.of(context).routerDelegate.currentConfiguration.uri.path;
      if (currentLocation == '/') {
        setState(() {
          selectedIndex = 0;
        });
      } else if (currentLocation == '/location') {
        setState(() {
          selectedIndex = 1;
        });
      } else if (currentLocation == '/services') {
        setState(() {
          selectedIndex = 2;
        });
      } else if (currentLocation == '/communities') {
        setState(() {
          selectedIndex = 3;
        });
      } else if (currentLocation == '/notifications') {
        setState(() {
          selectedIndex = 4;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.calendar_today_outlined,
              size: 30,
              color: selectedIndex == 0 ? selectionColor : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
              context.go('/');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.map_outlined,
              size: 30,
              color: selectedIndex == 1 ? selectionColor : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
              context.go('/location');
            },
          ),
          SizedBox(
            width: 60, // Space for the center button
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue.shade100,
              elevation: 2,
              child: Icon(Icons.add, color: Colors.black, size: 30),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.star_border_outlined,
              size: 30,
              color: selectedIndex == 3 ? selectionColor : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 3;
              });
              context.go('/services');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.people_outline_rounded,
              size: 30,
              color: selectedIndex == 4 ? selectionColor : Colors.black,
            ),
            onPressed: () {
              setState(() {
                selectedIndex = 4;
              });
              context.go('/communities');
            },
          ),
        ],
      ),
    );
  }
}
