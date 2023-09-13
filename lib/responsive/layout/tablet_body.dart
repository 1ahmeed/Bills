import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/company_cubit.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/drawer_widget.dart';

class TabletLayoutScreen extends  StatefulWidget {
  const TabletLayoutScreen({Key? key}) : super(key: key);

  @override
  State<TabletLayoutScreen> createState() => _TabletLayoutScreenState();
}

class _TabletLayoutScreenState extends State<TabletLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit , CompanyState>(
      builder: (context, state) {
        return  Scaffold(
          // backgroundColor: Colors.blueAccent,
          appBar:const PreferredSize(
              preferredSize:Size.fromHeight(60) ,
              child: AppBarWidget()),
          body: Row(
            children: [
                 const DrawerWidget(),
               Expanded(
                   child: CompanyCubit.get(context)!.screenResponsive[CompanyCubit.get(context)!.currentIndex]),
            ],
          ),
        );
      },
    );
  }
}
