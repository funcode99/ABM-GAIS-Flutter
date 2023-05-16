class BookingMeetingRoomModel{
  final String title;
  final String date;
  final String detailTime;
  final String meetingRoom;
  final String floor;
  final String capacity;
  final String participants;
  final String link;
  final String remarks;
  final String noBookingRoom;
  final String status;

  BookingMeetingRoomModel(

      {required this.title,
        required this.date,
        required this.detailTime,
        required this.meetingRoom,
        required this.floor,
        required this.capacity,
        required this.participants,
        required this.link,
        required this.remarks,
        required this.noBookingRoom,
        required this.status,
      });
}