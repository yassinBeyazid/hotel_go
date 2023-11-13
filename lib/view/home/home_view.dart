import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_go_app/app_constants.dart';
import 'package:hotel_go_app/controller/reservation/bloc/reservation_bloc.dart';
import 'package:hotel_go_app/view/home/components/bottom_sheet.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'components/city_dropdown.dart';
import 'components/date_picker.dart';
import 'components/nationality_dropdown.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_image.webp"),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: AppConstants.darkBlue,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Center(
                        child: Text(
                          'Hotels Search',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: Colors.orange),
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height:
                                (MediaQuery.of(context).size.height / 2) - 40,
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      AppConstants.darkBlue,
                                      AppConstants.lightBlue,
                                    ],
                                    begin: FractionalOffset(0.0, 0.0),
                                    end: FractionalOffset(1.0, 0.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CityDropDown(cities: state.cities),
                                  DatePickerFromTo(dateFrom: state.dateFrom,dateTo: state.dateTo),
                                  NationalityDropDown(nationalities: state.nationalities),
                                  InkWell(
                                    onTap: () {
                                      BottomSheetModal.showModalSheet(context);
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
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    '${state.rooms} Room, ${state.adults} Adults, ${state.children} Children',
                                                    style: TextStyle(
                                                        color: AppConstants
                                                            .darkBlue,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Icon(Icons
                                                      .arrow_drop_down_outlined)
                                                ],
                                              ),
                                            )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'find hotels ',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class CustomClips extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0.0, size.height);
//     // path.lineTo(size.width, 0.0);
//     path.lineTo(size.width, size.height);
//     path.lineTo(size.width - 20, size.height);
//     return path;
//   }
//
//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
