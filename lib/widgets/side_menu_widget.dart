import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:townsquare_app/const/constant.dart';
import 'package:townsquare_app/data/side_menu_data.dart';

class SideMenuWidget extends StatefulWidget {
  final int currentIndex;
  final Function(int) onMenuItemTap;

  const SideMenuWidget({
    super.key,
    required this.currentIndex,
    required this.onMenuItemTap,
  });

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
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
    final data = SideMenuData();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
      color: Colors.black,
      child: Column(
        children: [
          Flexible(
              child: FittedBox(
            child: TownsquareLogo(),
          )),
          ...data.menu.mapIndexed(((index, _) => buildMenuEntry(data, index))).toList(),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width < 1000 ? 0 : 20),
            color: Colors.transparent,
            height: 40,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  backgroundColor: selectionColor,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.add, color: Colors.black, size: 25),
                    Container(color: Colors.transparent, child: Text('Create', style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600))),
                    SizedBox(width: 20),
                  ],
                )),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset("assets/images/avatar.png"),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildMenuEntry(SideMenuData data, int index) {
    final isSelected = selectedIndex == index;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(6.0),
        ),
        color: isSelected ? selectionColor : Colors.transparent,
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });

          if (index == 0) {
            context.go('/'); // Navigate to Home
          } else if (index == 1) {
            context.go('/location'); // Navigate to Location
          } else if (index == 2) {
            context.go('/services'); // Navigate to Location
          } else if (index == 3) {
            context.go('/communities'); // Navigate to Location
          } else if (index == 4) {
            context.go('/notifications'); // Navigate to Location
          }
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.menu[index].icon,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
            Text(
              data.menu[index].title,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.black : Colors.white,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TownsquareLogo extends StatelessWidget {
  const TownsquareLogo({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.only(bottom: 50),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'TWN',
              style: TextStyle(
                color: Color(0xFFE9ECEF), // Hex color for TWN
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro',
              ),
            ),
            TextSpan(
              text: 'SQR',
              style: TextStyle(
                color: selectionColor, // BlueSky color
                fontSize: 50,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF Pro',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
