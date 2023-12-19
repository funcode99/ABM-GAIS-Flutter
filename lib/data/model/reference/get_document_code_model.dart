/// success : true
/// message : "Success Get Data"
/// data : [{"id":1,"code_document":"SV","document_name":"Site Visit","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":2,"code_document":"FB","document_name":"Field Break","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":3,"code_document":"CB","document_name":"Company Business","created_at":null,"created_by":null,"updated_at":null,"updated_by":null},{"id":4,"code_document":"TV","document_name":"Taxi Voucher","created_at":null,"created_by":null,"updated_at":null,"updated_by":null}]

class GetDocumentCodeModel {
  GetDocumentCodeModel({
    bool? success,
    String? message,
    List<Data>? data,
  }) {
    _success = success;
    _message = message;
    _data = data;
  }

  GetDocumentCodeModel.fromJson(dynamic json) {
    _success = json['success'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }

  bool? _success;
  String? _message;
  List<Data>? _data;

  GetDocumentCodeModel copyWith({
    bool? success,
    String? message,
    List<Data>? data,
  }) =>
      GetDocumentCodeModel(
        success: success ?? _success,
        message: message ?? _message,
        data: data ?? _data,
      );

  bool? get success => _success;

  String? get message => _message;

  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// code_document : "SV"
/// document_name : "Site Visit"
/// created_at : null
/// created_by : null
/// updated_at : null
/// updated_by : null

class Data {
  Data({
    num? id,
    String? codeDocument,
    String? documentName,
    bool? isSelected = false,
    bool? isShow = true,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
  }) {
    _id = id;
    _codeDocument = codeDocument;
    _documentName = documentName;
    _isSelected = isSelected;
    _isShow = isShow;
    _createdAt = createdAt;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
    _updatedBy = updatedBy;
  }

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _codeDocument = json['code_document'];
    _documentName = json['document_name'];
    _createdAt = json['created_at'];
    _createdBy = json['created_by'];
    _updatedAt = json['updated_at'];
    _updatedBy = json['updated_by'];
  }

  dynamic _id;
  String? _codeDocument;
  String? _documentName;
  bool? _isSelected = false;
  bool? _isShow = true;

  bool get isSelected => _isSelected ?? false;
  bool get isShow => _isShow ?? true;

  set isSelected(bool value) {
    _isSelected = value;
  }
  set isShow(bool value) {
    _isShow = value;
  }

  dynamic _createdAt;
  dynamic _createdBy;
  dynamic _updatedAt;
  dynamic _updatedBy;

  Data copyWith({
    num? id,
    String? codeDocument,
    String? documentName,
    bool? isSelected,
    bool? isShow,
    dynamic createdAt,
    dynamic createdBy,
    dynamic updatedAt,
    dynamic updatedBy,
  }) =>
      Data(
        id: id ?? _id,
        codeDocument: codeDocument ?? _codeDocument,
        documentName: documentName ?? _documentName,
        isSelected: isSelected ?? _isSelected,
        isShow: isShow ?? _isShow,
        createdAt: createdAt ?? _createdAt,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
        updatedBy: updatedBy ?? _updatedBy,
      );

  dynamic get id => _id;

  String? get codeDocument => _codeDocument;

  String? get documentName => _documentName;

  dynamic get createdAt => _createdAt;

  dynamic get createdBy => _createdBy;

  dynamic get updatedAt => _updatedAt;

  dynamic get updatedBy => _updatedBy;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['code_document'] = _codeDocument;
    map['document_name'] = _documentName;
    map['created_at'] = _createdAt;
    map['created_by'] = _createdBy;
    map['updated_at'] = _updatedAt;
    map['updated_by'] = _updatedBy;
    return map;
  }
}
