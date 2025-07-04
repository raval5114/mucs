import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mucs/Data/blocs/homescreen/homepage/bloc/homescreen_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:mucs/Views/home_screen/shared/about_us_section.dart';
import 'package:mucs/Views/home_screen/shared/blog_section.dart';
import 'package:mucs/Views/home_screen/shared/clients_section.dart';
import 'package:mucs/Views/home_screen/shared/contact_us_section.dart';
import 'package:mucs/Views/home_screen/shared/footer_section.dart';
import 'package:mucs/Views/home_screen/shared/hero_section.dart';
import 'package:mucs/Views/home_screen/shared/services_seaction.dart';

class HomeScreenComponent extends StatefulWidget {
  const HomeScreenComponent({super.key});

  @override
  State<HomeScreenComponent> createState() => HomeScreenComponentState();
}

class HomeScreenComponentState extends State<HomeScreenComponent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomescreenBloc>().add(HomeScreenInitialEvent());
  }

  final ItemScrollController _scrollController = ItemScrollController();

  final List<Widget> _sections = [
    HeroSection(), // index 0
    AboutUsSection(), // index 1
    Container(
      margin: EdgeInsets.only(top: 30.0),
      child: ServicesSection(),
    ), // index 2
    ClientsSection(), // index 3
    BlogsSection(), // index 4
    ContactUsSection(), // index 5
    FooterSection(), // index 6
  ];

  void scrollToSection(int index) {
    _scrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [colorScheme.primary, colorScheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: ScrollablePositionedList.builder(
        itemScrollController: _scrollController,
        itemCount: _sections.length,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              bottom: index == _sections.length - 1 ? 48 : 32,
            ),
            child: _sections[index],
          );
        },
      ),
    );
  }
}
