import 'package:flutter/material.dart';
import 'package:townsquare_app/util/responsive.dart';
import 'package:townsquare_app/widgets/bottom_navigation_widget.dart';
import 'package:townsquare_app/widgets/general_info_widget.dart';
import 'package:townsquare_app/widgets/side_menu_widget.dart';

// class MainScreen extends StatefulWidget {
//   final Widget child; // Accept the child widget from ShellRoute

//   const MainScreen({super.key, required this.child});

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   //late PageController _pageController;
//   int _currentPage = 0;

//   final List<Widget> _pages = [
//     Center(child: Text("Home Page")), // Default Home Page
//     LocationScreen(), // Location Page
//   ];

//   @override
//   void initState() {
//     super.initState();
//     //_pageController = PageController();
//   }

//   @override
//   void dispose() {
//     //_pageController.dispose();
//     super.dispose();
//   }

//   void _onMenuItemTap(int index) {
//     setState(() {
//       _currentPage = index;
//     });
//     //_pageController.jumpToPage(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isDesktop = Responsive.isDesktop(context);
//     final isMobile = Responsive.isMobile(context);
//     final isTablet = Responsive.isTablet(context);

//     return Scaffold(
//       endDrawer: Responsive.isTablet(context)
//           ? Container(
//               color: Colors.black.withOpacity(0.5),
//               width: MediaQuery.of(context).size.width * 0.35,
//               child: const GeneralInformationWidget(),
//             )
//           : null,
//       bottomNavigationBar: isMobile
//           ? CustomBottomNavigation(
//               onTap: _onMenuItemTap,
//               selectedIndex: _currentPage,
//             )
//           : null,
//       body: SafeArea(
//         child: Row(
//           children: [
//             if (isDesktop || isTablet)
//               Expanded(
//                 flex: 2,
//                 child: SizedBox(
//                   child: SideMenuWidget(
//                     currentIndex: _currentPage,
//                     onMenuItemTap: (index) {
//                       if (index == 0) {
//                         context.go('/home'); // Navigate to Home
//                       } else if (index == 1) {
//                         context.go('/location'); // Navigate to Location
//                       }
//                     },
//                   ),
//                 ),
//               ),
//             Expanded(
//               flex: 7,
//               child: Router(
//                 routerDelegate: GoRouter.of(context).routerDelegate,
//                 backButtonDispatcher: RootBackButtonDispatcher(),
//               ),
//               // PageView(
//               //   controller: _pageController,
//               //   physics: NeverScrollableScrollPhysics(), // Disable swipe to change pages
//               //   children: [
//               //     ActivitiesWidget(),
//               //     LocationScreen(),
//               //   ],
//               // ),
//             ),
//             // Expanded(
//             //   flex: 7,
//             //   child: Navigator(
//             //     key: Get.nestedKey(1), // Use nested navigation key for child routes
//             //     initialRoute: '/',
//             //     onGenerateRoute: (settings) {
//             //       Widget page;
//             //       switch (settings.name) {
//             //         case '/location':
//             //           page = LocationScreen();
//             //           break;
//             //         default:
//             //           page = ActivitiesWidget();
//             //       }
//             //       return GetPageRoute(
//             //         settings: settings,
//             //         page: () => page,
//             //       );
//             //     },
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class MainScreen extends StatelessWidget {
  final Widget child; // Accept the child widget from ShellRoute

  const MainScreen({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);
    final isMobile = Responsive.isMobile(context);
    final isTablet = Responsive.isTablet(context);

    return Scaffold(
      endDrawer: Responsive.isTablet(context)
          ? Container(
              color: Colors.black.withOpacity(0.5),
              width: MediaQuery.of(context).size.width * 0.35,
              child: const GeneralInformationWidget(),
            )
          : null,
      bottomNavigationBar: isMobile
          ? CustomBottomNavigation(
              onTap: (index) {},
              selectedIndex: 0,
            )
          : null,
      body: Row(
        children: [
          // Side Menu
          if (isDesktop || isTablet)
            Expanded(
              flex: 2,
              child: SideMenuWidget(
                currentIndex: 0,
                onMenuItemTap: (index) {},
              ),
            ),
          // Dynamic Content Area
          Expanded(
            flex: 7,
            child: child, // Render the child passed from ShellRoute
          ),
        ],
      ),
    );
  }
}
