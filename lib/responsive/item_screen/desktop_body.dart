import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../components/custom_text_fom_field.dart';
import '../../cubit/company_cubit.dart';

class DesktopItemsScreen extends StatelessWidget {
  DesktopItemsScreen({Key? key}) : super(key: key);

  final itemNameController = TextEditingController();
  final sellingPriceController = TextEditingController();
  final buyingPriceController = TextEditingController();
  final notesController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          CompanyCubit.get(context)!.getDataFromDatabaseForCompany(
              database: CompanyCubit.get(context)!.database
          );
          CompanyCubit.get(context)!.getDataFromDatabaseForType(
              database: CompanyCubit.get(context)!.database
          );

          return BlocConsumer<CompanyCubit, CompanyState>(
            listener: (context, state) {
              if(state is InsertDatabaseStatesForItem){
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
                                      "Items Form",
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

                                ///textFormField
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
                                            .map(CompanyCubit.get(context)!.buildMenuItemsForCompany)
                                            .toList(),
                                        onChanged: (value) {
                                          CompanyCubit.get(context)?.changeDropResultForCompany(value!);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 40,),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(width: 40,),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) => value == null
                                            ? 'Type name required' : null,
                                        hint: const Text("choose Type Name"),
                                        elevation: 200,
                                        value: CompanyCubit.get(context)!.typeName,
                                        items: CompanyCubit.get(context)!
                                            .type!
                                            .map(CompanyCubit.get(context)!.buildMenuItemsForType)
                                            .toList(),
                                        onChanged: (value) {
                                          CompanyCubit.get(context)?.changeDropResultForType(value!);
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 40,),

                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),

                                ///item name
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Item name",
                                        controller: itemNameController,
                                        maxLines: 1,
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
                                        label: "Selling Price",
                                        controller: sellingPriceController,
                                        keyboard: TextInputType.number,
                                        maxLines: 1,
                                        validate: ( value) {
                                          if (value!.isEmpty) {
                                            return " selling is empty";
                                          }else if(int.parse(value) < 0){
                                            return "Must be zero or Greater";
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
                                        label: "Buying Price",
                                        controller: buyingPriceController,
                                        keyboard:TextInputType.number ,
                                        maxLines: 1,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return "buying field is empty";
                                          }else if(int.parse(value) <0){
                                            return"Must be zero or Greater";
                                          }else if (
                                          int.parse(sellingPriceController.text) < int.parse(value)
                                          ){
                                            return"Must be equal SELLING PRICE or less";
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
                                        controller: notesController,
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
                                          notesController.clear();
                                          itemNameController.clear();
                                          sellingPriceController.clear();
                                          buyingPriceController.clear();
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
                                            CompanyCubit.get(context)!.insertDatabaseForItem(
                                              typeName: CompanyCubit.get(context)!.typeName,
                                              companyName: CompanyCubit.get(context)!.companyName,
                                              buyPrice: buyingPriceController.text,
                                              itemName: itemNameController.text,
                                              itemNotes:  notesController.text,
                                              sellPrice: sellingPriceController.text,
                                              context: context,
                                            );
                                            notesController.clear();
                                            itemNameController.clear();
                                            sellingPriceController.clear();
                                            buyingPriceController.clear();
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
                                  height: 20,
                                )
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
