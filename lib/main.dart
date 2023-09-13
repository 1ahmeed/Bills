import 'package:bills/responsive/splash_screen/mobile_body.dart';
import 'package:bills/responsive/splash_screen/responsive_splash_screen.dart';
import 'package:bills/responsive/splash_screen/tablet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc_observer.dart';
import 'cubit/company_cubit.dart';

Future<void> main() async {

   Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      CompanyCubit()
        ..createDatabase(),
      child: BlocBuilder<CompanyCubit, CompanyState>(
        builder: (context, state) {
          return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home:ResponsiveSplashScreen(
                mobileBody: MobileSplashScreen(),
                tabletBody: TabletSplashScreen(),
              )
          );
        },
      ),
    );
  }
}
