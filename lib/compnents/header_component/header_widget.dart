import 'package:day2/compnents/header_component/searchDelegate.dart';
import 'package:flutter/material.dart';

import '../../model/contact.dart';
import '../../model/userModel.dart';

class HeaderWidget extends StatefulWidget {
  late List<UserModel> chatmodels;
  HeaderWidget({required this.chatmodels});
  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 35),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 20, // Adjust the width as needed
            ),
            Expanded(
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    TextField(
                      controller: messageController,onTap: (){
                      showSearch(
                        context: context,
                        delegate: ContactSearchDelegate(
                          contacts: widget.chatmodels,
                          onSearch: (searchTerm) => setState(() {
                            // _searchText = searchTerm;
                          }),
                        ),
                      );
                    },
                      decoration: InputDecoration(
                        hintText: '    Pay friends and merchants',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 20,),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      child: IconButton(
                        icon: Icon(Icons.search, color: Colors.black),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 20, // Adjust the width as needed
            ),
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://media.licdn.com/dms/image/D4D03AQFzyBj7ObrEbg/profile-displayphoto-shrink_400_400/0/1675567632102?e=1714608000&v=beta&t=HuuYtIoRk5rPXU4QivlcgjHbNCB_jNQqgpSGtQ8F5es"),
            ),
          ],
        ),
      ),
    );
  }
}
