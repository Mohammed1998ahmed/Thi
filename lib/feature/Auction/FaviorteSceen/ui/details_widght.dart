import 'package:flutter/material.dart';

import '../../../../core/component/conset/Const.dart';
import '../../../../core/widght/Widght.dart';
import '../logic/cubit/favorite_cubit.dart';

Padding details_widght(BuildContext context, FavoriteCubit cubit, int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: MediaQuery.of(context).size.height * 0.44,
      width: 200,
      decoration: BoxDecoration(
        color: Color0.withOpacity(0.3),
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.21,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(ImagesPath +
                    cubit.getFavoriteModel!.favoriteAuctions![index].horses!
                        .images![0]
                        .toString()),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text(
                    title: cubit
                        .getFavoriteModel!.favoriteAuctions![index].description
                        .toString(),
                    color: Color0,
                    fontSize: 18,
                    fontWeight: FontWeight.w900),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Name : ',
                        style: TextStyle(
                          color: Color0,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: cubit.getFavoriteModel!.favoriteAuctions![index]
                            .horses!.name
                            .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Color : ',
                        style: TextStyle(
                          color: Color0,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: cubit.getFavoriteModel!.favoriteAuctions![index]
                            .horses!.color
                            .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Gender : ',
                        style: TextStyle(
                          color: Color0,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: cubit.getFavoriteModel!.favoriteAuctions![index]
                            .horses!.gender
                            .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Birth Date : ',
                        style: TextStyle(
                          color: Color0,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      TextSpan(
                        text: cubit.getFavoriteModel!.favoriteAuctions![index]
                            .horses!.birth
                            .toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontFamily: 'Caveat',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Price : ',
                            style: TextStyle(
                              color: Color0,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          TextSpan(
                            text: cubit.getFavoriteModel!
                                    .favoriteAuctions![index].initialPrice
                                    .toString() +
                                " AED",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Caveat',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
