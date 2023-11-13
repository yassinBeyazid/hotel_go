import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../app_constants.dart';
import '../../../controller/reservation/bloc/reservation_bloc.dart';
class DatePickerFromTo extends StatelessWidget {
  final String? dateFrom;
  final String? dateTo;
  DatePickerFromTo({this.dateTo,this.dateFrom});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title:
              const Text('Select Date'),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:
                    const Text('Apply'))
              ],
              content: SfDateRangePicker(
                onSelectionChanged:
                    (DateRangePickerSelectionChangedArgs
                val) {
                  if (val.value.startDate !=
                      null) {
                    BlocProvider.of<
                        ReservationBloc>(
                        context)
                        .add(SetDateFrom(
                        dateFrom: val
                            .value
                            .startDate
                            .toString()
                            .substring(
                            0, 10)));
                  }
                  if (val.value.endDate !=
                      null) {
                    BlocProvider.of<
                        ReservationBloc>(
                        context)
                        .add(SetDateTo(
                        dateTo: val
                            .value.endDate
                            .toString()
                            .substring(
                            0, 10)));
                  }
                },
                selectionMode:
                DateRangePickerSelectionMode
                    .range,
              ),
            ));
      },
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
                    Radius.circular(10)),
                border: Border.all(
                  color: AppConstants.darkBlue,
                )),
            child: Center(
                child: Text(
                  (dateFrom == null &&
                      dateTo == null)
                      ? 'Select date'
                      : '${(dateFrom != null) ? dateFrom : 'Select start date'} ==> ${(dateTo != null) ?dateTo : 'Select end date'}',
                  style: const TextStyle(
                      color: AppConstants.darkBlue,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                )),
          ),
        ),
      ),
    );
  }
}
