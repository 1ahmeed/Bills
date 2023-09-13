import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bills/cubit/company_cubit.dart';

import '../../components/custom_text_fom_field.dart';

class DesktopUnitScreen extends StatelessWidget {
  DesktopUnitScreen({Key? key}) : super(key: key);
  final unitNameController = TextEditingController();
  final unitNotesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if (state is InsertDatabaseStatesForUnit) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                backgroundColor: Colors.green,
                padding: EdgeInsets.all(12),
                duration: Duration(seconds: 2),
                content: Text("Insert Successfully")),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            body: Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * .10,
                right: MediaQuery.of(context).size.width * .10,
              ),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Card(
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ///headers
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
                                "Units Form",
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

                          ///TextFormFields
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .06,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  // hintText: "Unit name",
                                  label: "Unit name",
                                  controller: unitNameController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return " company name is required";
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
                                width: MediaQuery.of(context).size.width * .07,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  label: "Notes",
                                  controller: unitNotesController,
                                  maxLines: 7,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return "please enter your notes";
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
                                    unitNotesController.clear();
                                    unitNameController.clear();
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
                                    if (formKey.currentState!.validate()) {
                                      CompanyCubit.get(context)!
                                          .insertDatabaseForUnit(
                                          unitName: unitNameController.text,
                                          unitNotes: unitNotesController.text,
                                          context: context);
                                      unitNotesController.clear();
                                      unitNameController.clear();
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
                                        'Save',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
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
