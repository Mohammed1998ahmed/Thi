// ignore: must_be_immutable
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thi/feature/Auction/AddAuctions/logic/cubit/add_auctions_cubit.dart';
import 'package:thi/core/widght/Widght.dart';
import 'package:thi/core/component/conset/Const.dart';
import 'package:video_player/video_player.dart';
import 'ui/address_birth_data_widght.dart';
import 'ui/category_widght.dart';
import 'ui/data_start_end_widght.dart';
import 'ui/select_gender_widght.dart';
import 'ui/text_from_field_name_color_widght.dart';
import 'ui/top_text_widght.dart';

class AddAuctions extends StatefulWidget {
  @override
  State<AddAuctions> createState() => _AddAuctionsState();
}

class _AddAuctionsState extends State<AddAuctions> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('');
  }

  String? selectedVideoPath;

  Future<void> _selectVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'avi'], // الامتدادات المسموح بها
      allowMultiple: false,
    );

    if (result != null && result.files.isNotEmpty) {
      PlatformFile file = result.files.first;
      String path = file.path!;
      selectedVideoPath = file.path!;
      _controller = VideoPlayerController.file(File(path));
      await _controller!.initialize();
      _isVideoPlaying = true;
      _isVideoSelected = true;

      setState(() {});
    }
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  bool _isVideoPlaying = false;
  bool _isVideoSelected = false;

  File? selectedImage;

  int selectedValue = 1;
  List<XFile>? selectedImages;

  Future<void> _pickImages() async {
    final List<XFile>? images = await ImagePicker().pickMultiImage();
    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images;
      });
    }
  }

  DateTime? _selectedDay;
  // Future<void> _pickImage() async {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return AddAuctionsCubit();
      },
      child: BlocConsumer<AddAuctionsCubit, AddAuctionsState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = AddAuctionsCubit.getObject(context);
          // ignore: unused_local_variable
          File? imageFile;
          return SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imageBackground), fit: BoxFit.cover)),
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Color2,
                    ),
                  ),
                ),
                body: Container(
                  child: SingleChildScrollView(
                    child: Form(
                      key: cubit.keyForm,
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  top_text_widght(context),
                                  select_image_wight(context),
                                  Divider(),
                                  select_video_widght(context),
                                  Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        text_from_field_name_color_widght(
                                            context, cubit),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        category_widght(context, cubit),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Data_start_end_widght(
                                          context: context,
                                          cubit: cubit,
                                          selectedDay1: _selectedDay,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        TextFieldWidght(
                                          controller:
                                              cubit.initaPriceController,
                                          context: context,
                                          hintText: "InitaPrice",
                                          messageForm:
                                              'Please enter your InitaPrice',
                                          keyboardType: TextInputType.number,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        TextFieldWidght(
                                          controller:
                                              cubit.descriptionController,
                                          context: context,
                                          hintText: "Description",
                                          messageForm:
                                              'Please enter your Description',
                                          keyboardType:
                                              TextInputType.visiblePassword,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Address_birth_data_widght(
                                          context: context,
                                          cubit: cubit,
                                          selectedDay: _selectedDay,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.019,
                                        ),
                                        Container(
                                          child: text(
                                            title: "Gender",
                                            fontSize: 18,
                                            color: Color0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        select_gender_widght(context, cubit),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0010,
                                  ),
                                  state is AddAuctionsLoading
                                      ? SpinkitWave()
                                      : ButtonStaic(
                                          context: context,
                                          onTap: () {
                                            cubit.postAddAuctions(
                                                context: context,
                                                name: cubit.nameController.text,
                                                Category: cubit
                                                    .categoryController.text,
                                                Data1: cubit.Data1!,
                                                Data: cubit.Data!,
                                                addriess: cubit
                                                    .addressController.text,
                                                berathData: cubit.BirthData!,
                                                color: cubit.selectedColor!,
                                                description: cubit
                                                    .descriptionController.text,
                                                gender: cubit.selectGender,
                                                initaPrice: cubit
                                                    .initaPriceController.text,
                                                selectedImages: selectedImages!,
                                                controller: selectedVideoPath!);

                                            if (cubit.keyForm.currentState!
                                                .validate()) {
                                              if (selectedImage != null) {}
                                            }
                                            // يتم تنفيذ هذا الكود عند النقر على الزر

                                            print('تم النقر على الزر!');
                                          },
                                          title: "Add Auctiond",
                                        ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Container select_video_widght(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: _isVideoSelected
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.7,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.97,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        child: AspectRatio(
                                          aspectRatio:
                                              _controller!.value.aspectRatio,
                                          child: VideoPlayer(_controller!),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: MediaQuery.of(context).size.height * 0.21,
                              child: AspectRatio(
                                aspectRatio: _controller!.value.aspectRatio,
                                child: VideoPlayer(_controller!),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                _isVideoPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                size: 48.0,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isVideoPlaying = !_isVideoPlaying;
                                  _isVideoPlaying
                                      ? _controller!.play()
                                      : _controller!.pause();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(
                    child: ElevatedButton(
                        onPressed: _selectVideo,
                        child: text(title: "Select Vidoe", color: Color0)),
                  ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Container select_image_wight(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          selectedImages == null
              ? Center(
                  child: ElevatedButton(
                      onPressed: _pickImages,
                      child: text(title: "Select Images", color: Color0)),
                )
              : Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: selectedImages!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Image.file(
                                      File(selectedImages![index].path),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.0),
                                  image: DecorationImage(
                                      image: FileImage(
                                        File(selectedImages![index].path),
                                      ),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
