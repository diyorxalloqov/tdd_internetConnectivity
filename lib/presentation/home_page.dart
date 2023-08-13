import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd/application/bloc/user_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(title: const Text("user app")),
            body: Builder(builder: (context) {
              if (state is UserLoadingState) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is UserErrorState) {
                return Center(
                  child: Text(state.errorMessage),
                );
              } else if (state is UserCompleteState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.users![index].name.toString()),
                      subtitle: Text(state.users![index].email.toString()),
                    );
                  },
                  itemCount: state.users!.length,
                );
              } else {
                return const SizedBox.shrink();
              }
            }));
      },
    );
  }
}
