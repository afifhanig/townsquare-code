import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';
import 'package:townsquare_app/screens/activities_widget.dart';
import 'package:townsquare_app/screens/communities_screen.dart';
import 'package:townsquare_app/screens/location_screen.dart';
import 'package:townsquare_app/screens/main_screen.dart';
import 'package:townsquare_app/screens/notifications_screen.dart';
import 'package:townsquare_app/screens/services_screen.dart';

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureApp();
  runApp(MainTownSQR());
}

class MainTownSQR extends StatelessWidget {
  MainTownSQR({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return MainScreen(child: child); // Pass the child widget
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const ActivitiesScreen(),
          ),
          GoRoute(
            path: '/location',
            builder: (context, state) => const LocationScreen(),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => const ServicesScreen(),
          ),
          GoRoute(
            path: '/communities',
            builder: (context, state) => const CommunitiesScreen(),
          ),
          GoRoute(
            path: '/notifications',
            builder: (context, state) => const NotificationScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Townsquare App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'SF Pro',
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routerConfig: _router
        //   [
        //     GoRoute(
        //       name: '/login',
        //       path: '/login',
        //       builder: (_, __) => const Login(),
        //       routes: [
        //         GoRoute(
        //           name: 'step-1',
        //           path: 'step-1',
        //           builder: (_, __) => const Step1(),
        //         ),
        //         GoRoute(
        //           name: 'step-2',
        //           path: 'step-2',
        //           builder: (_, __) => const Step2(),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
        //home: const MainScreen(),
        );
  }
}

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entry Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Login entry page'),
            ElevatedButton(
              onPressed: () => context.go('/login/step-1'),
              child: const Text('Go to step 1'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step1 extends StatelessWidget {
  const Step1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Step 1'),
            ElevatedButton(
              onPressed: () => context.go('/login/step-2'),
              child: const Text('Go to step 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Step2 extends StatelessWidget {
  const Step2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Step 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Step 2'),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).goNamed('/login'),
              child: const Text('Go to login'),
            ),
          ],
        ),
      ),
    );
  }
}
