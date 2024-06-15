import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  SearchTextField({super.key});

  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search_outlined),
            hintText: 'What are you looking for ?',
            border: OutlineInputBorder()),
        onChanged: (value) {},
        onFieldSubmitted: (value) {},
      ),
    );
  }
}
