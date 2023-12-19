class ItemRequestATKModel {
  final String id;
  final String company;
  final String site;
  final String brand;
  final String item;
  final String warehouse;
  final int quantity;
  final String uom;
  String? remarks;

  ItemRequestATKModel(
      {required this.id,
      required this.company,
      required this.site,
      required this.brand,
      required this.item,
      required this.warehouse,
      required this.quantity,
      required this.uom,
        this.remarks
      });
}
