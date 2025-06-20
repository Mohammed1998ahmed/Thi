import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../../../Reservations/Details_Club/data/TrinerIdByClub.dart';

Padding review_trinner_all(BuildContext context,
    {required MyClubTrenerIDModel cubit, required int indexProfile}) {
  return Padding(
    padding: EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
          Row(
            children: [
              text(
                  title: "Opening Hours",
                  color: Colors.black,
                  textAlign: TextAlign.start,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.019,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 5,
                backgroundColor: Color0,
              ),
              SizedBox(
                width: 4,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.04,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.trainers![indexProfile].days!.length,
                    itemBuilder: (context, indexdays) {
                      return text(
                          title: cubit.trainers![indexProfile].days![indexdays]
                                  .toString() +
                              "-",
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400);
                    }),
              ),
              Spacer(),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.02,
              // ),
              text(
                  title: cubit.trainers![indexProfile].start.toString() +
                      "-" +
                      cubit.trainers![indexProfile].end.toString(),
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.008,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                text(
                    title: "Photos",
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
                Spacer(),
                text(
                    title: "View all",
                    color: Color.fromRGBO(90, 0, 114, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: cubit.trainers![indexProfile].images!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Container(
                            width: MediaQuery.of(context)
                                .size
                                .width, // تعديل حسب حجم الجهاز
                            height: MediaQuery.of(context).size.height *
                                0.8, // تعديل حسب حجم الجهاز
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  ImagesPath +
                                      cubit.trainers![indexProfile]
                                          .images![index]
                                          .toString(),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.050,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          ImagesPath +
                              cubit.trainers![indexProfile].images![index]
                                  .toString(),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    ),
  );
}
