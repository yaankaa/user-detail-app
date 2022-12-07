import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];
  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  fetchUser() async {
    //try {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final decodedResponse = jsonDecode(response.body) as List;
    final users = decodedResponse.map((e) => User.fromJson(e)).toList();
    //userList = users;
    setState(() {
      userList = users;
    });
    //   } catch (e) {
    //   log(e.toString());
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
            itemCount: userList.length,
            separatorBuilder: (context, index) => SizedBox(height: 20),
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userList[index].name),
                    Text(userList[index].address.street),
                    Text(userList[index].number),
                    Text(userList[index].email),
                  ],
                ),
              );
            }));
  }
}
