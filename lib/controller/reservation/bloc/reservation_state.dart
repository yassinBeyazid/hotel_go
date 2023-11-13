part of 'reservation_bloc.dart';

@immutable
class ReservationState extends Equatable{
  final String? city;
  final String? dateFrom;
  final String? dateTo;
  final String? nationality;
  final int? rooms;
  final int? adults;
  final int? children;
  final List<String>? cities;
  final List<String>? nationalities;
  const ReservationState(
      {this.city,
      this.adults = 1,
      this.children = 0,
      this.dateFrom,
      this.dateTo,
      this.nationality,
      this.rooms = 1,
      this.cities = const [
        'Cairo',
        'Brazil',
        'Italy',
        'Argentina',
        'America',
        'UAE'
      ],
      this.nationalities = const [
        'Pakistani',
        'Romanian',
        'Slovenian',
        'Syrian',
        'Ukrainian',
        'Yemeni',
        'Egyptian'
      ]});
  ReservationState copyWith(
      {String? city,
      String? dateFrom,
      String? dateTo,
      String? nationality,
      int? rooms,
      int? adults,
      int? children,
      List<String>? nationalities,
      List<String>? cities}) {
    return ReservationState(
        city: city ?? this.city,
        dateFrom: dateFrom ?? this.dateFrom,
        dateTo: dateTo ?? this.dateTo,
        nationality: nationality ?? this.nationality,
        rooms: rooms ?? this.rooms,
        adults: adults ?? this.adults,
        children: children ?? this.children,
        cities: cities ?? this.cities,
        nationalities: nationalities ?? this.nationalities);
  }

  @override
  // TODO: implement props
  List get props => [
        city,
        dateFrom,
        dateTo,
        nationality,
        rooms,
        adults,
        children,
        cities,
        nationalities
      ];
}

class ReservationInitial extends ReservationState {}
