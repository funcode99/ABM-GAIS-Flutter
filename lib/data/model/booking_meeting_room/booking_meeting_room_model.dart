class BookingMeetingRoomModel{
  final String? title;
  final String? startDate;
  final String? endDate;
  final String? startTime;
  final String? endTime;
  final String? idRoom;
  final List<String>? participants;
  final String? link;
  final String? remarks;
  final String? noBookingRoom;
  final String? status;
  final String? roomName;
  final int? floor;
  final int? capacity;
  final String? employeeName;
  final String? createdAt;
  final String? codeStatusDoc;


  BookingMeetingRoomModel(

      {this.title,
        this.startDate,
        this.endDate,
        this.startTime,
        this.endTime,
        this.idRoom,
        this.participants,
        this.link,
        this.remarks,
        this.noBookingRoom,
        this.status,
        this.roomName,
        this.floor,
        this.capacity,
        this.employeeName,
        this.createdAt,
        this.codeStatusDoc,
      });
}