import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/company_cubit.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AppBar(

          title: Text(
            CompanyCubit.get(context)!.titles[CompanyCubit.get(context)!
                .currentIndex],
            style: const TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: ({context}) {
                  CompanyCubit.get(context)!.clearTable();
                },

                icon: const Icon(Icons.delete))
          ],
        );
      },
    );
  }
}
