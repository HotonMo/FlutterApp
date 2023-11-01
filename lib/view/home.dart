import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_1/controller/data_provider.dart';
import '../model/user.dart';
import 'package:flutter/material.dart';


class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context , ref) {
   final _data = ref.watch(userDataProvider);
    return Scaffold(
      appBar: AppBar(
      title : const Text("Users information")
      ),
      body: _data.when(data: (_data){
        List<UserModel> userList = _data.map((e) => e).toList();
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
            Expanded(
          child: RefreshIndicator(
              onRefresh: () async{
        ref.refresh(userDataProvider);
        }, child: ListView.builder(
          itemCount: userList.length,
          itemBuilder: (_,index){
            return Card(
              color: Colors.blue,
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
               leading: Icon(
               Icons.account_circle,
               color: Colors.grey,
               size: 40.0,
                ),
                title: Text(userList[index].name, style: const TextStyle(
               color: Colors.white, fontWeight: FontWeight.bold
                )),
                subtitle: Column(

                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child : Text(userList[index].email, style: const TextStyle(
                            color: Colors.white )),
                    ),

                Align(
                  alignment: Alignment.centerLeft,
                  child : Text(userList[index].phone, style: const TextStyle(
                       color: Colors.white)),
                ),
                  ],
                ),
              ),
            );

            }))
            )],
          ),
        );
      },
          error: (err,s) => Text(err.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
