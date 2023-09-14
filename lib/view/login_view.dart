 import 'package:clean_formate/res/components/round_button.dart';
import 'package:clean_formate/utils/routes/routes_name.dart';
import 'package:clean_formate/utils/utils.dart';
import 'package:clean_formate/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
 import 'package:provider/provider.dart';

class LoginView extends StatefulWidget{
  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> obscurePassword= ValueNotifier<bool>(true);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    return  Scaffold(
      appBar: AppBar(
        title: Text("Login",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.purple,
      ),
     body:  SafeArea(
       child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 15),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [

                 TextFormField(
                   controller: emailController,
                   focusNode: emailFocus,
                   onFieldSubmitted: (value){
                     Utils.fieldFocusNode(context, emailFocus,passwordFocus);
                   },
                   decoration: InputDecoration(
                     hintText: "Email",
                     prefixIcon: Icon(Icons.mail_lock),
                     labelText: "Email",
                     border: OutlineInputBorder()
                   ),
                 ),
             SizedBox(height: 25,),
             ValueListenableBuilder(valueListenable: obscurePassword,
                 builder: (context,value, child){
               return  TextFormField(
                 controller: passwordController,
                 obscureText: obscurePassword.value,
                 focusNode: passwordFocus,
                 onFieldSubmitted: (value){
                   Utils.fieldFocusNode(context, passwordFocus, emailFocus);
                 },
                 decoration: InputDecoration(
                   hintText: "Password",
                   prefixIcon: Icon(Icons.lock),
                   suffixIcon: InkWell(
                     onTap: (){
                       obscurePassword.value =! obscurePassword.value;

                     },
                       child: Icon(Icons.change_circle)),
                   labelText: "Password",
                   border: OutlineInputBorder(),
                 ),
               );
                 }
             ),
             SizedBox(height: 25,),
             RoundButton(text: "LOGIN",loading: authViewModel.loading, onPress: () async {
               authViewModel.setLoading(true);
                if(emailController.text.toString().trim().isEmpty){
                  //Utils.snakBar("GGHVGG", context);
                  Utils.toastMessage("Enter Email");
                  // authViewModel.setLoading(false);
                }
                else if(passwordController.text.toString().trim().isEmpty){
                  Utils.toastMessage("Enter Password");
               // authViewModel.setLoading(false);
                }
                else if(passwordController.text.toString().trim().length <6 ){
                  Utils.toastMessage("Enter password Atlest 6 Digit");
                 // authViewModel.setLoading(false);
                }
                else{
                  Map data={
                    "email":emailController.text.toString().trim(),
                    "password":passwordController.text.toString().trim()
                  };
                  authViewModel.loginApi(data,context);
                  print("Api Hit");
                //  Utils.toastMessage("Api Hit");
                }
                await Future.delayed(Duration(seconds: 1));
               authViewModel.setLoading(false);


             }),
             SizedBox(height:  20,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text("Don't have an account?" ),
                   TextButton(onPressed:(){
                     Navigator.pushNamed(context, RoutesName.signUp);
                   },
                   child: Text("SignUp",style: TextStyle(color: Colors.blue),),)

               ],
             )],
         ),
       ),
     ),

    );
  }
}