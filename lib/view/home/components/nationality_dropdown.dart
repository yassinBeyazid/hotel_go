import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_constants.dart';
import '../../../controller/reservation/bloc/reservation_bloc.dart';
class NationalityDropDown extends StatelessWidget {
  final List<String>? nationalities;
  NationalityDropDown({this.nationalities});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(15))),
      height: 50,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
                Radius.circular(10)),
          ),
          child: DropdownSearch<String>(
            items: nationalities!,
            dropdownDecoratorProps:
            const DropDownDecoratorProps(
              dropdownSearchDecoration:
              InputDecoration(
                  border: InputBorder.none,
                  // labelText: "Select Nationality",
                  hintText:
                  "Select Nationality",
                  contentPadding:
                  EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5),
                  labelStyle: TextStyle(
                      color: AppConstants
                          .darkBlue,
                      fontSize: 20,
                      fontWeight:
                      FontWeight.w500),
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
                  .add(SetNationality(
                  nationality: val));
            },
            // selectedItem: "Brazil",
          ),
        ),
      ),
    );
  }
}
