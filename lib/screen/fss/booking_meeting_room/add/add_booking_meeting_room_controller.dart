import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddBookingMeetingRoomController extends BaseController
    with MasterDataMixin {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController meetingRoomController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();
  final TextEditingController participantController = TextEditingController();
  final TextEditingController linkController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  TextfieldTagsController textfieldTagsController = TextfieldTagsController();
  final formKey = GlobalKey<FormState>();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();

  final startTime = Rxn<DateTime>();
  final endTime = Rxn<DateTime>();

  final enableButton = false.obs;

  final List<String> emails = [
    "Kaitlyn Beck",
    "Eduardo Pearson",
    "Kiara Hendricks",
    "Dash Lawson",
    "Phoebe Miranda",
    "Rory Dejesus",
    "Julissa Macdonald",
    "Hugh Bond",
    "Alena Stein",
    "Creed Garner",
    "Jacqueline Harrington",
    "Omari Stafford",
    "Bridget Ortega",
    "Kobe Owens",
    "Amaya Lim",
    "Cal Hammond",
    "Holly Rosas",
    "Remi Gillespie",
    "Alianna Vazquez",
    "Jesse Sherman",
    "Addilyn Daniel",
    "Grady Abbott",
    "Melany Reynolds",
    "Vincent Erickson",
    "Sabrina Orozco",
    "Keanu Mann",
    "Paislee Madden",
    "Everest Cuevas",
    "Adele Bryant",
    "Jonah Branch",
    "Luisa Cisneros",
    "Alden Barber",
    "Cassidy Rasmussen",
    "Will Rosario",
    "Louisa Blake",
    "Zyaire Norman",
    "Malani Barry",
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }
}
