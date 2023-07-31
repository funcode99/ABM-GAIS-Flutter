import 'dart:async';
import 'dart:io';

import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/model/login_model.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart';
import 'package:gais/data/model/reference/get_currency_model.dart';
import 'package:gais/data/model/reference/get_department_model.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart';
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
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart';
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
  Future<LoginModel> postLogin(String username, String password);

  Future<RequestTripListModel> getRequestTripList(
    int perPage,
    int page,
    String? search,
    String? startDate,
    String? endDate,
  );

  Future<GetRequestTripByidModel> getRequestTripByid(String id);

  Future<EmployeeInfoModel> getEmployeeInfo();

  Future<GetDocumentCodeModel> getDocumentCodeList();

  Future<GetCityModel> getCityList();

  Future<GetZonaByidModel> getZonaByIDCity(String id);

  Future<GetSiteModel> getSiteList();

  Future<GetSiteModel> getSiteListByCompanyID(String id);

  Future<GetHotelModel> getHotelList();

  Future<GetCurrencyModel> getCurrencyList();

  Future<GetTlkJobModel> getTLKJobByIDJob(String job);

  Future<SavePurposeOfTripModel> saveRequestTrip(
    String employeeID,
    String noRequestTrip,
    String codeDocument,
    String siteID,
    String notes,
    String fromCity,
    String toCity,
    String departureDate,
    String arrivalDate,
    String zonaID,
    int tlkDay,
    String tlkTotal,
    File? file,
  );

  Future<UpdatePurposeOfTripModel> updateRequestTrip(
    String id,
    String employeeID,
    String noRequestTrip,
    String codeDocument,
    String siteID,
    String notes,
    String fromCity,
    String toCity,
    String departureDate,
    String arrivalDate,
    String zonaID,
    String tlkDay,
    String tlkTotal,
    File? file,
  );

  Future<GetTravellerTypeModel> getTravellerTypeList();

  Future<GetEmployeeModel> getEmployeeList();

  Future<GetEmployeeModel> getEmployeeListBySiteID(String id);

  Future<GetDepartmentModel> getDepartmentList();

  Future<GetCompanyModel> getCompanyList();

  Future<GetJobBandModel> getJobBandList();

  Future<GetFlightClassModel> getFlightList();

  Future<GetStatusDocumentModel> getStatusDocument();

  Future<SaveTravellerGuestModel> saveTravellerGuest(
    String nameGuest,
    String idrequesttrip,
    String idcompany,
    String company,
    String idtypetraveller,
    String nik,
    String contact,
    String departement,
    String hotelfare,
    String idflightclass,
    String notes,
    String gender,
  );

  Future<UpdateTravellerGuestModel> updateTravellerGuest(
    String id,
    String nameGuest,
    String idrequesttrip,
    int idcompany,
    String company,
    String idtypetraveller,
    String nik,
    String contact,
    String departement,
    String hotelfare,
    int idflightclass,
    String notes,
    String gender,
  );

  Future deletePurposeOfTrip(dynamic id);

  Future<GetGuestBytripModel> getGuestBytripList(String id);

  Future<GetGuestByidModel> getGuestByID(String id);

  Future deleteTravellerGuest(String id);

  Future<SaveTaxiVoucherModel> saveTaxiVoucher(
    String tripID,
    String amount,
    String accountName,
    String departureID,
    String arrivalID,
    String remarks,
    String date,
    String voucher,
  );

  Future<UpdateTaxiVoucherModel> updateTaxiVoucher(
    int id,
    String tripID,
    String amount,
    String accountName,
    String departureID,
    String arrivalID,
    String remarks,
    String date,
    String voucher,
  );

  Future<GetTaxiVoucherModel> getTaxiVoucherBytripList(String id);

  Future<GetTaxiVoucherModel> getTaxiVoucherByid(String id);

  Future deleteTaxiVoucher(String id);

  Future<StatusDocumentModel> getStatusDoc();

  Future<SaveAirlinesModel> saveAirlines(
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
  );

  Future<UpdateAirlinessModel> updateAirlines(
    String id,
    String idRequestTrip,
    String idVendor,
    String flightNo,
    String codeAirlines,
    String ticketPrice,
  );

  Future deleteAirliness(String id);

  Future<GetAirlinessVendorModel> getAirlinessVendorList();

  Future<GetAirlinessModel> getAirlinessBytripList();

  Future<GetAirlinessModel> getAirlinessByid(String id);

  Future<GetFlightScheduleModel> getFlightScheduleList();

  Future<SaveOtherTransportationModel> saveOtherTransportation(
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  );

  Future<UpdateOtherTransportModel> updateOtherTransportation(
    String id,
    String idRequestTrip,
    String typeTransportation,
    String fromDate,
    String toDate,
    String idCity,
    String qty,
    String remarks,
  );

  Future<GetOtherTransportModel> getOtherTransportBytripList(String id);

  Future<GetOtherTransportModel> getOtherTransportByid(String id);

  Future<GetTypeTransportationModel> getTypeTransportation();

  Future deleteOtherTransportation(String id);

  Future<SaveAccommodationModel> saveAccommodation(
    String idRequestTrip,
    String idTypeAccommodation,
    String checkInDate,
    String checkoutDate,
    String idVendor,
    String useGL,
    String idCity,
    String sharingWithName,
    String remarks,
    String price,
    String codeHotel,
  );

  Future<UpdateAccommodationModel> updateAccommodation(
    int id,
    String idRequestTrip,
    String idTypeAccommodation,
    String checkInDate,
    String checkoutDate,
    String idVendor,
    String useGL,
    String idCity,
    String sharingWithName,
    String remarks,
    String price,
    String codeHotel,
  );

  Future<GetAccommodationModel> getAccommodationBytripList(String id);

  Future<GetAccommodationModel> getAccommodationByid(String id);

  Future deleteAccommodation(String id);

  Future<GetHotelTypeModel> getHotelTypeList();

  Future<GetCashAdvanceTravelModel> getCashAdvanceTravelList(String id);

  Future<GetCashAdvanceByidModel> getCashAdvanceTravelByid(String id);

  Future<GetDetailcaBycashidModel> getDetailCashAdvanceTravelByid(String id);

  Future<UpdateCashAdvanceTravelModel> updateCashAdvanceTravel(
    int id,
    String idEmployee,
    String idRequestTrip,
    String idCurrency,
    String remarks,
    String grandTotal,
    String typeCa,
  );

  Future deleteCashAdvanceTravel(String id);

  Future<SubmitRequestTripModel> submitRequestTrip(String id);

  Future<void> registerFCM(String token);
}
