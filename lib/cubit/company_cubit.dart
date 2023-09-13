import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sqflite/sqflite.dart';
import 'package:bills/model/report_model.dart';
import 'package:bills/responsive/client_screen/desktop_body.dart';
import 'package:bills/responsive/client_screen/mobile_body.dart';
import 'package:bills/responsive/client_screen/responsive_client_screen.dart';
import 'package:bills/responsive/client_screen/tablet_body.dart';
import 'package:bills/responsive/company_screen/desktop_body.dart';
import 'package:bills/responsive/company_screen/mobile_body.dart';
import 'package:bills/responsive/company_screen/responsive_company_screen.dart';
import 'package:bills/responsive/home_screen/desktop_body.dart';
import 'package:bills/responsive/home_screen/responsive_home_screen.dart';
import 'package:bills/responsive/home_screen/tablet_body.dart';
import 'package:bills/responsive/item_screen/desktop_body.dart';
import 'package:bills/responsive/item_screen/mobile_body.dart';
import 'package:bills/responsive/item_screen/responsive_item_screen.dart';
import 'package:bills/responsive/item_screen/tablet_body.dart';
import 'package:bills/responsive/report_screen/desktop_body.dart';
import 'package:bills/responsive/report_screen/mobile_body.dart';
import 'package:bills/responsive/report_screen/responsive_report_screen.dart';
import 'package:bills/responsive/report_screen/tablet_body.dart';
import 'package:bills/responsive/sales_invoice_screen/mobile_body.dart';
import 'package:bills/responsive/sales_invoice_screen/responsive_sales_invoice_screen.dart';
import 'package:bills/responsive/type_screen/desktop_body.dart';
import 'package:bills/responsive/type_screen/mobile_body.dart';
import 'package:bills/responsive/type_screen/responsive_type_screen.dart';
import 'package:bills/responsive/type_screen/tablet_body.dart';
import 'package:bills/responsive/unit_screen/desktop_body.dart';
import 'package:bills/responsive/unit_screen/mobile_body.dart';
import 'package:bills/responsive/unit_screen/responsive_unit_screen.dart';
import 'package:bills/responsive/unit_screen/tablet_body.dart';
import '../model/item_model.dart';
import '../model/sales_model.dart';
import '../responsive/company_screen/tablet_body.dart';
import '../responsive/home_screen/mobile_body.dart';
import '../responsive/sales_invoice_screen/desktop_body.dart';
import '../responsive/sales_invoice_screen/tablet_body.dart';

part 'company_state.dart';

class CompanyCubit extends Cubit<CompanyState> {
  CompanyCubit() : super(CompanyInitial());

  static CompanyCubit? get(context) => BlocProvider.of(context);

