import 'package:flutter/material.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:thi/feature/profile/hospetel/ui/details/Medical.dart';
import 'package:thi/feature/profile/hospetel/ui/details/treatment.dart';
import 'package:thi/feature/profile/hospetel/ui/details/vaccination.dart';
import 'package:thi/feature/profile/hospetel/data/modelhospitle.dart';

class DetailsHospitel extends StatelessWidget {
  const DetailsHospitel(
      {super.key, this.getConsultationModel, required this.indexID});
  final GetConsultationModel? getConsultationModel;
  final int indexID;
  @override
  Widget build(BuildContext context) {
    // print(getConsultationModel.consultation)
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(imageBackground), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: Container(),
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(left: 75),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                      Color.fromRGBO(199, 255, 255, 1), // اللون المتناسق
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: text(
                    title: "Details",
                    color: Color3,
                  ),
                ),
              ),
            ),
            actions: [
              getConsultationModel!.consultation![indexID].replyContent == null
                  ? Container()
                  : TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Color.fromRGBO(
                                  71, 181, 255, 1), // اللون الأصلي
                              title: text(
                                  title: 'Offer consultation', color: Color3),
                              content: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * .990,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Divider(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.9,
                                        child: Row(
                                          children: [
                                            Container(
                                              child: text(
                                                  title: "Reply date : ",
                                                  color: Color4
                                                  // style: TextStyle(color: Color0),
                                                  ),
                                            ),
                                            Container(
                                              child: text(
                                                  title: getConsultationModel!
                                                      .consultation![indexID]
                                                      .replySentAt
                                                      .toString(),
                                                  color: Colors.white54
                                                  // style: TextStyle(color: Color0),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.5,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .990,
                                        child: text(
                                            title: getConsultationModel!
                                                .consultation![indexID]
                                                .replyContent
                                                .toString(),
                                            color: Colors.white60,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500
                                            // style: TextStyle(color: Color0),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'close',
                                    style: TextStyle(color: Color3),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي
                                Color.fromRGBO(71, 181, 255, 1), // اللون الأصلي

                                Color.fromRGBO(
                                    199, 255, 255, 1), // اللون المتناسق
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: text(
                                title: "You have been answered", color: Color3),
                          )))
            ],
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: SingleChildScrollView(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics:
                            NeverScrollableScrollPhysics(), // يمنع التمرير العمودي

                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // عدد الأعمدة في الشبكة
                        ),
                        itemCount: getConsultationModel!
                            .consultation![indexID].images!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.60,
                                      child: Column(
                                        //mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      ImagesPath +
                                                          getConsultationModel!
                                                              .consultation![
                                                                  indexID]
                                                              .images![index],
                                                    ),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: getConsultationModel!
                                          .consultation![indexID]
                                          .images![index] ==
                                      null
                                  ? Container()
                                  : Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.1,
                                      decoration: BoxDecoration(
                                        color: Color0,
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            ImagesPath +
                                                (getConsultationModel
                                                        ?.consultation?[indexID]
                                                        .images?[index] ??
                                                    ''),
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(child: text(title: "name:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].name
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(child: text(title: "color:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].color
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(child: text(title: "gender:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].gender
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(child: text(title: "age:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].age
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            child: text(title: "content:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].content
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                            child: text(title: "symptoms:", color: Color4)),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: text(
                              title: getConsultationModel!
                                  .consultation![indexID].symptoms
                                  .toString(),
                              color: Color0),
                        )
                      ],
                    ),
                  ),
                  Divider(),
                  getConsultationModel!.consultation![indexID].details == null
                      ? Container()
                      : Container(
                          child: text(title: "Details", color: Color0),
                        ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      getConsultationModel!.consultation![indexID].details!
                                  .vaccination ==
                              null
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        VaccinationPage(
                                      getConsultationModel:
                                          getConsultationModel,
                                      indexID: indexID,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي

                                      Color.fromRGBO(
                                          199, 255, 255, 1), // اللون المتناسق
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                    child: text(
                                        title: "vaccination", color: Color3)),
                              ),
                            ),
                      getConsultationModel!
                                  .consultation![indexID].details!.treatment ==
                              null
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        TreatmentPage(
                                      getConsultationModel:
                                          getConsultationModel,
                                      indexID: indexID,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي

                                      Color.fromRGBO(
                                          199, 255, 255, 1), // اللون المتناسق
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                    child: text(
                                        title: "treatment", color: Color3)),
                              ),
                            ),
                      getConsultationModel!
                                  .consultation![indexID].details!.medical ==
                              null
                          ? Container()
                          : GestureDetector(
                              onTap: () {
                                Navigator.push<void>(
                                  context,
                                  MaterialPageRoute<void>(
                                    builder: (BuildContext context) =>
                                        MedicalPage(
                                      getConsultationModel:
                                          getConsultationModel,
                                      indexID: indexID,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي
                                      Color.fromRGBO(
                                          71, 181, 255, 1), // اللون الأصلي

                                      Color.fromRGBO(
                                          199, 255, 255, 1), // اللون المتناسق
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                child: Center(
                                    child:
                                        text(title: "Medical", color: Color3)),
                              ),
                            ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
