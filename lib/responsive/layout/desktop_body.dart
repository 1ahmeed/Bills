import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/company_cubit.dart';
import '../../widgets/drawer_widget.dart';

class DesktopLayoutScreen extends StatefulWidget {
  const DesktopLayoutScreen({Key? key}) : super(key: key);

  @override
  State<DesktopLayoutScreen> createState() => _DesktopLayoutScreenState();
}

class _DesktopLayoutScreenState extends State<DesktopLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompanyCubit, CompanyState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey[300],
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 20, left: 20),
                height:100,
                // MediaQuery.of(context).size.height * .3,
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
              Expanded(
                child: Row(
                  children: [
                    const DrawerWidgetForDesktop(),
                    Expanded(
                        child: CompanyCubit.get(context)!.screenResponsive[CompanyCubit.get(
                            context)!.currentIndex]),
                  ],
                ),
              ),
            ],
          ),

        );
      },
    );
  }
}
