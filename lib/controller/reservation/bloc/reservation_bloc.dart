import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitial()) {
    on<SetCity>((event, emit) {
      emit(state.copyWith(city: event.city));
    });
    on<SetDateFrom>((event, emit) {
      emit(state.copyWith(dateFrom: event.dateFrom));
    });
    on<SetDateTo>((event, emit) {
      emit(state.copyWith(dateTo: event.dateTo));
    });
    on<SetNationality>((event, emit) {
      emit(state.copyWith(nationality: event.nationality));
    });
    on<ApplyRoomAdultsChildren>((event, emit) {
      emit(state.copyWith(rooms: event.rooms,adults: event.adults,children: event.children));
    });

  }
}
