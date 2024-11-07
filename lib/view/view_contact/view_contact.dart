import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/animations/route.dart';
import 'package:houzeocontacts/bottom_navigation/bottom_nav.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/constants/height_width.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:houzeocontacts/view/home/add_favourite/bloc/favourites_add_bloc.dart';
import 'package:houzeocontacts/view/home/edit_contact/edit_contact.dart';
import 'package:houzeocontacts/widgets/custom_like_button.dart';
import 'package:houzeocontacts/widgets/custom_round.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDeatils extends StatelessWidget {
  Map<String, dynamic> data;
  final firstLetter;
  final Color avatarColor;
  ContactDeatils(
      {Key? key,
      required this.data,
      required this.avatarColor,
      required this.firstLetter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.googleGray,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Contacts Details',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        backgroundColor: AppColors.googleGray,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppConstants.kheight30,
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: avatarColor,
                  child: Text(
                    firstLetter,
                    style: const TextStyle(
                        fontSize: 80, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              AppConstants.kheight20,
              Text(
                data['FirstName'].toString() + " ${data['SecondName']}",
                style: const TextStyle(color: Colors.white, fontSize: 27),
              ),
              AppConstants.kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRoundButton(
                    icons: Icons.call,
                    onPressed: () async {
                   await requestPhonePermission();
                    },
                    buttontext: 'Call',
                  ),
                  CustomRoundButton(
                    icons: Icons.edit,
                    onPressed: () {
                      Navigator.of(context).push(createRoute(EditContact(
                        email: data['UserEmail'],
                        firstName: data['FirstName'],
                        id: data['Id'],
                        nickname: data['UserNickName'],
                        phone: data['UserPhone'],
                        secondName: data['SecondName'],
                        data: data,
                      )));
                    },
                    buttontext: 'Edit',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BlocConsumer<FavouritesAddBloc, FavouritesAddState>(
                          listener: (context, state) {},
                          builder: (context, state) {
                            return FutureBuilder<bool>(
                              future: ContactServices().isAlreadyFavourited(
                                  data['FirstName'], data['UserPhone']),
                              builder: (context, snapshot) {
                                bool isFavorited =
                                    snapshot.hasData && snapshot.data == true;

                                return CustomLikeButton(
                                    isFavorited: isFavorited,
                                    onLikeButtonTapped: (bool isLiked) async {
                                      if (isLiked) {
                                        final removalSuccess =
                                            await ContactServices()
                                                .removeUserSaved(data['Id']);
                                        if (removalSuccess) {
                                          context
                                              .read<FavouritesAddBloc>()
                                              .add(FavUnsave(
                                                data['Id'],
                                              ));
                                        }
                                        return !removalSuccess;
                                      } else {
                                        // Add to favorites
                                        context
                                            .read<FavouritesAddBloc>()
                                            .add(IdChanges(data['Id']));
                                        context.read<FavouritesAddBloc>().add(
                                            FirstNameChanges(
                                                data['FirstName']));
                                        context.read<FavouritesAddBloc>().add(
                                            SecondNameChanges(
                                                data['SecondName']));
                                        context.read<FavouritesAddBloc>().add(
                                            PhoneChanges(data['UserPhone']));
                                        context
                                            .read<FavouritesAddBloc>()
                                            .add(UserEmail(data['UserEmail']));
                                        context.read<FavouritesAddBloc>().add(
                                            NickNameChanges(
                                                data['UserNickName']));

                                        context
                                            .read<FavouritesAddBloc>()
                                            .add(FormSubmit());

                                        return true;
                                      }
                                    });
                              },
                            );
                          }),
                      AppConstants.kwidth20,
                      CustomRoundButton(
                        icons: Icons.delete,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Are you sure to delete'),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection("UserContacts")
                                              .doc(data['Id'])
                                              .delete();
                                          Navigator.of(context).push(
                                              createRoute(
                                                  const BottomNavigation()));
                                        },
                                        child: const Text('Yes')),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('No'))
                                  ],
                                );
                              });
                        },
                        buttontext: 'Delete',
                      )
                    ],
                  ),
                ],
              ),
              AppConstants.kheight40,
              Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.googleLightGray,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact info',
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                      AppConstants.kheight15,
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                          AppConstants.kwidth10,
                          Column(
                            children: [
                              Text(
                                data['UserPhone'].toString(),
                                style: const TextStyle(
                                    color: AppColors.whiteColor, fontSize: 18),
                              )
                            ],
                          )
                        ],
                      ),
                      AppConstants.kheight20,
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                          AppConstants.kwidth10,
                          Column(
                            children: [
                              Text(
                                data['UserEmail']?.toString().isNotEmpty == true
                                    ? data['UserEmail'].toString()
                                    : 'Add Email to view',
                                style: const TextStyle(
                                    color: AppColors.whiteColor, fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      ),
                      AppConstants.kheight20,
                      Row(
                        children: [
                          const Icon(
                            Icons.person_2,
                            color: AppColors.whiteColor,
                            size: 30,
                          ),
                          AppConstants.kwidth10,
                          Column(
                            children: [
                              Text(
                                data['UserNickName']?.toString().isNotEmpty ==
                                        true
                                    ? data['UserNickName'].toString()
                                    : 'Add Nickname to view',
                                style: const TextStyle(
                                    color: AppColors.whiteColor, fontSize: 18),
                              )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future<void> requestPhonePermission() async {
  PermissionStatus status = await Permission.phone.request();
  if (status.isGranted) {
  await _makeCall();
  } else {
      Text('Calling failed');
  }
}
 Future<void> _makeCall() async {
    final Uri telUri = Uri(scheme: 'tel', path:  data['UserPhone'].toString());
    if (await canLaunchUrl(telUri)) {
      await launchUrl(telUri);
    } else {
      throw 'Could not launch call';
    }
  }
   
}
