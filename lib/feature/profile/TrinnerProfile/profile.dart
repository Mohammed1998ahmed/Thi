import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Reservations/Details_Club/data/TrinerIdByClub.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/TrinnerProfile/Review.dart';
import 'package:thi/feature/profile/TrinnerProfile/logic/cubit/trinner_cubit.dart';

import 'ui/appBar_widght.dart';
import 'ui/image_trinner.dart';
import 'ui/name_trinner.dart';
import 'ui/review_trinner_all.dart';

class Profile extends StatefulWidget {
  Profile(
      {Key? key,
      required this.cubit,
      required this.indexProfile,
      required this.Id_trinner})
      : super(key: key);
  final MyClubTrenerIDModel cubit;
  final int indexProfile;
  final int Id_trinner;
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrinnerCubit()
        ..getDataGetAverageTrinnerRevewModel(widget.Id_trinner)
        ..configurePusheTRating2(trainer_id: widget.Id_trinner),
      child: BlocConsumer<TrinnerCubit, TrinnerState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = TrinnerCubit.getObject(context);
          return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  imageBackground,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
                Scaffold(
                  backgroundColor: Colors.transparent,
                  appBar: appBar_widght(context, cubit),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                            height: 130,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Spacer(),
                                    SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                                image_trinner(context,
                                    cubit: widget.cubit,
                                    indexProfile: widget.indexProfile),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.055,
                                ),
                                name_trinner(context,
                                    cubit: widget.cubit,
                                    indexProfile: widget.indexProfile),

                                // Spacer()
                              ],
                            )),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .004,
                        ),
                        ButtonStaic(
                            widthContainer:
                                MediaQuery.of(context).size.width * 0.40,
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ReviewTriner(
                                    trainer_id: widget.Id_trinner,
                                  ),
                                ),
                              );
                              print('تم النقر على الزر!');
                            },
                            title: "Review",
                            context: context),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .008,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .003,
                        ),
                        Divider(
                          color: Color.fromRGBO(50, 52, 70, 1),
                        ),
                        review_trinner_all(context,
                            cubit: widget.cubit,
                            indexProfile: widget.indexProfile)
                      ],
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
