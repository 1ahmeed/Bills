import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bills/components/custom_text_fom_field.dart';
import 'package:bills/cubit/company_cubit.dart';



class MobileCompanyScreen extends StatefulWidget {
  const MobileCompanyScreen({
    super.key,
  });

  @override
  State<MobileCompanyScreen> createState() => _MobileCompanyScreenState();
}

class _MobileCompanyScreenState extends State<MobileCompanyScreen> {
  final companyNameController = TextEditingController();

  final companyNotesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if(state is InsertDatabaseStatesForCompany){
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
          // appBar: const PreferredSize(
          //     preferredSize:Size.fromHeight(60) ,
          //     child: AppBarWidget()),
          //   drawer: const DrawerWidget(),
            body: Padding(
              padding:  EdgeInsets.only(
                left:MediaQuery.of(context).size.width * .10,
                right:MediaQuery.of(context).size.width * .10,
              ),
              child: Center(
                child: Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    physics:const  BouncingScrollPhysics(),
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
                              "Company Data Form",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "This is the basic horizontal form with labels on left and cost "
                                  "estimation form is the default position ",
                              // style:TextStyle(
                              //   fontSize: MediaQuery.of(context).size.width*.02
                              // ) ,
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
                            Expanded(
                              child: CustomTextFormField(
                                label: "Company name",
                                controller: companyNameController,
                                validate: (value) {
                                  if (value!.isEmpty) {
                                    return " Enter company name";
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
                              width: MediaQuery.of(context).size.width * .06,
                            ),
                            Expanded(
                              child: CustomTextFormField(
                                label: "Notes",
                                controller: companyNotesController,
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
                                  companyNotesController.clear();
                                  companyNameController.clear();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(9))),
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
                                    CompanyCubit.get(context)
                                        ?.insertDatabaseForCompany(
                                        companyName: companyNameController.text,
                                        companyNotes: companyNotesController.text,
                                        context: context
                                    );
                                    companyNotesController.clear();
                                    companyNameController.clear();
                                  }
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(9))),
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
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