  DropdownMenuItem<String> buildMenuItemsForCompany(String item) =>
      DropdownMenuItem(
          value: item,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
  String? companyName;

  String changeDropResultForCompany(String value) {
    companyName = value;
    emit(ChangeDropMenuSuccessState());
    return companyName!;
  }

  DropdownMenuItem<String> buildMenuItemsForType(String item) =>
      DropdownMenuItem(
          value: item,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
  String? typeName;

  String changeDropResultForType(String value) {
    typeName = value;
    emit(ChangeDropMenuSuccessState());
    return typeName!;
  }

  DropdownMenuItem<String> buildMenuItemsForClient(String item) =>
      DropdownMenuItem(
          value: item,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
  String? clientName;

  String changeDropResultForClient(String value) {
    clientName = value;
    emit(ChangeDropMenuSuccessState());
    return clientName!;
  }

  DropdownMenuItem<String> buildMenuItemsForItem(String item) =>
      DropdownMenuItem(
          value: item,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(
              item,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ));
  String? itemName;

  String changeDropResultForItem(String value) {
    itemName = value;
    emit(ChangeDropMenuSuccessState());
    return itemName!;
  }

  List<SalesModel> salesTable = [];

  Widget buildDataTable() {
    final columns = ["id", 'Name', "item", "quantity", "Price", "total"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: getColumns(columns),
        rows: getRows(salesTable),
      ),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            //onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<SalesModel> users) => users.map((SalesModel user) {
        final cells = [
          user.itemCode,
          user.clientName,
          user.itemName,
          user.quantity,
          user.sellingPrice,
          user.total,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  List<ReportModel> reportTable = [];

  Widget buildDataTableForReport() {
    final columns = [
      'id',
      "name",
      "bill",
      "discount",
      "net",
      "paidUp",
      "rest",
      "date"
    ];
    //"item","sell","quantity","total",
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: getColumnsForReport(columns),
        rows: getRowsForReport(reportTable),
      ),
    );
  }

  List<DataColumn> getColumnsForReport(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRowsForReport(List<ReportModel> users) =>
      users.map((ReportModel user) {
        final cells = [
          user.billsNum,
          user.clientName,
          // user.itemName,
          // user.sellPrice,
          // user.quantity,
          // user.total,
          user.billsTotal,
          user.valueDiscount,
          user.theNet,
          user.paidUp,
          user.theRest,
          user.billsDate,
        ];

        return DataRow(cells: getCellsForReport(cells));
      }).toList();

  List<DataCell> getCellsForReport(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  Database? database;
  List<Items> items = [];
  List<String>? type = [];

  List<String>? company = [];

  List<String>? client = [];

  List<String>? item = [];

  List<String> titles=[
    "Bills",
    "Companies",
    "Types",
    "All Units",
    "Items",
    "Clients",
    "Sales Invoice",
    "Sales Report",
  ];

  int currentIndex = 0;

  List<Widget> screenResponsive = [
    const ResponsiveHomeScreen(
        mobileBody: MobileHomeScreen(),
        tabletBody:  TabletHomeScreen(),
        desktopBody: DesktopHomeScreen()),
    const ResponsiveCompanyScreen(
        mobileBody:  MobileCompanyScreen(),
        tabletBody:  TabletCompanyScreen(),
        desktopBody: DesktopCompanyScreen()),
    ResponsiveTypeScreen(
      mobileBody: MobileTypesScreen(),
      tabletBody: TabletTypesScreen(),
      desktopBody: DesktopTypesScreen(),
    ),
    ResponsiveUnitScreen(
      mobileBody: MobileUnitScreen(),
      tabletBody: TabletUnitScreen(),
      desktopBody: DesktopUnitScreen(),
    ),
    ResponsiveItemScreen(
      mobileBody: MobileItemsScreen(),
      tabletBody: TabletItemsScreen(),
      desktopBody: DesktopItemsScreen(),
    ),
    ResponsiveClientScreen(
      mobileBody: MobileClientsScreen(),
      tabletBody: TabletClientsScreen(),
      desktopBody: DesktopClientsScreen(),
    ),
    ResponsiveSalesInvoiceScreen(
        mobileBody: MobileSalesInvoiceScreen(),
        tabletBody: TabletSalesInvoiceScreen(),
        desktopBody: DesktopSalesInvoiceScreen()),
    ResponsiveReportScreen(
      mobileBody: MobileSalesReportScreen(),
      tabletBody: TabletSalesReportScreen(),
      desktopBody: DesktopSalesReportScreen(),
    ),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(LayoutChangeDrawerSuccessState());
  }

  dynamic sellPriceAuto;
  var totalOfItem = 0.0;
  double valueOfDiscount = 0.0;
  double net = 0.0;
  double rest = 0.0;
  dynamic fkForTableSales;
  dynamic billTotal;

  getItemSellAuto({String? name}) async {
    database!.rawQuery("SELECT * FROM item").then((value) {
      for (var element in value) {
        if (element['item_name'] == name) {
          sellPriceAuto = element['sell_price'];
          // print(element['sell_price']);
        }
      }
      emit(AutoFillSellPriceSuccessStates());
    }).catchError((error) {});
  }

  getFkForTableSalesAuto({String? name}) async {
    database!.rawQuery("SELECT * FROM client").then((value) {
      for (var element in value) {
        if (element['client_name'] == name) {
          fkForTableSales = element['number'];
          // print("foreign key");
          // print(element['number']);
        }
      }
      emit(GetForeignKeySuccessStates());
    }).catchError((error) {});
  }

  getTotalOfItem({double? sell, double? quantity}) {
    totalOfItem = sell! * quantity!;
    emit(TotalSellAndQuantitySuccessStates());
  }

  getValueDiscount({double? discount, double? billsTotal}) {
    valueOfDiscount = (discount! / 100) * billsTotal!;
    emit(GetDiscountSuccessStates());
  }

  getTheNet({double? total, double? discount}) {
    net = total! - ((discount! / 100) * total);
    emit(GetTheNetSuccessStates());
  }

  getTheRest({double? paid, double? net}) {
    rest = paid! - net!;
    emit(GetTheRestSuccessStates());
  }

  getBillTotal({double? total, String? name}) async {
    database!
        .rawQuery(
            "SELECT SUM(total) AS bill_total FROM table_item WHERE client_name LIKE  '$name' ")
        .then((value) {
      for (var element in value) {
        billTotal = element['bill_total'];
        // print("///////////////");
        // print(element['bill_total']);
      }
      emit(GetBillTotalSuccessStates());
    }).catchError((error) {});
  }

  void createDatabase() async {
    openDatabase('companies.db', version: 1, onCreate: (database, version) {
      debugPrint("db created");

      database
          .execute(
              'CREATE TABLE company (company_name TEXT UNIQUE,company_notes TEXT)')
          .then((value) => (value) {
           debugPrint("table create");
              })
          .catchError((e) {
        debugPrint("error when creating table ${e.toString()}");
      });

      database
          .execute(
              'CREATE TABLE type (company_name TEXT,type_name TEXT UNIQUE,type_notes TEXT)')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((e) {
        debugPrint("error when creating table ${e.toString()}");
      });

      database
          .execute('CREATE TABLE unit (unit_name TEXT UNIQUE,unit_notes TEXT)')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((e) {
        debugPrint("error when creating table ${e.toString()}");
      });

      database
          .execute(
              'CREATE TABLE item (company_name TEXT,type_name TEXT,item_name TEXT UNIQUE,sell_price REAL,buy_price TEXT,item_notes TEXT)')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((e) {
        debugPrint("error when creating table ${e.toString()}");
      });

      database
          .execute(
              'CREATE TABLE client (client_name TEXT UNIQUE,phone TEXT,number INTEGER PRIMARY KEY AUTOINCREMENT,address TEXT)')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((e) {
        debugPrint("error when creating table ${e.toString()}");
      });

      database
          .execute('''
          CREATE TABLE table_item (item_code INTEGER PRIMARY KEY AUTOINCREMENT,
          client_name TEXT,item_name TEXT ,bill_date DATE,
        quantity TEXT,total REAL,sell_price REAL,bill_num INTEGER,
        FOREIGN KEY (bill_num) REFERENCES bills_details (bill_num) ON DELETE NO ACTION ON UPDATE NO ACTION )''')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((e) {
            debugPrint("error when creating table ${e.toString()}");
          });

      database
          .execute(
              '''CREATE TABLE other_details (bill_date DATE,bill_num INTEGER PRIMARY KEY AUTOINCREMENT, client_name TEXT,
          item_name TEXT , sell_price TEXT,quantity TEXT,total TEXT,bills_total REAL, percent_discount TEXT
           ,value_discount REAL, the_net REAL, paid_up REAL,the_rest REAL,employee_name TEXT,date TEXT,start_time TEXT,end_time TEXT)''')
          .then((value) => (value) {
                debugPrint("table create");
              })
          .catchError((error) {
            debugPrint("error when creating table ${error.toString()}");
          });
    }, onOpen: (database) {
      /// getDataFromDatabaseForCompany(database: database);
      /// getDataFromDatabaseForType(database: database);
      /// getDataFromDatabaseForClient(database: database);
      debugPrint("db opened");
    }).then((value) {
      database = value;
      emit(CreateDatabaseSuccessStates());
    });
  }

  insertDatabaseForCompany(
      {String? companyName, String? companyNotes, context}) async {
    database!
        .rawQuery(
            'SELECT * FROM company WHERE company_name LIKE  "%$companyName%"')
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) async {
          txn
              .rawInsert(
                  "INSERT INTO company (company_name,company_notes)VALUES('$companyName','$companyNotes')")
              .then((value) {
            debugPrint("$value inserted success");
            emit(InsertDatabaseStatesForCompany());
            getDataFromDatabaseForCompany(database: database);
          }).catchError((error) {
            debugPrint("error when inserted table ${error.toString()}");
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(12),
              duration: Duration(seconds: 2),
              content: Text("company Name already Exist")),
        );
      }
    });
  }

  insertDatabaseForType(
      {String? companyName,
      String? typeName,
      String? typeNotes,
      context}) async {
    database!
        .rawQuery('SELECT * FROM type WHERE type_name LIKE  "%$typeName%"')
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) async {
          txn
              .rawInsert(
                  "INSERT INTO type (company_name,type_name,type_notes)VALUES('$companyName','$typeName','$typeNotes')")
              .then((value) {
            debugPrint("$value inserted success");
            emit(InsertDatabaseStatesForType());
            getDataFromDatabaseForType(database: database);
          }).catchError((error) {
            debugPrint("error when inserted table ${error.toString()}");
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(12),
              duration: Duration(seconds: 2),
              content: Text("company Name already Exist")),
        );
      }
    });
  }

  insertDatabaseForUnit({String? unitName, String? unitNotes, context}) async {
    database!
        .rawQuery('SELECT * FROM unit WHERE unit_name LIKE  "%$unitName%"')
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) async {
          txn
              .rawInsert(
                  "INSERT INTO unit (unit_name,unit_notes)VALUES('$unitName','$unitNotes')")
              .then((value) {
            debugPrint("$value inserted success");
            emit(InsertDatabaseStatesForUnit());
            //getDataFromDatabaseForCompany(database);
          }).catchError((error) {
            debugPrint("error when inserted table ${error.toString()}");
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(12),
              duration: Duration(seconds: 2),
              content: Text("company Name already Exist")),
        );
      }
    });
  }

  insertDatabaseForItem(
      {String? companyName,
      String? typeName,
      String? itemName,
      String? sellPrice,
      String? buyPrice,
      String? itemNotes,
      context}) async {
    database!
        .rawQuery('SELECT * FROM item WHERE item_name LIKE  "%$itemName%"')
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) async {
          txn
              .rawInsert(
                  "INSERT INTO item (company_name,type_name,item_name,sell_price,buy_price,item_notes)VALUES('$companyName','$typeName','$itemName','$sellPrice','$buyPrice','$itemNotes')")
              .then((value) {
            debugPrint("$value inserted success");
            emit(InsertDatabaseStatesForItem());
            //getDataFromDatabaseForCompany(database);
          }).catchError((error) {
            debugPrint("error when inserted table ${error.toString()}");
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(12),
              duration: Duration(seconds: 2),
              content: Text("company Name already Exist")),
        );
      }
    });
  }

  insertDatabaseForClient(
      {String? clientName,
      String? phone,
      //int? number,
      String? address,
      context}) async {
    database!
        .rawQuery(
            'SELECT * FROM client WHERE client_name LIKE  "%$clientName%"')
        .then((value) async {
      if (value.isEmpty) {
        await database?.transaction((txn) async {
          txn
              .rawInsert(
                  "INSERT INTO client (client_name,phone,address)VALUES('$clientName','$phone','$address')")
              .then((value) {
            debugPrint("$value inserted success");
            emit(InsertDatabaseStatesForClient());
            //getDataFromDatabaseForCompany(database);
          }).catchError((error) {
            debugPrint("error when inserted table ${error.toString()}");
          });
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              backgroundColor: Colors.green,
              padding: EdgeInsets.all(12),
              duration: Duration(seconds: 2),
              content: Text("company Name already Exist")),
        );
      }
    });
  }

  // insertDatabaseForBillsDetails({
  //   String? clientName,
  //   String? billsDate,
  //   context})
  // async {
  //   database!
  //       .rawQuery(
  //       'SELECT * FROM bills_details WHERE client_name LIKE  "%$clientName%"')
  //       .then((value) async {
  //     if (value.isEmpty) {
  //       await database?.transaction((txn) async {
  //         txn.rawInsert(
  //             "INSERT INTO bills_details (client_name,bill_date)VALUES('$clientName','$billsDate')")
  //             .then((value) {
  //           debugPrint("$value inserted success");
  //           emit(InsertDatabaseStatesForBillsDetails());
  //           getDataFromDatabaseForBillDetails(database: database);
  //         }).catchError((error) {
  //           debugPrint("error when inserted table ${error.toString()}");
  //         });
  //       });
  //
  //     }else {
  //       print("company Name already Exist");
  //       // ScaffoldMessenger.of(context).showSnackBar(
  //       //   const SnackBar(
  //       //       backgroundColor: Colors.green,
  //       //       padding: EdgeInsets.all(12),
  //       //       duration: Duration(seconds: 2),
  //       //       content: Text("company Name already Exist")),
  //       // );
  //     }
  //   });
  // }
  ///

  insertDatabaseForTableSales(
      {String? itemName,
      String? date,
      String? clientName,
      String? quantity,
      String? sellPrice,
      double? total,
      context}) async {
    // database!
    //     .rawQuery(
    //     'SELECT * FROM client WHERE client_name LIKE  "%$clientName%"')
    //     .then((value) async {
    //   if (value.isEmpty) {
    //
    //   }else {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //           backgroundColor: Colors.green,
    //           padding: EdgeInsets.all(12),
    //           duration: Duration(seconds: 2),
    //           content: Text("company Name already Exist")),
    //     );
    //   }
    // });
    await database?.transaction((txn) async {
      txn.rawInsert(
          '''INSERT INTO table_item (client_name,item_name ,quantity,sell_price,bill_date,total)
          VALUES('$clientName','$itemName','$quantity','$sellPrice','$date','$total')''').then((value) {
        debugPrint("$value inserted success");
        getDataFromDatabaseForTableSales(database: database);
        emit(InsertDatabaseStatesForTableItem());
      }).catchError((error) {
        debugPrint("error when inserted table ${error.toString()}");
      });
    });
  }

  insertDatabaseForOtherDetails(
      {String? billsDate,
      String? clientName,
      String? itemName,
      String? sellPrice,
      String? quantity,
      String? total,
      String? billsTotal,
      String? percentDiscount,
      String? valueDiscount,
      String? theNet,
      String? paidUp,
      String? theRest,
      String? employeeName,
      String? date,
      String? startDate,
      String? endDate,
      context}) async {
    await database?.transaction((txn) async {
      txn.rawInsert(
          '''INSERT INTO other_details (bill_date,client_name,item_name,sell_price ,quantity,total,
          bills_total , percent_discount ,value_discount ,the_net , paid_up ,the_rest ,employee_name ,date ,
          start_time ,end_time )
           VALUES(
                  "$billsDate","$clientName","$itemName","$sellPrice","$quantity","$total","$billsTotal",
                  "$percentDiscount","$valueDiscount","$theNet",
           "$paidUp","$theRest","$employeeName","$date","$startDate","$endDate")''').then((value) {
        debugPrint("$value inserted success");
        emit(InsertDatabaseStatesForOtherDetails());
        // getDataFromDatabaseForOtherDetails(database: database);
      }).catchError((error) {
        debugPrint("error when inserted table ${error.toString()}");
      });
    });
  }

  void getDataFromDatabaseForCompany({database}) {
    company = [];
    emit(GetDatabaseLoadingStatesForCompany());
    database?.rawQuery("SELECT * FROM company").then((value) {
      value.forEach((element) {
        company?.add(element['company_name']);
      });
      // print(company);
      emit(GetDatabaseStatesForCompany());
    });
  }

  void getDataFromDatabaseForType({database}) {
    type = [];
    emit(GetDatabaseLoadingStatesForType());
    database?.rawQuery("SELECT * FROM type").then((value) {
      value.forEach((element) {
        type?.add(element['type_name']);
      });

      // print(type);
      emit(GetDatabaseStatesForType());
    });
  }

  void getDataFromDatabaseForClient({database}) {
    client = [];
    emit(GetDatabaseLoadingStatesForClient());
    database?.rawQuery("SELECT * FROM client").then((value) {
      value.forEach((element) {
        client?.add(element['client_name']);
      });
      // print(client);

      emit(GetDatabaseStatesForClient());
    });
  }

  void getDataFromDatabaseForItem({database}) {
    item = [];
    emit(GetDatabaseLoadingStatesForItem());
    database?.rawQuery("SELECT * FROM item").then((value) {
      value.forEach((element) {
        items.add(Items(element['item_name'], element['sell_price']));
        item?.add(element['item_name']);
      });
      emit(GetDatabaseStatesForItem());
    });
  }

  void getDataFromDatabaseForTableSales({database}) {
    salesTable = [];
    emit(GetDatabaseLoadingStatesForTableSales());
    database
        ?.rawQuery(
            "SELECT * FROM table_item WHERE client_name LIKE '$clientName' ")
        .then((value) {
      value.forEach((element) {
        salesTable.add(SalesModel(
          total: element['total'],
          clientName: element['client_name'],
          itemName: element['item_name'],
          itemCode: fkForTableSales,
          sellingPrice: element['sell_price'],
          quantity: element['quantity'],
        ));
      });
      emit(GetDatabaseStatesForTableItem());
    });
  }

  void getDataFromDatabaseForOtherDetails(
      {String? date1, String? date2, database}) {
    reportTable = [];
    emit(GetDatabaseLoadingStatesForReportTable());
    database
        ?.rawQuery(
            "SELECT * FROM other_details WHERE bill_date >='$date1' and bill_date <='$date2'")
        .then((value) {
      value.forEach((element) {
        reportTable.add(ReportModel(
          billsNum: element["bill_num"],
          theRest: element["the_rest"],
          theNet: element["the_net"],
          paidUp: element["paid_up"],
          valueDiscount: element["value_discount"],
          sellPrice: element["sell_price"],
          billsTotal: element["bills_total"],
          // total: element["total"],
          // itemName:element["item_name"] ,
          // quantity: element["quantity"],
          clientName: element["client_name"],
          billsDate: element["bill_date"],
        ));
      });
      // getDatabaseForOtherDetails(database:database ,date1:date1 ,date2:date2 );
      emit(GetDatabaseStatesForReportTable());
    });
  }

  ///to get data from table item for report
//   getDatabaseForOtherDetails({
//     String? date1,
//     String? date2,
//     database
// }){
//      // emit(GetDatabaseLoadingStatesForReportTable2());
//
//     database?.rawQuery("SELECT * FROM table_item WHERE bill_date >='$date1' and bill_date <='$date2'")
//         .then((value) {
//       value.forEach((element) {
//         reportTable.add(ReportModel(
//           sellPrice: element["sell_price"],
//           total: element["total"],
//           itemName:element["item_name"] ,
//           quantity: element["quantity"],
//           clientName: element["client_name"],
//         ));
//       });
//       print("*****************");
//       // emit(GetDatabaseStatesForReportTable2());
//     });
//   }

  clearTable() async {
    // await database?.rawDelete("DELETE FROM company");
    // await database?.rawDelete("DELETE FROM type");
    // await database?.rawDelete("DELETE FROM unit");
    // await database?.rawDelete("DELETE FROM item");
    // await database?.rawDelete("DELETE FROM client");
    await database?.rawDelete("DELETE FROM table_item");
    emit(LayoutDeleteTableSuccessStates());
  }
}
