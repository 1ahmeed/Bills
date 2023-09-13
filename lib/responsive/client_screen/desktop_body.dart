import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bills/cubit/company_cubit.dart';

import '../../components/custom_text_fom_field.dart';

class DesktopClientsScreen extends StatelessWidget {
  DesktopClientsScreen({Key? key}) : super(key: key);
  final clientNameController = TextEditingController();
  final phoneController = TextEditingController();
  final numberController = TextEditingController();
  final addressController = TextEditingController();
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CompanyCubit, CompanyState>(
      listener: (context, state) {
        if(state is InsertDatabaseStatesForClient){
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
                                "Clients",
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
                          ///text form field
                          Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .06,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  label: "Client name",
                                  controller: clientNameController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return " name is required";
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
                                  label: "Phone",
                                  controller: phoneController,
                                  keyboard: TextInputType.number,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return " phone is empty";
                                    }else if(value.length!=11){
                                      return"must enter 14 digit number";
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .06,
                              ),

                              Expanded(
                                child: CustomTextFormField(
                                  hintText: "Auto Generate",
                                  // label: "Number",
                                   controller: numberController,
                                  keyboard: TextInputType.number,
                                  isClickable: false,
                                  validate: (value) {
                                    if (value!.isEmpty) {
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
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .06,
                              ),
                              Expanded(
                                child: CustomTextFormField(
                                  label: "Address",
                                  controller: addressController,
                                  validate: (value) {
                                    if (value!.isEmpty) {
                                      return " address field is empty";
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
                                    clientNameController.clear();
                                    phoneController.clear();
                                    numberController.clear();
                                    addressController.clear();
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
                                      CompanyCubit.get(context)!.insertDatabaseForClient(
                                        context:context ,
                                        phone: phoneController.text,
                                        address: addressController.text,
                                        clientName: clientNameController.text,
                                        // number: int.parse(numberController.text),
                                      );
                                      clientNameController.clear();
                                      phoneController.clear();
                                      numberController.clear();
                                      addressController.clear();

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
