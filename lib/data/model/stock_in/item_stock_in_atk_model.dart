class ItemStockInATKModel {
  final String company;
  final String site;
  final String warehouse;
  final String id;
  final String itemName;
  final String brand;
  final String uom;
  final int quantity;
  final String remarks;

  ItemStockInATKModel(
      {required this.company,
        required this.site,
        required this.warehouse,
        required this.id,
        required this.itemName,
        required this.brand,
        required this.uom,
        required this.quantity,
        required this.remarks});
}
