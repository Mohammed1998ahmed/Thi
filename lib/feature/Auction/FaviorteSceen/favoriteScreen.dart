import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thi/feature/Auction/DetlisHours/detailsHoroses.dart';
import 'package:thi/feature/Auction/FaviorteSceen/logic/cubit/favorite_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import 'ui/details_widght.dart';
import 'ui/shimer_widghts.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool shimmmer = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => FavoriteCubit()
        ..getFavorite()
        ..configurePusher1(),
      child: BlocConsumer<FavoriteCubit, FavoriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = FavoriteCubit.getObject(context);
          // cubit.getFavorite();
          return Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                centerTitle: true,
                toolbarHeight: 70,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: text(
                    title: 'Favorite',
                    color: Color0,
                    fontSize: 22,
                    fontWeight: FontWeight.w900),
              ),
              body: cubit.getFavoriteModel == null
                  ? shimer_widghts(width, height)
                  : Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.84,
                      child: ListView.builder(
                        itemCount:
                            cubit.getFavoriteModel!.favoriteAuctions!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push<void>(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      DetailsHoeoses(
                                    IDActions: cubit
                                        .getFavoriteModel!
                                        .favoriteAuctions![index]
                                        .horses!
                                        .auctionId!,
                                  ),
                                ),
                              );
                            },
                            child: details_widght(context, cubit, index),
                          );
                        },
                      ),
                    ));
        },
      ),
    );
  }
}
