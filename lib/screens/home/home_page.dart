import 'package:ecom_app/bloc/users/user_event.dart';
import 'package:ecom_app/screens/add_users/add_users.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/users/user_bloc.dart';
import '../../bloc/users/user_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(UserListEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                    return const AddUsers();
                  }));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return const Center(
                  child: Center(
                child: CircularProgressIndicator(),
              ));
            }
            if (state is UserLoadedState) {
              List usersList = state.users;
              return ListView.builder(
                  itemCount: usersList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: const Color.fromARGB(255, 243, 222, 160),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(
                            usersList[index]['first_name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            usersList[index]['last_name'],
                            style: const TextStyle(color: Colors.white),
                          ),
                          trailing: CircleAvatar(
                            backgroundImage:
                                NetworkImage(usersList[index]['avatar']),
                          ),
                        ),
                      ),
                    );
                  });
            }
            if (state is UserErrorState) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const Text('');
            }
          },
        ),
      ),
    );
  }
}
