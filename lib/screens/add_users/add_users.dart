import 'package:ecom_app/bloc/add_users/add_users_bloc.dart';
import 'package:ecom_app/bloc/add_users/add_users_event.dart';
import 'package:ecom_app/common/form_field.dart';
import 'package:ecom_app/common/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/add_users/add_users_state.dart';
import '../../styles/colors.dart';
import '../../utils/utils.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);

  @override
  State<AddUsers> createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 150.0),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return BlocProvider(
                  create: (context) => AddUserBloc(),
                  child: BlocBuilder<AddUserBloc, AddUserState>(
                    builder: (context, state) {
                      if (state is AddUserErrorState) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Error !!'),
                                content: const Padding(
                                  padding: EdgeInsets.only(left: 15.0),
                                  child: Text('Unable to post'),
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 10.0),
                                buttonPadding:
                                    const EdgeInsets.only(bottom: 10.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: primary, fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        });
                      }
                      if (state is AddUserLoadedState) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const AddUsers()),
                          );
                        });
                        Utils.toastMessage('Sucessfully posted user!!!');
                      }
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(18, 50, 18, 18),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              FormFieldWidgets(
                                hintText: 'User Name',
                                labelText: 'User Name',
                                onChanged: (value) {
                                  setState(() {
                                    nameController.text = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter the name';
                                  } else {
                                    return null;
                                  }
                                },
                                visibleText: false,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              FormFieldWidgets(
                                hintText: 'Job name',
                                labelText: 'Job name',
                                onChanged: (value) {
                                  setState(() {
                                    jobController.text = value;
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter job name';
                                  } else {
                                    return null;
                                  }
                                },
                                visibleText: false,
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              PrimaryButton(
                                inputText: 'Submit',
                                height: 40,
                                width: 100,
                                radius: 10,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    context.read<AddUserBloc>().add(
                                          SubmitButtonClickedEvent(
                                            nameController.text,
                                            jobController.text,
                                          ),
                                        );
                                  }
                                },
                              ),
                              // if (state is AddUserErrorState)
                              //   Padding(
                              //     padding: const EdgeInsets.only(top: 20.0),
                              //     child: Text(
                              //       'Error: Unable to post user',
                              //       style: TextStyle(
                              //         color: primary,
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                              // if (state is AddUserLoadedState)
                              //   Padding(
                              //     padding: const EdgeInsets.only(top: 20.0),
                              //     child: Text(
                              //       'Successfully posted user!!!',
                              //       style: TextStyle(
                              //         color: primary,
                              //         fontSize: 16,
                              //       ),
                              //     ),
                              //   ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
