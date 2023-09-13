import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:bills/cubit/company_cubit.dart';
import '../../components/custom_text_fom_field.dart';

class TabletSalesInvoiceScreen extends StatelessWidget {
  TabletSalesInvoiceScreen({Key? key}) : super(key: key);
  final billsDateController = TextEditingController();
  final billsNumberController = TextEditingController();
  final sellPriceController = TextEditingController();
  final quantityController = TextEditingController();
  final totalItemController = TextEditingController();
  final billsTotalController = TextEditingController();
  final discountItemDetailsController = TextEditingController();
  final balanceItemDetailsController = TextEditingController();
  final precentageDiscountController = TextEditingController();
  final valueDiscountController = TextEditingController();
  final paidController = TextEditingController();
  final employeeNameController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final theNetController = TextEditingController();
  final theRestController = TextEditingController();
  final  List<GlobalKey<FormState>> formKeys = [GlobalKey<FormState>(), GlobalKey<FormState>(),];


  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      CompanyCubit.get(context)!.getDataFromDatabaseForCompany(
          database: CompanyCubit.get(context)!.database);
      CompanyCubit.get(context)!.getDataFromDatabaseForType(
          database: CompanyCubit.get(context)!.database);
      CompanyCubit.get(context)!.getDataFromDatabaseForClient(
          database: CompanyCubit.get(context)!.database);
      CompanyCubit.get(context)!.getDataFromDatabaseForItem(
          database: CompanyCubit.get(context)!.database);
      return BlocConsumer<CompanyCubit, CompanyState>(
        listener: (context, state) {
          if (state is InsertDatabaseStatesForTableItem) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.all(12),
                  duration: Duration(seconds: 2),
                  content: Text("Insert Table Item Successfully")),
            );
          }
          if (state is InsertDatabaseStatesForOtherDetails) {
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
          billsTotalController.text =
              CompanyCubit.get(context)!.billTotal.toString();
          sellPriceController.text=CompanyCubit.get(context)!.sellPriceAuto.toString();
          valueDiscountController.text =
              CompanyCubit.get(context)!.valueOfDiscount.toString();
          theNetController.text = CompanyCubit.get(context)!.net.toString();
          theRestController.text = CompanyCubit.get(context)!.rest.toString();
          return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .10,
                  right: MediaQuery.of(context).size.width * .10,
                ),
                child: Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Form(
                      key: formKeys[0],
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ///bills Details
                          Card(
                            child: Column(
                              children: [
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
                                      "Sales Invoice",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(Icons.person_2_outlined),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text("Bills Details")
                                      ],
                                    ),
                                  ),
                                ),
                                const DottedLine(),
                                const SizedBox(
                                  height: 20,
                                ),
                                ///bills Date
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Bills Date",
                                        controller: billsDateController,
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.parse('1980-12-02'),
                                              lastDate:
                                              DateTime.parse('2025-12-02'))
                                              .then((value) {
                                            // print(DateFormat.yMMMd().format(value!));
                                            billsDateController.text =
                                                DateFormat("yyyy-MM-dd").format(value!);
                                          });
                                          // print(billsDateController.text);

                                        },
                                        maxLines: 1,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " Bills Date is required";
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
                                ///bills Num
                                Row(
                                  children: [
                                    SizedBox(
                                      width:
                                      MediaQuery.of(context).size.width * .05,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Bills Number",
                                        controller: billsNumberController,
                                        keyboard: TextInputType.number,
                                        hintText: "Auto Generate",
                                        maxLines: 1,
                                        isClickable: false,
                                        validate: (value) {
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
                                ///choose clients
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: DropdownButtonFormField<String>(
                                        validator: (value) => value == null
                                            ? 'Client name required'
                                            : null,
                                        hint: const Text("choose From Clients"),
                                        elevation: 20,
                                        value:
                                        CompanyCubit.get(context)!.clientName,
                                        items: CompanyCubit.get(context)!
                                            .client!
                                            .map(CompanyCubit.get(context)!
                                            .buildMenuItemsForClient)
                                            .toList(),
                                        onChanged: (value) {
                                          CompanyCubit.get(context)
                                              ?.changeDropResultForClient(value!);
                                        },
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 40,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          ///item details
                          Card(
                            child: Form(
                              key: formKeys[1],
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10.0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text("Items Details"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const DottedLine(),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  /// choose from items
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: DropdownButtonFormField<String>(
                                          hint: const Text("choose From Items"),
                                          validator: (value) => value == null
                                              ? 'item name required'
                                              : null,
                                          elevation: 200,
                                          value: CompanyCubit.get(context)!.itemName,
                                          items: CompanyCubit.get(context)!
                                              .item!
                                              .map(CompanyCubit.get(context)!
                                              .buildMenuItemsForItem)
                                              .toList(),

                                          onChanged: (value) {
                                            CompanyCubit.get(context)
                                                ?.changeDropResultForItem(value!);
                                            CompanyCubit.get(context)!
                                                .getItemSellAuto(name: value);
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
                                  ///selling price
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width * .07,
                                      ),
                                      Expanded(child:
                                      CustomTextFormField(
                                        controller:sellPriceController ,
                                        validate: (value){
                                          return null;
                                        },
                                        label: "Selling Price",
                                        isClickable: false,

                                      )
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ///quantity
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width * .07,
                                      ),
                                      Expanded(
                                        child: CustomTextFormField(
                                          label: "Quantity",
                                          controller: quantityController,
                                          keyboard: TextInputType.number,
                                          maxLines: 1,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return " Quantity is required";
                                            } else if (int.parse(
                                                quantityController.text) <
                                                0) {
                                              return "Quantity Must be Greater than Zero";
                                            }
                                            return null;
                                          },
                                          onchange: (value) {
                                            if(value.isEmpty){
                                              return;
                                            }else{
                                              CompanyCubit.get(context)!.getTotalOfItem(
                                                  quantity: double.parse(
                                                      quantityController.text),
                                                  sell: double.parse(sellPriceController.text));
                                              totalItemController.text=CompanyCubit.get(context)!.totalOfItem.toString();

                                            }

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
                                  ///total
                                  Row(
                                    children: [
                                      SizedBox(
                                        width:
                                        MediaQuery.of(context).size.width * .07,
                                      ),
                                      Expanded(
                                          child:CustomTextFormField(
                                            controller:totalItemController ,
                                            validate: (value){
                                              return null;
                                            },
                                            label: "Total",
                                            isClickable: false,
                                          )

                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),

                                  ///add
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 45,
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: TextButton(
                                          onPressed: ()async {
                                            if (formKeys[1].currentState!.validate()){
                                              CompanyCubit.get(context)!.getFkForTableSalesAuto(
                                                  name: CompanyCubit.get(context)!.clientName
                                              );
                                              CompanyCubit.get(context)!
                                                  .insertDatabaseForTableSales(
                                                  clientName: CompanyCubit.get(context)!.clientName,
                                                  quantity: quantityController.text,
                                                  date: billsDateController.text,
                                                  itemName: CompanyCubit.get(context)!.itemName,
                                                  total:double.parse(totalItemController.text),
                                                  context: context,
                                                  sellPrice: sellPriceController.text);

                                              CompanyCubit.get(context)!.getBillTotal(
                                                  name: CompanyCubit.get(context)!.clientName,
                                                  total:double.parse(totalItemController.text)
                                              );
                                            }

                                          },
                                          style: TextButton.styleFrom(
                                              backgroundColor: Colors.green,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(9))),
                                          child: const Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                FontAwesomeIcons.penToSquare,
                                                color: Colors.white,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'add',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if (state is GetDatabaseStatesForTableItem)
                                    CompanyCubit.get(context)!.buildDataTable()
                                ],
                              ),
                            ),
                          ),
                          ///Other details
                          Card(
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(FontAwesomeIcons.bookOpen),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Other Details")
                                      ],
                                    ),
                                  ),
                                ),
                                const DottedLine(),
                                const SizedBox(
                                  height: 30,
                                ),
                                ///bills total
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),

                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "bill Total",
                                        controller: billsTotalController,
                                        isClickable: false,
                                        validate: (value) {
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
                                  height: 10,
                                ),
                                ///Percentage Discount
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Percentage Discount",
                                        controller: precentageDiscountController,
                                        keyboard: TextInputType.number,
                                        onchange: (value) {
                                          CompanyCubit.get(context)!.getValueDiscount(
                                            billsTotal: double.parse(billsTotalController.text),
                                            discount:
                                            double.parse(precentageDiscountController.text),
                                          );

                                          CompanyCubit.get(context)!.getTheNet(
                                            total: double.parse(billsTotalController.text),
                                            discount:
                                            double.parse(precentageDiscountController.text),
                                          );
                                        },
                                        maxLines: 1,
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " discount is required";
                                          } else if (int.parse(
                                              precentageDiscountController.text) <
                                              0) {
                                            return " discount Must be Zero or Greater";
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
                                ///value discount
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Value Discount",
                                        controller: valueDiscountController,
                                        isClickable: false,
                                        validate: (value) {
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
                                ///the net
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "The Net",
                                        controller: theNetController,
                                        isClickable: false,
                                        validate: (value) {
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
                                ///paid up
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Paid Up",
                                        controller: paidController,
                                        keyboard: TextInputType.number,
                                        onchange: (value) {
                                          CompanyCubit.get(context)!.getTheRest(
                                            net: double.parse(theNetController.text),
                                            paid: double.parse(paidController.text),
                                          );
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " paid up is empty";
                                          } else if (int.parse(paidController.text) < 0) {
                                            return " value Must be Zero or Greater";
                                          } else if (double.parse(paidController.text) <
                                              double.parse(theNetController.text)) {
                                            return "paid Must be Greater than the net";
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
                                ///the rest
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .08,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "The Rest",
                                        controller: theRestController,
                                        isClickable: false,
                                        validate: (value) {
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

                                ///request a form
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
                                      "Request a form",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ///employee name
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Employee name",
                                        controller: employeeNameController,
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
                                ///the dae
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Date",
                                        controller: dateController,
                                        onTap: () {
                                          showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime.parse('2050-12-02'))
                                              .then((value) {
                                            debugPrint(DateFormat.yMd().format(value!));
                                            dateController.text =
                                                DateFormat.yMd().format(value);
                                          });
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " Date is required";
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
                                ///start time
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "Start Time",
                                        controller: startTimeController,
                                        keyboard: TextInputType.datetime,
                                        onTap: () {
                                          showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                              .then((value) {
                                            startTimeController.text =
                                            value?.format(context) as String;
                                            debugPrint(value?.format(context));
                                          });
                                          // .catchError((error) => debugPrint(error.toString()));
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " start time is empty";
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
                                ///end time
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width * .06,
                                    ),
                                    Expanded(
                                      child: CustomTextFormField(
                                        label: "End time",
                                        controller: endTimeController,
                                        onTap: () {
                                          showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                              .then((value) {
                                            endTimeController.text =
                                            value?.format(context) as String;
                                            debugPrint(value?.format(context));
                                          });
                                          // .catchError((error) => debugPrint(error.toString()));
                                        },
                                        validate: (value) {
                                          if (value!.isEmpty) {
                                            return " End time is empty";
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

                                ///buttons
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: TextButton(
                                        onPressed: () {},
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
                                          if (formKeys[0].currentState!.validate()) {
                                            CompanyCubit.get(context)!
                                                .insertDatabaseForOtherDetails(
                                              context: context,
                                              billsDate: billsDateController.text,
                                              clientName: CompanyCubit.get(context)!.clientName,
                                              itemName: CompanyCubit.get(context)!.itemName,
                                              quantity: quantityController.text,
                                              sellPrice: sellPriceController.text,
                                              total: billsTotalController.text,
                                              valueDiscount: valueDiscountController.text,
                                              billsTotal: billsTotalController.text,
                                              date: dateController.text,
                                              employeeName: employeeNameController.text,
                                              endDate: endTimeController.text,
                                              paidUp: paidController.text,
                                              percentDiscount: valueDiscountController.text,
                                              startDate: startTimeController.text,
                                              theNet: theNetController.text,
                                              theRest: theRestController.text,
                                            );
                                            quantityController.clear();
                                            totalItemController.clear();
                                            precentageDiscountController.clear();
                                            // billsTotalController.text="";
                                            // CompanyCubit.get(context)!.billTotal.toString()=""
                                            //  valueDiscountController.clear();
                                            theNetController.clear();
                                            // theNetController.clear();
                                            paidController.clear();
                                            // theRestController.clear();
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
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      );
    });
  }
}
