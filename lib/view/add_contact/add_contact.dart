import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/constants/height_width.dart';
import 'package:houzeocontacts/constants/validators.dart';
import 'package:houzeocontacts/view/add_contact/add_contact_bloc/add_contact_bloc.dart';
import 'package:houzeocontacts/widgets/custom_button.dart';
import 'package:houzeocontacts/widgets/custom_snack.dart';
import 'package:houzeocontacts/widgets/custom_textfeild.dart';

class AddContact extends StatelessWidget {
  AddContact({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();


  String? optionalValidator(String? value, String? Function(String?) validator) {
    if (value == null || value.isEmpty) return null;
    return validator(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.googleGray,
        title: const Text(
          'Create contact',
          style: TextStyle(
            color: AppColors.whiteColor,
          ),
        ),
      ),
      backgroundColor: AppColors.googleGray,
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
                      context.read<AddContactBloc>().add(FormSubmit());
                       ScaffoldMessenger.of(context).showSnackBar(customSnack(
                        
                        'Contact Added',
                        'Contact saved sucessfully',
                        const Icon(
                          Icons.done,
                          color: Colors.green,
                          size: 28,
                        ),
                        Colors.green,
                      ));
                      Navigator.of(context).pop();
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
