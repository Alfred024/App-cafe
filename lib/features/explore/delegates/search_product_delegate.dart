import 'package:flutter/material.dart';

class SearchProductDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios),
      onPressed: () {
        // TODO: Regresar a home screen
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Center(
      child: Text('Resultados de la búsqueda'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text('buildSuggestions'),
    );
  }
}
