

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../components/custom_text_fom_field.dart';
import '../../cubit/company_cubit.dart';

class TabletSalesReportScreen extends StatelessWidget {
  TabletSalesReportScreen({Key? key}) : super(key: key);
  final period1Controller = TextEditingController();
  final period2Controller = TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        // if(state is InsertDatabaseStatesForCompany){
        //   ScaffoldMessenger.of(context).showSnackBar(
        //     const SnackBar(
        //         backgroundColor: Colors.green,
        //         padding:EdgeInsets.all(12) ,
        //         duration: Duration(seconds: 2),
        //         content: Text("Insert Successfully")),);
        // }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .10,
                right: MediaQuery.of(context).size.width * .10,),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Card(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ///header
                          Row(
                            children: <Widget>[
                              Container(
                                width: 3,
                                height: 30,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Sales Report",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "This is the basic horizontal form with labels on left"
                                    " and cost estimation form is the default position ",
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ///Text Form Field
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .06,
                              ),
                              const Text("Choose a Period :"),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: period1Controller,
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.parse('1980-12-02'),
                                        lastDate: DateTime.parse('2025-12-02'))
                                        .then((value) {
                                      // print(DateFormat.yMMMd().format(value!));
                                      period1Controller.text =
                                          DateFormat("yyyy-MM-dd").format(value!);
                                      // print(period1Controller.text);

                                    });
                                  },
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return " Enter period";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .05,
                              ),
                              const Text("Choose a Period :"),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  controller: period2Controller,
                                  onTap: () {
                                    showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.parse('1980-12-02'),
                                        lastDate: DateTime.parse('2025-12-02'))
                                        .then((value) {
                                      // print(DateFormat.yMMMd().format(value!));
                                      period2Controller.text =
                                          DateFormat("yyyy-MM-dd").format(value!);
                                      // print(period2Controller.text);

                                    });
                                  },
                                  maxLines: 1,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter period";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              SizedBox(
                                height: 40,
                                child: TextButton(
                                  onPressed: () {
                                    period1Controller.clear();
                                    period2Controller.clear();
                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(9))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.delete_outline,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Cancel',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              SizedBox(
                                height: 40,
                                child: TextButton(
                                  onPressed: () {
                                    if(formKey.currentState!.validate()){
                                      CompanyCubit.get(context)?.getDataFromDatabaseForOtherDetails(
                                          date1: period1Controller.text,
                                          date2: period2Controller.text,
                                          database:CompanyCubit.get(context)!.database
                                      );
                                      period1Controller.clear();
                                      period2Controller.clear();

                                    }

                                  },
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(9))),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.penToSquare,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'search',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          if(state is GetDatabaseStatesForReportTable)
                            const SizedBox(
                              width: 15,
                            ),
                          if(state is GetDatabaseStatesForReportTable)
                            CompanyCubit.get(context)!.buildDataTableForReport(),
                          const SizedBox(height: 10,),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
