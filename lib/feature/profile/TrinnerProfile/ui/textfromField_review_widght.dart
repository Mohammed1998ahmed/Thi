import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/sharePreferinces/shardprefericences.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/trinner_cubit.dart';

Padding textfromField_review_widght(
    double width, double height, TrinnerCubit cubit, TrinnerState state,
    {required int trainer_id}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                width: width * 0.3,
                height: height * 0.19,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
                // radius: 28,
                clipBehavior: Clip.antiAlias,
                // backgroundColor: Colors.transparent,
                child: Image.network(
                  ImagesPath + CachShpreafapp.getdata(key: "ImageProfile"),
                  fit: BoxFit.fill,
                  // width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                ),
              ),
              Container(
                width: width * 0.3,
                height: height * 0.05,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.0),
                        bottomRight: Radius.circular(15.0)),
                    color: Colors.black.withOpacity(0.3)),
                child: text(
                    title: CachShpreafapp.getdata(key: "FName") +
                        " " +
                        CachShpreafapp.getdata(key: "LName"),
                    textAlign: TextAlign.center,
                    color: Color3,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: width * 0.55,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Container(
                    width: width * 0.50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: cubit.controllerSend,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          hintText: ' Write a message…',
                          hintStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(142, 142, 147, 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            cubit.userHasReviewInTrainer == null
                ? Container()
                : cubit.userHasReviewInTrainer!.status == true
                    ? state is TrinnerUpdataReviewLoading
                        ? Center(child: SpinkitWave())
                        : GestureDetector(
                            onTap: () {
                              cubit.updataReviewSendRevewTrinner(
                                  trainer_id: trainer_id,
                                  rating_id: cubit.getRatingModel!.id == null
                                      ? 0
                                      : cubit.getRatingModel!.id!,
                                  idUser: CachShpreafapp.getdata(key: "UserID"),
                                  rating: cubit.rating.toInt(),
                                  review: cubit.controllerSend.text);

                              cubit.getDataGetAverageTrinnerRevewModel(
                                  trainer_id);
                              print("Updata");
                            },
                            child: Container(
                              width: width * 0.5,
                              height: height * 0.070,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color4),
                              child: text(
                                  title: "Updata",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color3),
                            ),
                          )
                    : state is TrinnerCreatLoading
                        ? Center(child: SpinkitWave())
                        : GestureDetector(
                            onTap: () {
                              cubit.postGetSendRevewTrinner(
                                  trainer_id: trainer_id,
                                  idUser: CachShpreafapp.getdata(key: "UserID"),
                                  rating: cubit.rating.toInt(),
                                  review: cubit.controllerSend.text);
                              cubit.getDataGetAverageTrinnerRevewModel(
                                  trainer_id);
                              print("post");
                            },
                            child: Container(
                              width: width * 0.5,
                              height: height * 0.070,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color4),
                              child: text(
                                  title: "Post",
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color3),
                            ),
                          )
          ],
        ),
      ],
    ),
  );
}
