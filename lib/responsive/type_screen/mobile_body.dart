import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bills/cubit/company_cubit.dart';

import '../../components/custom_text_fom_field.dart';

class MobileTypesScreen extends StatelessWidget {
  MobileTypesScreen({Key? key}) : super(key: key);
  final typesNameController = TextEditingController();
  final typesNotesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          CompanyCubit.get(context)!.getDataFromDatabaseForCompany(database:
          CompanyCubit.get(context)!.database);
          return BlocConsumer<CompanyCubit, CompanyState>(
            listener: (context, state) {
              if(state is InsertDatabaseStatesForType){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      backgroundColor: Colors.green,
                      padding:EdgeInsets.all(12) ,
                      duration: Duration(seconds: 2),
                      content: Text("Insert Successfully")),);
              }
            },
            builder: (context, state) {
              return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .08,
                      right: MediaQuery.of(context).size.width * .08,
                    ),
                    child: Center(
                      child: Card(
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
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
                                      "Types Form",
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
                                /// company name
                                Row(
                                  children: [
                                    const SizedBox(width: 40,),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) => value == null
                                            ? 'Company name required' : null,

                                        hint: const Text("choose Company Name"),
                                        elevation: 200,
                                        value: CompanyCubit.get(context)!.companyName,
                                        items: CompanyCubit.get(context)!
                                            .company!
                                            .map(
                                            CompanyCubit.get(context)!.buildMenuItemsForCompany)
                                            .toList(),
                                        onChanged: (value) {
                                          CompanyCubit.get(context)
                                              ?.changeDropResultForCompany(value!);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 40,),

                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ///type name
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .07,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Type name ",
                                        controller: typesNameController,

                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "please enter Type name";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
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
                                        controller: typesNotesController,
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
                                      width: 20,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: TextButton(
                                        onPressed: () {
                                          typesNotesController.clear();
                                          typesNameController.clear();
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
                                            CompanyCubit.get(context)?.insertDatabaseForType(
                                              companyName: CompanyCubit.get(context)?.companyName,
                                              typeName: typesNameController.text,
                                              typeNotes:typesNotesController.text ,
                                              context:context ,
                                            );
                                            typesNotesController.clear();
                                            typesNameController.clear();
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
    );
  }
}
