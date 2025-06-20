import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:thi/feature/Reservations/Booking/logic/cubit/booking_cubit.dart';
import 'package:thi/feature/Reservations/Booking/seleectBooking.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

class Specislists extends StatelessWidget {
  Specislists({
    super.key,
    required this.IdClub,
    required this.IdService,
  });
  final int IdClub;
  final int IdService;

  @override
  Widget build(BuildContext context) {
    double Height = MediaQuery.of(context).size.height;
    double Width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => BookingCubit()..getDataTrinner(IdService),
      child: BlocConsumer<BookingCubit, BookingState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BookingCubit.getObject(context);
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        imageBackground,
                      ),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  AppBar(
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Color0,
                      ),
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: text(
                      title: 'Book Appointment',
                      color: Color0,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                    toolbarHeight: 30,
                  ),
                  SizedBox(
                    height: Height * 0.02,
                  ),
                  Center(
                    child: Container(
                      width: Width * 0.7,
                      height: Height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Select-amico.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 10),
                    child: text(
                      title: 'Select specialist',
                      color: Color0,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  cubit.getTrinnerClubModel == null
                      ? Center(
                          child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: SpinkitWave(),
                        ))
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.44,
                          child: ListView.separated(
                            itemCount:
                                cubit.getTrinnerClubModel!.trainers!.length,
                            separatorBuilder: (context, index) {
                              return Divider();
                            },
                            itemBuilder: (context, i) {
                              bool isChecked = (cubit.selectedItemId == i);

                              return ListTile(
                                leading: Container(
                                  width: 50,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color0.withOpacity(0.5),
                                        spreadRadius: 2.0,
                                        blurRadius: 10.0,
                                        offset: Offset(-1, 6),
                                      ),
                                    ],
                                    image: DecorationImage(
                                        scale: 1,
                                        image: NetworkImage(
                                          ImagesPath +
                                              cubit.getTrinnerClubModel!
                                                  .trainers![i].image
                                                  .toString(),
                                        ),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                title: text(
                                  title: cubit
                                      .getTrinnerClubModel!.trainers![i].fName!,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w600,
                                  color: Color0,
                                ),
                                subtitle: text(
                                  title: cubit.getTrinnerClubModel!.trainers![i]
                                      .qualifications!,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(3, 2, 3, 1),
                                ),
                                trailing: Checkbox(
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    cubit.ChickBoxTrinner(
                                        value,
                                        i,
                                        cubit.getTrinnerClubModel!.trainers![i]
                                            .pivot!.trainerId!);
                                  },
                                ),
                                onTap: () {
                                  print('تم النقر على السطر');
                                },
                              );
                            },
                          ),
                        ),
                  SizedBox(
                    height: Height * 0.01,
                  ),
                  ButtonStaic(
                      onTap: () {
                        // يتم تنفيذ هذا الكود عند النقر على الزر

                        if (cubit.isclick1 ?? false) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SeleectBooking(
                                Idclub: IdClub,
                                IdServic: IdService,
                                Idtrinner: cubit.idTrinner!,
                              ),
                            ),
                          );
                        } else {
                          Fluttertoast.showToast(
                              msg: "Select to move on to the next step",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.redAccent,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        print('تم النقر على الزر!');
                      },
                      title: "Next",
                      context: context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
