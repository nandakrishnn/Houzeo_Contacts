import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/animations/route.dart';
import 'package:houzeocontacts/constants/colors.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:houzeocontacts/view/home/add_favourite/add_fav_bloc/favourites_add_bloc.dart';
import 'package:houzeocontacts/view/home/add_favourite/get_favourite/bloc/get_favourites_bloc.dart';
import 'package:houzeocontacts/view/home/view_contact.dart';


class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    Color getRandomColor() {
  Random random = Random();
  

  int red = random.nextInt(128) + 127; 
  int green = random.nextInt(128) + 127;
  int blue = random.nextInt(128) + 127; 
  
  return Color.fromARGB(255, red, green, blue);
}
    return  Scaffold(
      backgroundColor: AppColors.colorGray,
       appBar: AppBar(
        centerTitle: true,
        title: const Text('Favourite List',style: TextStyle(color: AppColors.whiteColor),),
      backgroundColor: AppColors.colorGray,
      ),
    body: BlocProvider(
        create: (context) =>
            GetFavouritesBloc(ContactServices())..add(FetchDataContact()),
        child: BlocConsumer<GetFavouritesBloc, GetFavouritesState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is GetUserContactsLoading) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state is GetUserContactsLoaded) {
              if(state.data.isEmpty){
                return const Center(child: Text('No Favourites',style: TextStyle(color: Colors.white),),);
              }
              final data = state.data;
               data.sort((a, b) {
                final contactA = a.data() as Map<String, dynamic>?;
                final contactB = b.data() as Map<String, dynamic>?;
                final nameA = (contactA?['FirstName'] ?? '') as String;
                final nameB = (contactB?['FirstName'] ?? '') as String;
                return nameA.compareTo(nameB);
              });
              
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
           
                  final contact = data[index].data() as Map<String, dynamic>?;
                  if (contact != null) {
                       final firstName = contact['FirstName'] ?? 'No Name';
                    final firstLetter = firstName.isNotEmpty ? firstName[0].toUpperCase() : 'N';
                        final avatarColor = getRandomColor();
                

                  
                   return Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: ListTile(
                      onTap: (){
                        
                        Navigator.of(context).push(createRoute(ContactDeatils(data:contact,avatarColor: avatarColor,firstLetter: firstLetter,)));
                      },
                        leading: CircleAvatar(
                          radius: 25,
                          backgroundColor: avatarColor,
                          child: Text(
                            firstLetter,
                            style: const TextStyle(
                            fontSize: 22,
                              color: Colors.black,
                             
                            ),
                          ),
                          
                        ),
                        trailing: IconButton(
                        onPressed: (){
                            context.read<FavouritesAddBloc>().add(
                                  FavUnsave(data[index]['Id'],
                            ));
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30,
                        )),
                        title: Text(firstName,style:const TextStyle(color: AppColors.whiteColor,fontSize: 18),),
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