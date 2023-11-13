import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_constants.dart';
import '../../../controller/reservation/bloc/reservation_bloc.dart';
class CityDropDown extends StatelessWidget {
  final List<String>? cities;
  CityDropDown({this.cities});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(15))),
        height: 50,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                const BorderRadius.all(
                    Radius.circular(15)),
                border: Border.all(
                  color: AppConstants.littleBlue,
                )),
            child: DropdownSearch<String>(
              items: cities!,
              dropdownButtonProps:
              const DropdownButtonProps(
                  isVisible: false),
              dropdownDecoratorProps:
              const DropDownDecoratorProps(
                dropdownSearchDecoration:
                InputDecoration(
                    border: InputBorder.none,
                    hintText: "Select city",

                    contentPadding:
                    EdgeInsets
                        .symmetric(
                        horizontal:
                        20,
                        vertical: 5),
                    labelStyle: TextStyle(
                        color: AppConstants
                            .darkBlue,
                        fontSize: 20,
                        fontWeight: FontWeight
                            .w500),
                    hintStyle: TextStyle(
                        color: AppConstants
                            .darkBlue,
                        fontSize: 16,
                        fontWeight:
                        FontWeight.w500)),
              ),
              onChanged: (val) {
                BlocProvider.of<ReservationBloc>(
                    context)
                    .add(SetCity(city: val));
              },
            ),
          ),
        ),
      ),
    );
  }
}
