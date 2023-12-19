import 'dart:async';
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
import 'package:gais/data/model/reference/get_hotel_model.dart';
import 'package:gais/data/model/reference/get_hotel_type_model.dart';
import 'package:gais/data/model/reference/get_job_band_model.dart';
import 'package:gais/data/model/reference/get_site_model.dart';
import 'package:gais/data/model/reference/get_status_document_model.dart';
import 'package:gais/data/model/reference/get_tlk_job_model.dart';
import 'package:gais/data/model/reference/get_traveller_type_model.dart';
import 'package:gais/data/model/reference/get_user_ga_model.dart';
import 'package:gais/data/model/reference/get_zona_byid_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_vendor_model.dart';
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

  Future<GetUserGaModel> getUserGA();
}
