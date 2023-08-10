import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/car/car_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class ChangeCarController extends BaseController with MasterDataMixin{
  final idSite = Rxn<int>();
  final listCar = <CarModel>[].obs;
  final selectedCar= Rxn<CarModel>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    final cars = await getListCar(
      idSite: idSite.value
    );
    listCar(cars);
    selectedCar(listCar.first);
  }

  void onChangeSelectedCar(String id) {
    final selected = listCar.firstWhere((item) => item.id == id.toInt());
    selectedCar(selected);
  }

  CarModel? selectCar(){
    return selectedCar.value;
  }
}
