import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_constants.dart';
import '../../../controller/reservation/bloc/reservation_bloc.dart';
class BottomSheetModal {

  static showModalSheet (context){
    final _controller = ValueNotifier<bool>(false);

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
                bottomSheet: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: InkWell(
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
                          borderRadius: BorderRadius.all(Radius.circular(8))
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      child: Center(
                        child: Text('Apply',style: TextStyle(
                            fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700
                        ),),
                      ),
                    ),
                  ),
                ) ,
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
                        fontWeight: FontWeight.w700),
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
                                          if(roomNumber != 1){
                                            setModalState(() {
                                              roomNumber--;
                                            });
                                          }

                                        },
                                        child:
                                        Container(
                                          decoration: BoxDecoration(border: Border.all(color:(roomNumber != 1)? AppConstants.darkBlue:Colors.grey ), borderRadius: BorderRadius.all(Radius.circular(50))),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Icon(
                                              Icons.remove,
                                              color: (roomNumber != 1)? AppConstants.darkBlue:Colors.grey,
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
                                            color:(roomNumber ==1)?Colors.grey: Colors.black,
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
                                                if(adultNumber != 1){
                                                  adultNumber--;
                                                  setModalState(() {});
                                                }

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(border: Border.all(color:(adultNumber ==1)?Colors.grey: AppConstants.darkBlue), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color:(adultNumber ==1)?Colors.grey: AppConstants.darkBlue,
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
                                                if(adultNumber !=4){
                                                  adultNumber++;
                                                  setModalState(() {});
                                                }

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(border: Border.all(color: (adultNumber!=4)? AppConstants.darkBlue:Colors.grey), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(Icons.add, color:(adultNumber!=4)? AppConstants.darkBlue:Colors.grey),
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
                                                if(childrenNumber!= 0)
                                                {
                                                  childrenNumber--;
                                                  setModalState(() {});
                                                }

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(border: Border.all(color: (childrenNumber!= 0)?AppConstants.darkBlue:Colors.grey), borderRadius: BorderRadius.all(Radius.circular(50))),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8.0),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color:(childrenNumber!= 0)?AppConstants.darkBlue:Colors.grey,
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
                                                  'Age of child ${i+1}',
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Pet-friendly',
                                            style: TextStyle(
                                                fontSize:
                                                14,
                                                color:
                                                Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(width: 5,),
                                          Icon(Icons.info_outline)
                                        ],
                                      ),
                                      Text(
                                        'Only show stays that allow pets',
                                        style: TextStyle(
                                            fontSize:
                                            14,
                                            color:
                                            Colors.black,
                                            fontWeight: FontWeight.w300),
                                      ),

                                    ],
                                  ),
                                  AdvancedSwitch(
                                    controller: _controller,
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey,
                                    // activeChild: Text('ON'),
                                    // inactiveChild: Text('OFF'),

                                    borderRadius: BorderRadius.all(const Radius.circular(15)),
                                    width: 50.0,
                                    height: 30.0,
                                    enabled: true,
                                    disabledOpacity: 0.5,
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        });
  }
}

