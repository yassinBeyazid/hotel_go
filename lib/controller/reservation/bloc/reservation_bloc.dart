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
    on<IncrementRooms>((event, emit) {
      int? count = state.rooms;
      count = (count! +1);
      emit(state.copyWith(rooms: count));
    });
    on<DecrementRooms>((event, emit) {
      int? count = state.rooms;
      if(count !=1) {
        count = (count! - 1);
        emit(state.copyWith(rooms: count));
      }
    });
    on<IncrementAdults>((event, emit) {
      int? count = state.adults;
      count = (count! +1);
      emit(state.copyWith(rooms: count));
    });
    on<DecrementAdults>((event, emit) {
      int? count = state.adults;
      if(count !=1){
        count = (count! -1);
        emit(state.copyWith(rooms: count));
      }

    });
    on<IncrementChildren>((event, emit) {
      int? count = state.children;

        count = (count! + 1);
        emit(state.copyWith(rooms: count));

    });
    on<DecrementChildren>((event, emit) {
      int? count = state.children;
      if(count !=1) {
        count = (count! - 1);
        emit(state.copyWith(rooms: count));
      }
    });
  }
}
