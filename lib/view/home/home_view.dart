import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_go_app/app_constants.dart';
import 'package:hotel_go_app/controller/reservation/bloc/reservation_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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
                                  GestureDetector(
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
                                            items: state.cities!,
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
                                  ),
                                  GestureDetector(
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
                                            (state.dateFrom == null &&
                                                    state.dateTo == null)
                                                ? 'Select date'
                                                : '${(state.dateFrom != null) ? state.dateFrom : 'Select start date'} ==> ${(state.dateTo != null) ? state.dateTo : 'Select end date'}',
                                            style: const TextStyle(
                                                color: AppConstants.darkBlue,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          )),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
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
                                          items: state.nationalities!,
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
                                  ),
                                  InkWell(
                                    onTap: () {
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) {
                                            int roomNumber = 1;
                                            int adultNumber = 1;
                                            int childrenNumber = 1;
                                            return StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter
                                                    setModalState) {
                                              return FractionallySizedBox(
                                                heightFactor: 0.9,
                                                child: Scaffold(
                                                  backgroundColor: Colors.white10,
                                                  appBar: AppBar(
                                                    centerTitle: true,
                                                    backgroundColor: Colors.white,
                                                    title:  Text(
                                                      'Rooms and Guests',
                                                      style: TextStyle(
                                                          fontSize:
                                                          18,
                                                          color:
                                                          Colors.black,
                                                          fontWeight: FontWeight.w400),
                                                    ),
                                                  ),
                                                  body: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20,
                                                        vertical: 10),
                                                    child:
                                                    SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 20,
                                                          ),
                                                          Material(
                                                            elevation: 5,
                                                            borderRadius:
                                                            BorderRadius
                                                                .all(Radius
                                                                .circular(
                                                                8)),
                                                            child: Container(
                                                              width: MediaQuery.of(
                                                                  context)
                                                                  .size
                                                                  .width,
                                                              height: 60,
                                                              decoration:
                                                              BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        8)),
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                    20),
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'Rooms',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                          18,
                                                                          color:
                                                                          Colors.black,
                                                                          fontWeight: FontWeight.w400),
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () {
                                                                            setModalState(() {
                                                                              roomNumber--;
                                                                            });
                                                                            // BlocProvider.of<ReservationBloc>(context).add(DecrementRooms());
                                                                            // setModalState(() {
                                                                            //
                                                                            // });
                                                                          },
                                                                          child:
                                                                          Container(
                                                                            decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Icon(
                                                                                Icons.remove,
                                                                                color: AppConstants.darkBlue,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                          10,
                                                                        ),
                                                                        Text(
                                                                          roomNumber.toString(),
                                                                          style: TextStyle(
                                                                              fontSize: 18,
                                                                              color: Colors.black,
                                                                              fontWeight: FontWeight.w400),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                          10,
                                                                        ),
                                                                        InkWell(
                                                                          onTap:
                                                                              () {

                                                                            setModalState(() {
                                                                              roomNumber++;
                                                                            });

                                                                          },
                                                                          child:
                                                                          Container(
                                                                            decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.all(8.0),
                                                                              child: Icon(Icons.add, color: AppConstants.darkBlue),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                vertical:
                                                                10),
                                                            child: Material(
                                                              elevation: 5,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                  .circular(
                                                                  8)),
                                                              child:
                                                              Container(
                                                                width: MediaQuery.of(
                                                                    context)
                                                                    .size
                                                                    .width,
                                                                decoration:
                                                                BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                  borderRadius:
                                                                  BorderRadius.all(
                                                                      Radius.circular(8)),
                                                                ),
                                                                child:
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                      20,
                                                                      vertical:
                                                                      10),
                                                                  child:
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                    children: [
                                                                      Text(
                                                                        'Room 1',
                                                                        style: TextStyle(
                                                                            fontSize: 18,
                                                                            color: Colors.black,
                                                                            fontWeight: FontWeight.w400),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                        10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Adults',
                                                                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  adultNumber--;
                                                                                  setModalState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Icon(
                                                                                      Icons.remove,
                                                                                      color: AppConstants.darkBlue,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                adultNumber.toString(),
                                                                                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  adultNumber++;
                                                                                  setModalState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Icon(Icons.add, color: AppConstants.darkBlue),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                        10,
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            'Children',
                                                                            style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                                                          ),
                                                                          Row(
                                                                            children: [
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  childrenNumber--;
                                                                                  setModalState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Icon(
                                                                                      Icons.remove,
                                                                                      color: AppConstants.darkBlue,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Text(
                                                                                childrenNumber.toString(),
                                                                                style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              InkWell(
                                                                                onTap: () {
                                                                                  childrenNumber++;
                                                                                  setModalState(() {});
                                                                                },
                                                                                child: Container(
                                                                                  decoration: BoxDecoration(border: Border.all(color: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                                                  child: Padding(
                                                                                    padding: const EdgeInsets.all(8.0),
                                                                                    child: Icon(Icons.add, color: AppConstants.darkBlue),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          )
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                        10,
                                                                      ),
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          for (int i = 0; i < childrenNumber; i++)
                                                                            Padding(
                                                                              padding:
                                                                              const EdgeInsets.only(left: 20),
                                                                              child:
                                                                              Row(
                                                                                mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Age of child $i',
                                                                                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400),
                                                                                  ),
                                                                                  Text(
                                                                                    '14 years',
                                                                                    style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w400),
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                        10,
                                                                      ),


                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            onTap: (){
                                                              BlocProvider.of<ReservationBloc>(
                                                                  context)
                                                                  .add(ApplyRoomAdultsChildren(
                                                                children: childrenNumber,
                                                                adults: adultNumber,rooms: roomNumber
                                                              ));
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  color: AppConstants.darkBlue,
                                                                  borderRadius: BorderRadius.all(Radius.circular(15))
                                                              ),
                                                              width: MediaQuery.of(context).size.width,
                                                              height: 50,
                                                              child: Center(
                                                                child: Text('Apply',style: TextStyle(
                                                                    fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700
                                                                ),),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                          });
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
