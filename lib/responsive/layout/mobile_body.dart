import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bills/widgets/app_bar_widget.dart';
import 'package:bills/widgets/drawer_widget.dart';

import '../../cubit/company_cubit.dart';


class MobileLayoutScreen extends  StatefulWidget {
  const MobileLayoutScreen({Key? key}) : super(key: key);

  @override
  State<MobileLayoutScreen> createState() => _MobileLayoutScreenState();
}

class _MobileLayoutScreenState extends State<MobileLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit , CompanyState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey,
          appBar:const PreferredSize(
              preferredSize:Size.fromHeight(60) ,
              child: AppBarWidget()),
          drawer: const SafeArea(
            child: DrawerWidget(),
          ),
          body: CompanyCubit.get(context)
              ?.screenResponsive[CompanyCubit.get(context)!.currentIndex],
        );
      },
    );
  }
}
