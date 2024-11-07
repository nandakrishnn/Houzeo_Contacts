import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/animations/route.dart';
import 'package:houzeocontacts/bottom_navigation/bottom_nav.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/constants/height_width.dart';
import 'package:houzeocontacts/constants/validators.dart';
import 'package:houzeocontacts/view/add_contact/add_contact_bloc/add_contact_bloc.dart';
import 'package:houzeocontacts/widgets/custom_button.dart';
import 'package:houzeocontacts/widgets/custom_snack.dart';
import 'package:houzeocontacts/widgets/custom_textfeild.dart';

class EditContact extends StatelessWidget {
  final data;
  String firstName;
  String secondName;
  int phone;
  String email;
  String id;
  String nickname;
  EditContact(
      {super.key,
      required this.data,
      required this.email,
      required this.firstName,
      required this.id,
      required this.nickname,
      required this.phone,
      required this.secondName});

  String? optionalValidator(
      String? value, String? Function(String?) validator) {
    if (value == null || value.isEmpty) return null;
    return validator(value);
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    final TextEditingController nameController =
        TextEditingController(text: firstName);
    final TextEditingController lastNameController =
        TextEditingController(text: secondName);
    final TextEditingController phoneController =
        TextEditingController(text: phone.toString());
    final TextEditingController emailController =
        TextEditingController(text: email);
    final TextEditingController nickController =
        TextEditingController(text: nickname);
    context.read<AddContactBloc>().add(IdChanges(id));
    context.read<AddContactBloc>().add(FirstNameChanges(firstName));
    context.read<AddContactBloc>().add(SecondNameChanges(secondName));
    context.read<AddContactBloc>().add(PhoneChanges(phone));
    context.read<AddContactBloc>().add(UserEmail(email));
    context.read<AddContactBloc>().add(NickNameChanges(nickname));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
     
        backgroundColor: AppColors.colorGray,
        title: const Text(
          'Edit contact',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.colorGray,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                AppConstants.kheight15,
                CustomTextFeild2(
                  controller: nameController,
                  validator: (p0) => Validators.validateFirstName(p0),
                  onChanged: (p0) =>
                      context.read<AddContactBloc>().add(FirstNameChanges(p0)),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.whiteColor,
                  ),
                  heading: 'First Name',
                ),
                AppConstants.kheight30,
                CustomTextFeild2(
                  controller: lastNameController,
                  validator: (value) =>
                      optionalValidator(value, Validators.validateLastName),
                  onChanged: (p0) =>
                      context.read<AddContactBloc>().add(SecondNameChanges(p0)),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: AppColors.whiteColor,
                  ),
                  heading: 'Last Name',
                ),
                AppConstants.kheight30,
                CustomTextFeild2(
                  controller: phoneController,
                  validator: (p0) => Validators.validatePhoneNumber(p0),
                  onChanged: (p0) {
                    final phoneInt = int.tryParse(p0) ?? 0;
                    context.read<AddContactBloc>().add(PhoneChanges(phoneInt));
                  },
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: AppColors.whiteColor,
                  ),
                  heading: 'Phone',
                ),
                AppConstants.kheight30,
                CustomTextFeild2(
                  controller: emailController,
                  validator: (value) =>
                      optionalValidator(value, Validators.validateEmail),
                  onChanged: (p0) =>
                      context.read<AddContactBloc>().add(UserEmail(p0)),
                  prefixIcon: const Icon(
                    Icons.email,
                    color: AppColors.whiteColor,
                  ),
                  heading: 'Email',
                ),
                AppConstants.kheight30,
                CustomTextFeild2(
                  controller: nickController,
                  validator: (value) =>
                      optionalValidator(value, Validators.validateNickname),
                  onChanged: (p0) =>
                      context.read<AddContactBloc>().add(NickNameChanges(p0)),
                  prefixIcon: const Icon(
                    Icons.person_3_outlined,
                    color: AppColors.whiteColor,
                  ),
                  heading: 'Nickname',
                ),
                AppConstants.kheight40,
                LoginButton(
                  content: 'Save',
                  ontap: () {
                    if (formkey.currentState!.validate()) {
                      context.read<AddContactBloc>().add(UpdateFormSubmit());
                      ScaffoldMessenger.of(context).showSnackBar(customSnack(
                        'Contact updated',
                        'Contact updated sucessfully',
                        const Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 28,
                        ),
                        Colors.green,
                      ));
                      Navigator.of(context).push(createRoute(const BottomNavigation()));
                      
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(customSnack(
                        'Add Details',
                        'Please complete the required fields.',
                        const Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 28,
                        ),
                        Colors.red,
                      ));
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
