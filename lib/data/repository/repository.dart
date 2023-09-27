import 'dart:async';
import 'dart:io';
import 'package:gais/data/model/cash_advance/item_cash_advance_travel_model.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart';
import 'package:gais/data/model/reference/get_coset_center_model.dart';
import 'package:gais/data/model/reference/get_currency_model.dart';
import 'package:gais/data/model/reference/get_department_model.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart';
import 'package:gais/data/model/reference/get_employee_bysite_model.dart';
import 'package:gais/data/model/reference/get_employee_model.dart';
import 'package:gais/data/model/reference/get_flight_class_model.dart';
import 'package:gais/data/model/reference/get_flight_schedule_model.dart';
import 'package:gais/data/model/reference/get_hotel_model.dart';
import 'package:gais/data/model/reference/get_hotel_type_model.dart';
import 'package:gais/data/model/reference/get_job_band_model.dart';
import 'package:gais/data/model/reference/get_site_model.dart';
import 'package:gais/data/model/reference/get_status_document_model.dart';
import 'package:gais/data/model/reference/get_tlk_job_model.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart';
import 'package:gais/data/model/reference/get_type_transportation_model.dart';
import 'package:gais/data/model/reference/get_zona_byid_model.dart';
import 'package:gais/data/model/request_trip/get_accommodation_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_vendor_model.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_byid_model.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart';
import 'package:gais/data/model/request_trip/get_detailca_bycashid_model.dart';
import 'package:gais/data/model/request_trip/get_guest_byid_model.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart';
import 'package:gais/data/model/request_trip/get_other_transport_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart';
import 'package:gais/data/model/request_trip/save_accommodation_model.dart';
import 'package:gais/data/model/request_trip/save_airlines_model.dart';
import 'package:gais/data/model/request_trip/save_other_transportation_model.dart';
import 'package:gais/data/model/request_trip/save_purpose_of_trip_model.dart';
import 'package:gais/data/model/request_trip/save_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/save_traveller_guest_model.dart';
import 'package:gais/data/model/request_trip/submit_request_trip_model.dart';
import 'package:gais/data/model/request_trip/update_accommodation_model.dart';
import 'package:gais/data/model/request_trip/update_airliness_model.dart';
import 'package:gais/data/model/request_trip/update_cash_advance_travel_model.dart';
import 'package:gais/data/model/request_trip/update_other_transport_model.dart';
import 'package:gais/data/model/request_trip/update_purpose_of_trip_model.dart';
import 'package:gais/data/model/request_trip/update_taxi_voucher_model.dart';
import 'package:gais/data/model/request_trip/update_traveller_guest_model.dart';
import 'package:gais/data/model/status_document_model.dart';

abstract class Repository {
  Future<LoginModel> postLogin(String username, String password, {String? accessToken, String? refreshToken, String? email});

  Future<EmployeeInfoModel> getEmployeeInfo();

  Future<GetDocumentCodeModel> getDocumentCodeList();

  Future<GetCityModel> getCityList();

  Future<GetZonaByidModel> getZonaByIDCity(String id);

  Future<GetSiteModel> getSiteList();

  Future<GetSiteModel> getSiteListByCompanyID(String id);

  Future<GetHotelModel> getHotelList();

  Future<GetCurrencyModel> getCurrencyList();

  Future<GetTlkJobModel> getTLKJobByIDJob(String job);

  Future<GetTravellerTypeModel> getTravellerTypeList();

  Future<GetEmployeeModel> getEmployeeList();

  Future<GetEmployeeBysiteModel> getEmployeeListBySiteID(String id);

  Future<GetDepartmentModel> getDepartmentList();

  Future<GetCompanyModel> getCompanyList();

  Future<GetJobBandModel> getJobBandList();

  Future<GetCosetCenterModel> getCostCenterList();

  Future<GetFlightClassModel> getFlightClassList();

  Future<GetStatusDocumentModel> getStatusDocument();

  Future<StatusDocumentModel> getStatusDoc();

  Future<GetAirlinessVendorModel> getAirlinessVendorList();

  Future<GetHotelTypeModel> getHotelTypeList();

  Future<void> registerFCM(String token);

  Future<void> logout();

  Future<String?> getEmail(String? accessToken);

  Future<EmployeeInfoModel> getProfile();

  Future<Map<String, dynamic>> getLineApproval();

  Future<String?> changePhotoProfile(String? filepath);
}
