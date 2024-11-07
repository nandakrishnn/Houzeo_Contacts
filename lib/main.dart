import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:houzeocontacts/bottom_navigation/bottom_nav.dart';
import 'package:houzeocontacts/firebase_options.dart';
import 'package:houzeocontacts/services/contact_services.dart';
import 'package:houzeocontacts/view/add_contact/add_contact_bloc/add_contact_bloc.dart';
import 'package:houzeocontacts/view/home/add_favourite/add_fav_bloc/favourites_add_bloc.dart';
import 'package:houzeocontacts/view/home/add_favourite/get_favourite/bloc/get_favourites_bloc.dart';
import 'package:houzeocontacts/view/home/get_contact_bloc/get_contact_info_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
          BlocProvider(
          create: (context) =>AddContactBloc(ContactServices())
       
        ),
        BlocProvider(
          create: (context) => GetContactInfoBloc(ContactServices()),
       
        ),
        BlocProvider(
          create: (context) => FavouritesAddBloc(ContactServices()),
          child: Container(),
        ),
        BlocProvider(
          create: (context) => GetFavouritesBloc(ContactServices()),
          child: Container(),
        )
      ],
    
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomNavigation(),
      ),
    );
  }
}
