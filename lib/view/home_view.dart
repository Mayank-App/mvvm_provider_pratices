import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/view_model/get_view_model.dart';
import 'package:clean_formate/view_model/user_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget{
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final provider = Provider.of<GetViewModel>(context,listen: false );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(child: Icon(Icons.logout_outlined),
            onTap: () async {
              bool isLogout = await UserViewModel().removeUser();
              if(isLogout) Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (_)=> false);
            },),
          )
        ],
      ),
      body: Column(
        children: [
          Consumer<GetViewModel>(
              builder: (context,value,child){
                return  FutureBuilder(
                    future: value.userDetail(),
                    builder: (context,snapshot){
                      if(!snapshot.hasData){
                        return const Center(child: CircularProgressIndicator(color: Colors.black,));
                      }
                      else{
                        return Expanded(
                          child: ListView.builder(
                              itemCount: snapshot.data!.data.length,

                              itemBuilder: (context,index){
                                return ListTile(
                                  title: Text(snapshot.data!.data[index].firstName.toString()),
                                  leading: CircleAvatar(
                                    child: Image.network(snapshot.data!.data[index].avatar.toString()),
                                  ),
                                );
                              }),
                        );
                      }

                    });
              })


        ],
      ),
    );
  }
}