import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/animations/route.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:houzeocontacts/view/add_contact/add_contact.dart';
import 'package:houzeocontacts/view/home/get_contact_bloc/get_contact_info_bloc.dart';

class HomeContacts extends StatelessWidget {
  const HomeContacts({super.key});

  @override
  Widget build(BuildContext context) {
     Color _getRandomColor() {
    return Color.fromARGB(
      255,
      Random().nextInt(256),
      Random().nextInt(256),
      Random().nextInt(256),
    );
  }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contacts List',style: TextStyle(color: AppColors.whiteColor),),
      backgroundColor: AppColors.googleGray,
      ),
      backgroundColor: AppColors.googleGray,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(createRoute(AddContact()));
          },
          child: const Text(
            '+',
            style: TextStyle(fontSize: 26, color: AppColors.googleBackground),
          ),
          backgroundColor: AppColors.googleLightGray,
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            GetContactInfoBloc(ContactServices())..add(FetchDataContact()),
        child: BlocConsumer<GetContactInfoBloc, GetContactInfoState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetUserContactsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is GetUserContactsLoaded) {
              final data = state.data;
              
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
           
                  final contact = data[index].data() as Map<String, dynamic>?;
                  if (contact != null) {
                       final firstName = contact['FirstName'] ?? 'No Name';
                    final firstLetter = firstName.isNotEmpty ? firstName[0].toUpperCase() : 'N';
                        final avatarColor = _getRandomColor();
                    print(contact);

                  
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: avatarColor,
                          child: Text(
                            firstLetter,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        title: Text(firstName,style: TextStyle(color: AppColors.whiteColor,fontSize: 18),),
                      ),
                   );
                  } else {
                    return const ListTile(
                      title: Text("No Contact Data Available"),
                    );
                  }
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
