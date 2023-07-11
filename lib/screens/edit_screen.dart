import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nisipet/responsive/mobile_screen_layout.dart';
import 'package:nisipet/screens/profile_screen.dart';

import '../resources/auth_methods.dart';
import '../responsive/responsive_layout.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../widgets/post_card.dart';
import '../widgets/text_field_input.dart';
import 'login_screen.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({Key? key}) : super(key: key);

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  bool _isLoading = false;
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
  }

  void updateUser() async {
    // set loading to true
    /*setState(() {
      _isLoading = true;
    });*/

    // signup user using our authmethodds
    String res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);
    // if string returned is sucess, user has been created
    if (res == "success") {
      /*setState(() {
        _isLoading = false;
      });*/
      Fluttertoast.showToast(msg: "Account created successfully :) ");
      // navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    } else {
      /*setState(() {
        _isLoading = false;
      });*/
      // show the error
      showSnackBar(context, res);
    }
  }

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          /*onPressed: () {
            //Navigator.pop(context);
            Navigator.of(context).p
          },*/
          onPressed: () {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MobileScreenLayout()));
            Navigator.pop(context);
          },
          icon: Icon(
          Icons.arrow_back_ios,
          color: Color(0xFFffb247),
        ),
        ),
        title: Text(
          'Update Profile',
          style: TextStyle(
            color: Color(0xFFffb247),
          ),
        ),
        centerTitle: true,
      ),
      body: Material(
        child: Container(
          color: Colors.black,
          alignment: Alignment.center,
          /*decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0x66ffb247),
                      Color(0x99ffb247),
                    ]
                )
            ),*/
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                    radius: 64,
                    backgroundImage: MemoryImage(_image!),
                  )
                      : const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://i.stack.imgur.com/l60Hf.png'),
                    backgroundColor: Colors.grey,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 60,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo,color: Color(0xFFffb247)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldInput(
                hintText: 'Update username',
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldInput(
                hintText: 'Update email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldInput(
                hintText: 'Update password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(
                height: 14,
              ),
              TextFieldInput(
                hintText: 'Update bio',
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                    'Update',style: TextStyle(
                      color: Colors.black
                  ),
                  )
                      : const CircularProgressIndicator(
                    color: Colors.black,
                  ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    color: Color(0xFFffb247),
                  ),
                ),
                onTap: updateUser,
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
              SizedBox(height: 40,)
            ],
          ),
        ),
      ),
    );
  }
}






