import 'dart:developer';
import 'dart:io';

import 'package:discover/controller/admin_provider.dart';
import 'package:discover/model/admin_model.dart';
import 'package:discover/widgets/colors.dart';
import 'package:discover/widgets/snackbar.dart';
import 'package:discover/widgets/text_style.dart';
import 'package:discover/widgets/textfield.dart';
import 'package:enefty_icons/enefty_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AdminAddpage extends StatelessWidget {
  AdminAddpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final addProvider = Provider.of<AdminProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: TextWidget().text(data: "Add Item", color: colors().black),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              print('No route to pop');
            }
          },
          icon: Icon(EneftyIcons.arrow_left_3_outline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: addProvider.packageAddFormkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget().text(
                    data: "Add Location Images",
                    size: 18.0,
                    weight: FontWeight.bold),
                SizedBox(height: 16),
                Container(
                  height: 120,
                  child: Consumer<AdminProvider>(
                    builder: (context, value, child) => GestureDetector(
                      onTap: () {
                        addProvider.getImage(ImageSource.gallery);
                      },
                      child: Container(
                        height: size.height * .2,
                        width: size.width * .9,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.black, width: 2),
                          image: value.pickedImage != null
                              ? DecorationImage(
                                  image: FileImage(value.pickedImage!),
                                  fit: BoxFit.contain,
                                )
                              : const DecorationImage(
                                  image:
                                      AssetImage('assets/profile_avatar.jpg'),
                                  fit: BoxFit.contain,
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.place,
                    color: Colors.black,
                  ),
                  labelText: 'Placename',
                  controller: addProvider.placeNameController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.padding_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'About',
                  controller: addProvider.aboutController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.padding_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'Duration',
                  controller: addProvider.durationController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.padding_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'Transportation',
                  controller: addProvider.transportationController,
                ),
                SizedBox(height: 20),
                CustomTextFormField(
                  prefixIcon: Icon(
                    Icons.padding_outlined,
                    color: Colors.black,
                  ),
                  labelText: 'Location',
                  controller: addProvider.locationController,
                ),
                SizedBox(height: 24),
                Center(
                  child: Container(
                    width: double.infinity,
                    child: FloatingActionButton.extended(
                      elevation: 0,
                      backgroundColor: colors().blue,
                      onPressed: () async {
                        if (addProvider.packageAddFormkey.currentState!
                            .validate()) {
                          await addData(context, addProvider);
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          }
                          SnackBarWidget().showSuccessSnackbar(
                              context, 'Package Added Successfully');
                        }
                      },
                      label: TextWidget()
                          .text(data: "Add Item", color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addData(BuildContext context, AdminProvider getprovider) async {
    final pickedImage = getprovider.pickedImage;
    if (pickedImage != null) {
      getprovider.setIsAddingData(true);
      final image = await getprovider.uploadImage(
          File(pickedImage.path), getprovider.imageName);

      final travel = AdminModel(
        placeName: getprovider.placeNameController.text,
        aboutTrip: getprovider.aboutController.text,
        duration: getprovider.durationController.text,
        transportation: getprovider.transportationController.text,
        location: getprovider.locationController.text,
        image: image,
        wishList: [],
      );

      getprovider.addTravelPackage(travel);

      getprovider.clearTravelControllers();

      SnackBarWidget()
          .showSuccessSnackbar(context, 'Travel Package Added Successfully');
    } else {
      SnackBarWidget()
          .showSuccessSnackbar(context, 'Failed to Add, try once more');
      log('Error: pickedImage is null');
    }
    getprovider.setIsAddingData(false);
  }
}
