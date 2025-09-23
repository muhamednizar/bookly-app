import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly_app/features/search/manager/search_books_cubit.dart';
import 'package:go_router/go_router.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, required this.controller});
  final TextEditingController controller;
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.search,
      onSubmitted: (value) {
        final query = value.trim();
        if (query.isNotEmpty) {
          BlocProvider.of<SearchBooksCubit>(context).searchBooks(query: query);
        }
      },
      decoration: InputDecoration(
        prefixIcon:  IconButton(
          onPressed: () {
            GoRouter.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      
        enabledBorder: buildOutlineInputBorder(),
        focusedBorder: buildOutlineInputBorder(),
        hintText: 'search',
        suffixIcon: IconButton(
          onPressed: () {
            final query = controller.text.trim();
            if (query.isNotEmpty) {
              BlocProvider.of<SearchBooksCubit>(context).searchBooks(query: query);
            }
          },
          icon: const Opacity(
              opacity: .7, child: Icon(FontAwesomeIcons.magnifyingGlass)),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(13));
  }
}
