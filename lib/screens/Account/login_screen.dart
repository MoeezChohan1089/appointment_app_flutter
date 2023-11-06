import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pms/provider/main_provider.dart';
import 'package:pms/screens/HomePage/home_page.dart';
import 'package:pms/services/auth_services.dart';
import 'package:pms/utilites/constants.dart';
import 'package:pms/utilites/helper.dart';
import 'package:pms/utilites/validator.dart';
import 'package:pms/widgets/custom_button.dart';
import 'package:pms/widgets/custom_parent_widget.dart';
import 'package:pms/widgets/custom_text.dart';
import 'package:pms/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);
   final emailController = TextEditingController();
   final passwordController = TextEditingController();
   final securityController = TextEditingController();
   final formKey = GlobalKey<FormState>();

   submit(BuildContext context)async{
     if (formKey.currentState!.validate()) {
       Provider.of<MainProvider>(context, listen: false).changeIsLoading(true);
       var result = await AuthServices.login(
         email: emailController.text.toString(),
         password: passwordController.text.toString(),
       );
       if (result == "User Login successfully!"){
         Provider.of<MainProvider>(context,
             listen: false).changeIsLoading(false);
           Helper.showSnack(context, "Login Successfully");
           Helper.toRemoveUntiScreen(context, const HomePage());
       }else {
         Provider.of<MainProvider>(context, listen: false).changeIsLoading(false);
         Helper.showSnack(context, "Invalid User");
       }
     }
   }
  @override
  Widget build(BuildContext context) {
    return CustomParentWidget(
      child: ModalProgressHUD(
        inAsyncCall: Provider.of<MainProvider>(context).isLoading,
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Space
                  const SizedBox(height: 80,),
                  //Welcome Administrator
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.center,
                    child: const CustomText(
                      title: "Welcome Administrator",
                      fontSize: 22,
                      color: blackColor,
                    ),
                  ),
                  //Space
                 const SizedBox(height: 8,),
                  //login...
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 18),
                    alignment: Alignment.center,
                    child: const CustomText(
                      title: "Login and manage records",
                      fontSize: 15,
                      color: lightBlueColor,
                    ),
                  ),
                  //Space
                 const SizedBox(height: 80,),
                  //Username or Email
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          title: "Username or Email",
                          fontSize: 16,
                          color: darkBlueColor,
                        ),
                        //Space
                       const SizedBox(height: 5,),
                        CustomTextField(
                          controller: emailController,
                          keyboardType: TextInputType.text,
                          onChanged: () {},
                          validation: emailField,
                          fieldborderRadius: 5,
                          textFieldFillColor: whiteColor,
                          isOutlineInputBorderColor: greyColor,
                          isOutlineInputBorder: true,
                          suffixIcon: Image.asset("assets/icons/ic_email.png",scale: 2.3,),
                        ),
                      ],
                    ),
                  ),
                  //Space
                 const SizedBox(height: 10,),
                  //Password
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CustomText(
                          title: "Password",
                          fontSize: 16,
                          color: darkBlueColor,
                        ),
                        //Space
                       const SizedBox(height: 5,),
                        CustomTextField(
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          onChanged: () {},
                          validation: validatePassword,
                          fieldborderRadius: 5,
                          textFieldFillColor: whiteColor,
                          isOutlineInputBorder: true,
                          isOutlineInputBorderColor: greyColor,
                          suffixIcon: Image.asset("assets/icons/ic_eye.png",scale: 2.3,),
                        ),
                      ],
                    ),
                  ),
                  // //Space
                  //const SizedBox(height: 10,),
                  // //Security Key
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       CustomText(
                  //         title: "Security Key",
                  //         fontSize: 16,
                  //         color: darkBlueColor,
                  //       ),
                  //       //Space
                  //      const SizedBox(height: 5,),
                  //       CustomTextField(
                  //         controller: passwordController,
                  //         keyboardType: TextInputType.visiblePassword,
                  //         onChanged: () {},
                  //         fieldborderRadius: 5,
                  //         textFieldFillColor: whiteColor,
                  //         fieldborderColor: greyColor,
                  //         suffixIcon: Image.asset("assets/icons/ic_key.png",scale: 2.3,),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    padding:const EdgeInsets.only(left: 6,right: 18),
                    child: Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: Checkbox(
                              value: true,
                              onChanged: (_){},
                          ),
                        ),
                        const Expanded(
                            child: CustomText(
                              title: "Remember Me",
                              fontSize: 15,
                              color: greyColor,
                            ))
                      ],
                    ),
                  ),
                  //Space
                 const SizedBox(height: 10,),
                  Container(
                    padding:const EdgeInsets.symmetric(horizontal: 18),
                    child: CustomButton(
                      onPressed: () {
                        //   Helper.toScreen(context, HomePage());
                        submit(context);
                      },
                      btnHeight: 48,
                      btnRadius: 8,
                      title: "Login",
                      fontWeight: FontWeight.w600,
                      btnColor: kPrimaryColor,
                      textColor: whiteColor,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
