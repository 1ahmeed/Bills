import 'package:flutter/material.dart';

import '../layout/desktop_body.dart';
import '../layout/mobile_body.dart';
import '../layout/responsive_layout.dart';
import '../layout/tablet_body.dart';

class ResponsiveSplashScreen extends StatelessWidget {
  final Widget mobileBody;
   final Widget tabletBody;
  // final Widget desktopBody;

  const ResponsiveSplashScreen({super.key,
    required this.mobileBody,
     required this.tabletBody,
    // required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileBody;
        }
        else if (constraints.maxWidth < 1100) {
          return tabletBody;
        } else {
          return const ResponsiveLayout(
            desktopBody: DesktopLayoutScreen(),
            mobileBody: MobileLayoutScreen(),
            tabletBody: TabletLayoutScreen(),
          );
        }
      },
    );
  }
}
