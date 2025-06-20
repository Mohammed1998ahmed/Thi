import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../Health care/deatils/deatils.dart';
import '../../Booking/servic.dart';
import '../../Location/locationStabe.dart';
import '../cubit/home_stable_cubit.dart';
import 'appBar_widght.dart';

Container image_stack(BuildContext context, HomeStableCubit cubit,
    {required int Id}) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.46,
    decoration: BoxDecoration(
      color: Color.fromRGBO(71, 181, 255, 0.568),
      boxShadow: [
        BoxShadow(
          color: Color.fromRGBO(255, 199, 99, 0.203),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(2, -6),
        ),
      ],
    ),
    // color: Colors.yellow,
    child: Stack(children: [
      cubit.clubIDModel == null
          ? Container()
          : Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
                image: DecorationImage(
                    image: NetworkImage(ImagesPath +
                        cubit.clubIDModel!.club!.profile.toString()),
                    fit: BoxFit.cover),
              ),
            ),
      Scaffold(
        backgroundColor: const Color.fromARGB(0, 126, 26, 26),
        appBar: appBar_widght(context, cubit, Id: Id),
        body: Column(children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonBookandDirectionandShare(
                  context: context,
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Service(
                          Idcubit: Id,
                        ),
                      ),
                    );
                  },
                  title: "book",
                  icon: Icons.book),
              ButtonBookandDirectionandShare(
                  context: context,
                  onTap: () {
                    Navigator.push<void>(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => LocationStable(
                          latitude: double.parse(cubit.clubIDModel!.club!.lat!),
                          // 24.4539,
                          longitude:
                              double.parse(cubit.clubIDModel!.club!.long!),
                          // 54.3773,
                        ),
                      ),
                    );
                  },
                  title: "Direction",
                  icon: Icons.location_on_outlined),
              ButtonBookandDirectionandShare(
                  context: context,
                  onTap: () {
                    shareText(nameStable: "Direction");
                  },
                  title: "share",
                  icon: Icons.share),
            ],
          )
        ]),
      )
    ]),
  );
}

Future<void> shareText({String? nameStable}) async {
  try {
    await FlutterShare.share(
        title: 'Share',
        text: nameStable ?? "Tlkjkljjjljlj HI",
        chooserTitle: "mohammed ahmed "
        // subject: "subject",
        );
  } catch (e) {
    print('Error sharing: $e');
  }
}
