import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/company_cubit.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          width: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 20),
                  height: 100,
                  width: double.infinity,
                  color: Colors.grey.shade300,
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'BILLS SYSTEM',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 25,
                    ),
                  ),
                ),
                const DottedLine(),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 0,
                  leading: const Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Home Page',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(0);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 1,
                  leading: const Icon(
                    FontAwesomeIcons.penToSquare,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Company Data',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(1);

                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) =>  ResponsiveCompanyScreen(
                    //       mobileBody: const MobileCompanyScreen(),
                    //       tabletBody: TabletCompanyScreen(),
                    //       desktopBody: DesktopCompanyScreen()
                    //   ),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 2,
                  leading: const Icon(
                    Icons.incomplete_circle_rounded,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Types',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(2);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 3,
                  leading: const Icon(
                    Icons.support,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'All Units',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(3);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 4,
                  leading: const Icon(
                    Icons.layers_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Items',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(4);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 5,
                  leading: const Icon(
                    Icons.supervisor_account,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Clients',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(5);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 6,
                  leading: const Icon(
                    FontAwesomeIcons.sliders,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'sales invoice',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(6);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 7,
                  leading: const Icon(
                    Icons.extension_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Sales report',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(7);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class DrawerWidgetForDesktop extends StatelessWidget {
  const DrawerWidgetForDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Drawer(
          width: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 0,
                  leading: const Icon(
                    Icons.home,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Home Page',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(0);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 1,
                  leading: const Icon(
                    FontAwesomeIcons.penToSquare,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Company Data',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(1);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) =>  ResponsiveCompanyScreen(
                    //       mobileBody: const MobileCompanyScreen(),
                    //       tabletBody: TabletCompanyScreen(),
                    //       desktopBody: DesktopCompanyScreen()
                    //   ),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 2,
                  leading: const Icon(
                    Icons.incomplete_circle_rounded,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Types',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(2);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 3,
                  leading: const Icon(
                    Icons.support,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'All Units',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(3);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 4,
                  leading: const Icon(
                    Icons.layers_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Items',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(4);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 5,
                  leading: const Icon(
                    Icons.supervisor_account,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Clients',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(5);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 6,
                  leading: const Icon(
                    FontAwesomeIcons.sliders,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'sales invoice',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(6);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
                ListTile(
                  selected: CompanyCubit.get(context)?.currentIndex == 7,
                  leading: const Icon(
                    Icons.extension_outlined,
                    size: 25,
                    color: Colors.blue,
                  ),
                  title: const Text(
                    'Sales report',
                  ),
                  onTap: () {
                    CompanyCubit.get(context)?.changeIndex(7);
                    // Navigator.pop(context);
                    // Navigator.of(context).push(MaterialPageRoute(
                    //   builder: (context) => const HomeScreen(),
                    // ));
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
