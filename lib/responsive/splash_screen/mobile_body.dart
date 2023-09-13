import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import '../layout/desktop_body.dart';
import '../layout/mobile_body.dart';
import '../layout/responsive_layout.dart';
import '../layout/tablet_body.dart';

class MobileSplashScreen extends StatelessWidget {
  const MobileSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasySplashScreen(
        logo: Image.asset('assets/images/bills.png',),
        // backgroundColor:Colors.cyan ,
        durationInSeconds:3 ,
        logoWidth: 70,
        showLoader: false,
        navigator: const  ResponsiveLayout(
          desktopBody: DesktopLayoutScreen(),
          mobileBody: MobileLayoutScreen(),
          tabletBody: TabletLayoutScreen(),
        ),
      ),

    );
  }
}
