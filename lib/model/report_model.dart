class ReportModel {
  final String? billsDate;
  final int? billsNum;
  final String? clientName;
  final String? itemName;
  final String? sellPrice;
  final String? quantity;
  final double? total;
  final double? billsTotal;
  final String? percentDiscount;
  final double? valueDiscount;
  final double? theNet;
  final double? paidUp;
  final double? theRest;
  final String? employeeName;
  final String? date;
  final String? startDate;
  final String? endDate;

  ReportModel(
      {
        this.billsNum,
        this.billsDate,
       this.clientName,
       this.itemName,
       this.sellPrice,
       this.quantity,
        this.total,
       this.billsTotal,
       this.percentDiscount,
       this.valueDiscount,
       this.theNet,
       this.paidUp,
       this.theRest,
       this.employeeName,
       this.date,
       this.startDate,
       this.endDate});
}
