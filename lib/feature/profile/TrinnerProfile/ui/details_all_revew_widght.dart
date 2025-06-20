import 'package:flutter/material.dart';
import 'package:smooth_star_rating_null_safety/smooth_star_rating_null_safety.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/sharePreferinces/shardprefericences.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/trinner_cubit.dart';

Container details_all_revew_widght(
    double width, double height, TrinnerCubit cubit,
    {required int trainer_id}) {
  return Container(
    width: width,
    height: height * 0.50,
    child: ListView.separated(
      // shrinkWrap: false,
      itemCount: cubit.getAllReviewUserByTrinner!.reviews == null
          ? 0
          : cubit.getAllReviewUserByTrinner!.reviews!.length,
      separatorBuilder: (BuildContext, int) => Divider(
        color: Color.fromRGBO(138, 134, 139, 0.8),
      ),
      itemBuilder: (context, index) {
        // ignore: unused_local_variable
        final conversation = conversations[index];
        return Column(
          children: [
            ListTile(
              leading: Container(
                // color: Color0,
                width: width * 0.23,
                height: height * .2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                        image: NetworkImage(ImagesPath +
                            cubit.getAllReviewUserByTrinner!.reviews![index]
                                .user!.profiles!.profile
                                .toString()),
                        fit: BoxFit.fill)),
              ),
              title: Row(
                children: [
                  Container(
                    width: width * 0.3,
                    child: text(
                      title: cubit.getAllReviewUserByTrinner!.reviews![index]
                              .user!.profiles!.fName
                              .toString() +
                          " " +
                          cubit.getAllReviewUserByTrinner!.reviews![index].user!
                              .profiles!.lName
                              .toString(),
                      color: Color.fromRGBO(0, 0, 0, 0.87),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  Container(
                    // width: width * 0.3,
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Color0,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Container(
                      width: width * 0.2,
                      // height: 50,
                      child: text(
                        title:
                            '${cubit.getAllReviewUserByTrinner!.reviews![index].reviewTime.toString()}',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,

                        maxLines: 1, // عرض الوقت المحدد لكل رسالة
                        textAlign: TextAlign.center,

                        color: Color3,
                      ),
                    ),
                  ),
                ],
              ),
              subtitle: Row(
                children: [
                  SmoothStarRating(
                    borderColor: Color.fromRGBO(112, 112, 112, 1),
                    color: Color.fromRGBO(228, 179, 67, 1),
                    rating: double.parse(cubit
                        .getAllReviewUserByTrinner!.reviews![index].rating
                        .toString()),
                    // isReadOnly: false,
                    size: 20,
                    filledIconData: Icons.star,
                    halfFilledIconData: Icons.star_half,
                    defaultIconData: Icons.star_border,
                    starCount: 5,
                    allowHalfRating: true,
                    spacing: 2.0,
                    onRatingChanged: (v) {
                      rating = v;
                      // setState(() {
                      //   rating = v;
                      // });
                    },
                  ),
                  Spacer(),
                  CachShpreafapp.getdata(key: "UserID") ==
                          cubit
                              .getAllReviewUserByTrinner!.reviews![index].userId
                      ? IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Item'),
                                  content: Text(
                                      'Are you sure you want to delete the item?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        cubit.deleteRevewTrinner(
                                            trainer_id: trainer_id,
                                            idUser: CachShpreafapp.getdata(
                                                key: "UserID"),
                                            rating_id: cubit
                                                .getAllReviewUserByTrinner!
                                                .reviews![index]
                                                .id!);
                                        Navigator.of(context).pop();
                                        cubit.userHasReviewInTrainerTrinner(
                                            trainer_id: trainer_id,
                                            idUser: CachShpreafapp.getdata(
                                                key: "UserID"));
                                        // cubit.deleteRating ==
                                        //         null
                                        //     ? status =
                                        //         false
                                        //     : status = cubit
                                        //         .deleteRating!
                                        //         .status!;

                                        // if (status ==
                                        //     true) {
                                        //   Navigator.of(
                                        //           context)
                                        //       .pop();
                                        // }
                                        // ;

                                        // Perform delete action here
                                      },
                                      child: Text('Delete'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Cancel'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            text(
                title: cubit.getAllReviewUserByTrinner!.reviews![index].review
                    .toString(),
                color: Color.fromRGBO(0, 0, 0, 0.5),
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ],
        );
      },
    ),
  );
}
