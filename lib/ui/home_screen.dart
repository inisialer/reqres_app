// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:regres_app/bloc/auth/auth_bloc.dart';
import 'package:regres_app/bloc/users/users_bloc.dart';
import 'package:regres_app/helper/router_name.dart';
import 'package:regres_app/ui/widget/main_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UsersBloc _usersBloc = UsersBloc();
  final UsersBloc _usersDeleteBloc = UsersBloc();
  final AuthBloc _authBloc = AuthBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _usersBloc.add(GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          BlocConsumer<AuthBloc, AuthState>(
            bloc: _authBloc,
            listener: (context, state) {
              if (state is PostLogoutSuccess) {
                context.pushNamed(login);
              }
              // TODO: implement listener
            },
            builder: (context, state) {
              return IconButton(
                  onPressed: () {
                    _authBloc.add(PostLogoutEvent());
                  },
                  icon: const Icon(Icons.logout));
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              BlocBuilder<UsersBloc, UsersState>(
                bloc: _usersBloc,
                builder: (context, state) {
                  if (state is GetUsersSuccess) {
                    return ListView.builder(
                      itemCount: state.data.data?.length,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              backgroundImage: NetworkImage(
                                state.data.data?[index].avatar ?? '',
                              ),
                            ),
                            title: Text(
                                '${state.data.data?[index].firstName ?? ''} ${state.data.data?[index].lastName ?? ''}'),
                            subtitle: Text(state.data.data?[index].email ?? ''),
                            trailing: IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text(
                                            'Apakah anda yakin ingin menghapus data ini?'),
                                        content: Row(
                                          children: [
                                            Expanded(
                                                child: MainButton(
                                              title: 'Tidak',
                                              onPressed: () {
                                                context.pop();
                                              },
                                            )),
                                            const SizedBox(
                                              width: 16.0,
                                            ),
                                            Expanded(
                                                child: BlocConsumer<UsersBloc,
                                                    UsersState>(
                                              bloc: _usersDeleteBloc,
                                              listener: (context, state) {
                                                if (state
                                                    is DeleteUsersSuccess) {
                                                  context.pop();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Berhasil hapus data')),
                                                  );
                                                  _usersBloc
                                                      .add(GetUsersEvent());
                                                } else if (state
                                                    is DeleteUsersError) {
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    const SnackBar(
                                                        content: Text(
                                                            'Gagal hapus data')),
                                                  );
                                                }
                                                // TODO: implement listener
                                              },
                                              builder: (context, stateDelete) {
                                                return MainButton(
                                                  title: stateDelete
                                                          is DeleteUsersLoading
                                                      ? 'Loading...'
                                                      : 'Ya',
                                                  onPressed: stateDelete
                                                          is DeleteUsersLoading
                                                      ? null
                                                      : () {
                                                          _usersDeleteBloc.add(
                                                              DeleteUsersEvent(state
                                                                  .data
                                                                  .data![index]
                                                                  .id
                                                                  .toString()));
                                                        },
                                                );
                                              },
                                            )),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.delete)),
                          ),
                        );
                      },
                    );
                  } else if (state is GetUsersError) {
                    return MainButton(
                      title: 'Coba Lagi',
                      onPressed: () {
                        _usersBloc.add(GetUsersEvent());
                      },
                    );
                  } else {
                    return const Center(child: RefreshProgressIndicator());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
