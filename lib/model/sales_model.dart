class SalesModel {
   int? itemCode;
  String? itemName;
   String? unit;
  String? quantity;
  double? sellingPrice;
  String? clientName;
  // String? discount;
  double? total;
  // String? balance;

  SalesModel(
      {this.total,
      // this.discount,
      this.quantity,
      this.clientName,
      this.itemName,
      // this.balance,
       this.itemCode,
      this.sellingPrice,
       this.unit
  });
}
