part of 'company_cubit.dart';

@immutable
abstract class CompanyState {}

class CompanyInitial extends CompanyState {}


class InsertDatabaseStatesForCompany extends CompanyState {}
class InsertDatabaseStatesForType extends CompanyState {}
class InsertDatabaseStatesForUnit extends CompanyState {}
class InsertDatabaseStatesForItem extends CompanyState {}
class InsertDatabaseStatesForClient extends CompanyState {}
class InsertDatabaseStatesForBillsDetails extends CompanyState {}
class InsertDatabaseStatesForTableItem extends CompanyState {}
class InsertDatabaseStatesForOtherDetails extends CompanyState {}

class ChangeDropMenuSuccessState extends CompanyState {}


class GetDatabaseLoadingStatesForCompany extends CompanyState {}
class GetDatabaseStatesForCompany extends CompanyState {}

class GetDatabaseStatesForType extends CompanyState {}
class GetDatabaseLoadingStatesForType extends CompanyState {}

class GetDatabaseLoadingStatesForClient extends CompanyState {}
class GetDatabaseStatesForClient extends CompanyState {}

class GetDatabaseLoadingStatesForItem extends CompanyState {}
class GetDatabaseStatesForItem extends CompanyState{}

class GetDatabaseLoadingStatesForTableSales extends CompanyState {}
class GetDatabaseStatesForTableItem extends CompanyState{}
class GetDatabaseLoadingStatesForReportTable extends CompanyState {}
class GetDatabaseLoadingStatesForReportTable2 extends CompanyState {}
class GetDatabaseStatesForReportTable extends CompanyState{}
class GetDatabaseStatesForReportTable2 extends CompanyState{}

class DeleteTableSuccessStates extends CompanyState {}
class AutoFillSellPriceSuccessStates extends CompanyState {}
class GetForeignKeySuccessStates extends CompanyState {}
class GetBillTotalSuccessStates extends CompanyState {}
class TotalSellAndQuantitySuccessStates extends CompanyState {}
class GetDiscountSuccessStates extends CompanyState {}
class GetTheNetSuccessStates extends CompanyState {}
class GetTheRestSuccessStates extends CompanyState {}
class LayoutDeleteTableSuccessStates extends CompanyState {}
class LayoutChangeDrawerSuccessState extends CompanyState {}

class CreateDatabaseSuccessStates extends CompanyState {}



