///يحوي على تعديل بسيط يجب الانتباه

import 'package:flutter/material.dart';
import 'package:thi/feature/Auction/DetlisHours/ui/videoPages.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';

import '../../../Auction/AuctionShare/auctionShare.dart';
import '../data/ProfileAuctions.dart';

class DetailsHoeosesNav extends StatefulWidget {
  const DetailsHoeosesNav(
      {Key? key, required this.profileAuctionModel, required this.ID_Auction})
      : super(key: key);
  final ProfileAuctionModel profileAuctionModel;
  final int ID_Auction;
  @override
  State<DetailsHoeosesNav> createState() => _DetailsHoeosesState();
}

class _DetailsHoeosesState extends State<DetailsHoeosesNav> {
  // ignore: unused_field
  int _page = 0;
  List category = [
    {
      "image": "assets/images/img_10.png",
      "text": "Ability &",
    },
    {"image": "assets/images/img_11.png", "text": "Flat race"},
    {"image": "assets/images/img_12.png", "text": "Show horse"},
    {"image": "assets/images/img_13.png", "text": "Pony"},
    {
      "image": "assets/images/img_14.png",
      "text": "Race",
    },
  ];
  int selected_page = 0;

  int currentIndex = 0;
  final List<String> images = [
    'assets/images/image 112.png',
    'assets/images/img_21.png',
    'assets/images/main/image 50 (1).png',
    'assets/images/image 112.png',
    'assets/images/image 112.png',
    'assets/images/img_21.png',
    'assets/images/main/image 50 (1).png',
    'assets/images/image 112.png',
  ];
  int _currentImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.fill),
            // borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            verticalDirection: VerticalDirection.down,
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
                centerTitle: true,
                toolbarHeight: 50,
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: text(
                    title: 'Information',
                    color: Color0,
                    fontSize: 22,
                    fontWeight: FontWeight.w800),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.35,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: PageView.builder(
                        itemCount: widget
                            .profileAuctionModel
                            .auctions![widget.ID_Auction]
                            .horses!
                            .images!
                            .length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          return Image.network(
                            ImagesPath +
                                widget
                                    .profileAuctionModel
                                    .auctions![widget.ID_Auction]
                                    .horses!
                                    .images![index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.profileAuctionModel
                          .auctions![widget.ID_Auction].horses!.images!
                          .map((url) {
                        int index = widget.profileAuctionModel
                            .auctions![widget.ID_Auction].horses!.images!
                            .indexOf(ImagesPath + url);
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: EdgeInsets.symmetric(horizontal: 2.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentImageIndex == index
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // Container(
              //   height: height * 0.4,
              //   child: GridView.builder(
              //     // shrinkWrap: true,
              //     // يمنع التمرير العمودي

              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2, // عدد الأعمدة في الشبكة
              //     ),
              //     itemCount: widget.profileAuctionModel
              //         .auctions![widget.ID_Auction].horses!.images!.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       return GestureDetector(
              //         onTap: () {
              //           showDialog(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return Dialog(
              //                 child: Container(
              //                   height: height * 0.60,
              //                   child: Column(
              //                     //mainAxisSize: MainAxisSize.min,
              //                     children: [
              //                       Container(
              //                         height: height * 0.50,
              //                         child: Image.network(
              //                           ImagesPath +
              //                               widget
              //                                   .profileAuctionModel
              //                                   .auctions![widget.ID_Auction]
              //                                   .horses!
              //                                   .images![index],
              //                           fit: BoxFit.cover,
              //                           height: height * 0.40,
              //                         ),
              //                       ),
              //                       SizedBox(height: height * 0.008),
              //                       ElevatedButton(
              //                         onPressed: () {
              //                           Navigator.of(context).pop();
              //                         },
              //                         child: Text('close'),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               );
              //             },
              //           );
              //         },
              //         child: Padding(
              //           padding: const EdgeInsets.all(8.0),
              //           child: Container(
              //             width: width * 0.3,
              //             height: height * 0.1,
              //             decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(20),
              //                 image: DecorationImage(
              //                     image: NetworkImage(
              //                       ImagesPath +
              //                           widget
              //                               .profileAuctionModel
              //                               .auctions![widget.ID_Auction]
              //                               .horses!
              //                               .images![index],
              //                     ),
              //                     fit: BoxFit.cover)),
              //           ),
              //         ),
              //       );
              //     },
              //   ),

              // ),
              Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: images.map((image) {
              //     // Get the index of the current image
              //     // ignore: unused_local_variable
              //     int index = images.indexOf(image);
              //     // Return a dot widget for each image
              //     return Container(
              //       width: 50,
              //       height: 30,
              //       margin: const EdgeInsets.symmetric(
              //           vertical: 10.0, horizontal: 2.0),
              //       decoration: BoxDecoration(
              //         // Set the color of the dot depending on the current index
              //         color: currentIndex == 2 ? Color0 : Colors.grey,
              //         // Make the dot circular
              //         shape: BoxShape.circle,
              //       ),
              //     );
              //   }).toList(),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      child: text(title: "To watch a video:"),
                    ),
                    Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push<void>(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => VideoApp(
                                Urlvideo: widget.profileAuctionModel
                                    .auctions![widget.ID_Auction].horses!.video
                                    .toString(),
                              ),
                            ),
                          );
                        },
                        child: text(title: "Video"))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Horse Name :  ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget.profileAuctionModel
                                  .auctions![widget.ID_Auction].horses!.name
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Gender : ',
                                  style: TextStyle(
                                    color: Color0,
                                    fontSize: 18,
                                    fontFamily: 'Caveat',
                                    fontWeight: FontWeight.w600,
                                    // height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: widget
                                      .profileAuctionModel
                                      .auctions![widget.ID_Auction]
                                      .horses!
                                      .gender
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: 'Caveat',
                                    fontWeight: FontWeight.w400,
                                    // height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Birth Date : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget.profileAuctionModel
                                  .auctions![widget.ID_Auction].horses!.birth
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Category : ',
                                  style: TextStyle(
                                    color: Color0,
                                    fontSize: 18,
                                    fontFamily: 'Caveat',
                                    fontWeight: FontWeight.w600,
                                    // height: 0,
                                  ),
                                ),
                                TextSpan(
                                  text: widget
                                      .profileAuctionModel
                                      .auctions![widget.ID_Auction]
                                      .horses!
                                      .category
                                      .toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    textBaseline: TextBaseline.alphabetic,
                                    fontFamily: 'Caveat',
                                    fontWeight: FontWeight.w400,
                                    // height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Color : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget.profileAuctionModel
                                  .auctions![widget.ID_Auction].horses!.color
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Location : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget.profileAuctionModel
                                  .auctions![widget.ID_Auction].horses!.address
                                  .toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Owner : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget
                                          .profileAuctionModel
                                          .auctions![widget.ID_Auction]
                                          .theOwner !=
                                      null
                                  ? widget.profileAuctionModel
                                      .auctions![widget.ID_Auction].theOwner
                                      .toString()
                                  : " No one has joined yet.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Address : ',
                              style: TextStyle(
                                color: Color0,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w600,
                                // height: 0,
                              ),
                            ),
                            TextSpan(
                              text: widget
                                          .profileAuctionModel
                                          .auctions![widget.ID_Auction]
                                          .theOwnerEmail !=
                                      null
                                  ? widget
                                      .profileAuctionModel
                                      .auctions![widget.ID_Auction]
                                      .theOwnerEmail
                                      .toString()
                                  : "No one has joined yet.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Caveat',
                                fontWeight: FontWeight.w400,
                                // height: 0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    borderRadius: BorderRadius.circular(15),
                                    color: Color0),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      'Start of auction : ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Caveat',
                                        fontWeight: FontWeight.w600,
                                        // height: 0,
                                      ),
                                    ),
                                    Text(
                                      widget.profileAuctionModel
                                          .auctions![widget.ID_Auction].begin
                                          .toString(),
                                      style: TextStyle(
                                        color: Color(0xFFAC0000),
                                        fontSize: 18,
                                        fontFamily: 'Caveat',
                                        fontWeight: FontWeight.w400,
                                        // height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    color: Color0,
                                    borderRadius: BorderRadius.circular(15.0)),
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      'End of Auction: ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Caveat',
                                        fontWeight: FontWeight.w600,
                                        // height: 0,
                                      ),
                                    ),
                                    Text(
                                      widget.profileAuctionModel
                                          .auctions![widget.ID_Auction].end
                                          .toString(),
                                      style: TextStyle(
                                        color: Color(0xFFAC0000),
                                        fontSize: 18,
                                        fontFamily: 'Caveat',
                                        fontWeight: FontWeight.w400,
                                        // height: 0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: width * 0.90,
                              height: height * 0.055,
                              //margin: EdgeInsets.fromLTRB(20, 20, 0.0, 10),
                              //  padding: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: Color0,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                              ),
                              child: Center(
                                child: text(
                                    title:
                                        'Price: ${widget.profileAuctionModel.auctions![widget.ID_Auction].initialPrice.toString()} AED',
                                    color: Color3,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),

                            Container(
                              width: width * 0.90,
                              height: height * 0.055,
                              decoration: BoxDecoration(
                                color: Color0,
                                border:
                                    Border.all(color: Colors.black, width: 1),
                                borderRadius: BorderRadius.circular(15),
                                shape: BoxShape.rectangle,
                              ),
                              child: widget
                                              .profileAuctionModel
                                              .auctions![widget.ID_Auction]
                                              .timeLeft!
                                              .daysLeft !=
                                          0 &&
                                      widget
                                              .profileAuctionModel
                                              .auctions![widget.ID_Auction]
                                              .timeLeft!
                                              .hoursLeft !=
                                          0 &&
                                      widget
                                              .profileAuctionModel
                                              .auctions![widget.ID_Auction]
                                              .timeLeft!
                                              .minutesLeft !=
                                          0
                                  ? Center(
                                      child: text(
                                          title:
                                              'Time left: ${widget.profileAuctionModel.auctions![widget.ID_Auction].timeLeft!.daysLeft.toString()}d ${widget.profileAuctionModel.auctions![widget.ID_Auction].timeLeft!.hoursLeft.toString()}h ${widget.profileAuctionModel.auctions![widget.ID_Auction].timeLeft!.minutesLeft.toString()}m',
                                          color: Color3,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600),
                                    )
                                  : Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Center(
                                        child: text(
                                            title: "The auction has ended.",
                                            color: Color3),
                                      ),
                                    ),
                            ),
                            // Container(
                            //   width: MediaQuery.of(context).size.width * 0.90,
                            //   height: 47,
                            //   // margin: EdgeInsets.fromLTRB(0.0, 20, 0.0, 10),
                            //   //padding: EdgeInsets.only(bottom: 10),
                            //   decoration: BoxDecoration(
                            //     color: Color0,
                            //     border:
                            //         Border.all(color: Colors.black, width: 1),
                            //     borderRadius: BorderRadius.circular(15),
                            //     shape: BoxShape.rectangle,
                            //   ),
                            //   child: Center(
                            //     child: text(
                            //         title: 'Time left: 3  d 6h 44m',
                            //         color: Color3,
                            //         fontSize: 18,
                            //         fontWeight: FontWeight.w600),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // widget.profileAuctionModel.auctions![widget.ID_Auction]
                      //             .timeLeft ==
                      //         true
                      //     ?

                      widget.profileAuctionModel.auctions![widget.ID_Auction]
                                      .timeLeft!.daysLeft !=
                                  0 &&
                              widget
                                      .profileAuctionModel
                                      .auctions![widget.ID_Auction]
                                      .timeLeft!
                                      .hoursLeft !=
                                  0 &&
                              widget
                                      .profileAuctionModel
                                      .auctions![widget.ID_Auction]
                                      .timeLeft!
                                      .minutesLeft !=
                                  0
                          ? Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuctionShare(
                                              ID_Auctions: widget
                                                  .profileAuctionModel
                                                  .auctions![widget.ID_Auction]
                                                  .id!,
                                              initAmount: 500,
                                            )),
                                  );
                                },
                                child: Text('Go to Second Screen'),
                                style: ElevatedButton.styleFrom(
                                  // primary: Colors.blue, // لون خلفية الزر
                                  // onPrimary: Colors.white, // لون النص داخل الزر
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 10), // تعيين المسافات الداخلية
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        10.0), // تعيين شكل الحواف
                                  ),
                                ),
                              ),
                            )
                          : Container(),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Center(
                      //     child: Container(
                      //       height: MediaQuery.of(context).size.height * 0.080,
                      //       width: 350,
                      //       decoration: BoxDecoration(
                      //         color: Color0,
                      //         border: Border.all(color: Colors.black, width: 1),
                      //         borderRadius: BorderRadius.circular(15),
                      //         shape: BoxShape.rectangle,
                      //       ),
                      //       child: ListTile(
                      //         leading: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             text(
                      //                 title: 'Current Bid',
                      //                 color: Color3,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.w600),
                      //             SizedBox(
                      //               height: 3,
                      //             ),
                      //             text(
                      //                 title: '\$ 300',
                      //                 color: Colors.green,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.w700),
                      //           ],
                      //         ),
                      //         trailing: Container(
                      //           width: 93,
                      //           height: 45,
                      //           decoration: BoxDecoration(
                      //             color: Colors.white,
                      //             border: Border.all(color: Colors.black),
                      //             borderRadius: BorderRadius.circular(20),
                      //           ),
                      //           child: Center(
                      //             child: text(
                      //                 title: 'Start',
                      //                 color: Colors.black,
                      //                 fontSize: 18,
                      //                 fontWeight: FontWeight.w700),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
