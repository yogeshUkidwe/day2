import 'package:day2/model/contact.dart';
import 'package:day2/model/userModel.dart';
import 'package:flutter/material.dart';



class ContactSearchDelegate extends SearchDelegate {
  final List<UserModel> contacts;

  ContactSearchDelegate(
      {required this.contacts,
        required void Function(dynamic searchTerm) onSearch});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final filteredProducts = contacts
        .where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.imgUrl),
          ),
          title: Text(product.name),
          subtitle: Text(
            "${product.upiId}",
            style: TextStyle(color: Colors.black54),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => ProductDetailsScreen(product: product),
            //   ),
            // );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredProducts = query.isEmpty
        ? contacts
        : contacts
        .where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(product.imgUrl),
          ),
          title: Text(product.name),
          subtitle: Text(
            "${product.upiId}",
            style: TextStyle(color: Colors.black54),
          ),
          onTap: () {
            query = product.name;
            showResults(context);
          },
        );
      },
    );
  }
}
