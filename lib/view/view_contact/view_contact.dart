import 'package:flutter/material.dart';
import 'package:houzeocontacts/animations/route.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/constants/height_width.dart';
import 'package:houzeocontacts/view/home/edit_contact/edit_contact.dart';
import 'package:houzeocontacts/widgets/custom_round.dart';

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
                    style:
                        const TextStyle(fontSize: 80, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              AppConstants.kheight20,
              Text(
                data['FirstName'].toString()+" ${data['SecondName']}",
                style: const TextStyle(color: Colors.white, fontSize: 27),
              ),
              AppConstants.kheight20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomRoundButton(
                    icons: Icons.call,
                    onPressed: () {},
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
                  CustomRoundButton(
                    icons: Icons.favorite,
                    onPressed: () {},
                    buttontext: 'Favourite',
                  ),
                  CustomRoundButton(
                    icons: Icons.delete,
                    onPressed: () {},
                    buttontext: 'Delete',
                  )
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
}
