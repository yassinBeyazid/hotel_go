part of 'reservation_bloc.dart';

@immutable
abstract class ReservationEvent {}

class SetCity extends ReservationEvent {
  final String? city;
  SetCity({this.city});
}

class SetDateFrom extends ReservationEvent {
  final String? dateFrom;
  SetDateFrom({this.dateFrom});
}

class SetDateTo extends ReservationEvent {
  final String? dateTo;
  SetDateTo({this.dateTo});
}

class SetNationality extends ReservationEvent {
  final String? nationality;
  SetNationality({this.nationality});
}

class ApplyRoomAdultsChildren extends ReservationEvent{
  final int? rooms;
  final int? adults;
  final int? children;
  ApplyRoomAdultsChildren({this.children,this.adults,this.rooms});
}
