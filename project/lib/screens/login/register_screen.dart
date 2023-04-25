import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:validators/validators.dart';
import 'package:image_picker/image_picker.dart';

enum ProductTypeEnum { Male, Female }

class signUpScreen extends StatefulWidget {
  const signUpScreen({Key? key}) : super(key: key);

  @override
  State<signUpScreen> createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _textarea = TextEditingController();
  final _productDesController = TextEditingController();

  File? image;
  File? image1;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTamporary = File(image.path);
      setState(() => this.image = imageTamporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImage1(ImageSource source) async {
    try {
      final image1 = await ImagePicker().pickImage(source: source);
      if (image1 == null) return;
      final imageTamporary = File(image1.path);
      setState(() => this.image1 = imageTamporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  // final ImagePicker imagePicker = ImagePicker();

  // List<XFile>? imageFileList = [];

  // void selectedImages() async {
  //   final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
  //   if (selectedImages!.isNotEmpty) {
  //     imageFileList!.addAll(selectedImages);
  //   }
  //   setState(() {});
  // }

  bool? _topProduct = false;
  bool isEmailCorrect = false;
  ProductTypeEnum? _productTypeEnum;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textEditingController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // color: Colors.red.withOpacity(0.1),
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-photo/natural-elements-spa-with-candles_23-2148199460.jpg?w=740&t=st=1682260638~exp=1682261238~hmac=de408688e5fb343eda755abd41604823458244d924232395096cb3d5c0b70b35'),
                fit: BoxFit.cover,
                opacity: 0.7)),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets2.lottiefiles.com/packages/lf20_wd1udlcz.json',
                      animate: true,
                      height: 120,
                      width: 600),
                  //   logo here
                  //   Image.asset(
                  //     'assets/images/logo_new.png',
                  //     height: 120,
                  //     width: 120,
                  //   ),
                  Text(
                    'Register',
                    style: GoogleFonts.chakraPetch(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: _textEditingController,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Username",
                              hintText: 'Username',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            // controller: _textEditingController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.key,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Password",
                              hintText: 'Password',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            // controller: _textEditingController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Name",
                              hintText: 'Name',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            // controller: _textEditingController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Phone",
                              hintText: 'Phone',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        //RadioList Chosse
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<ProductTypeEnum>(
                                  value: ProductTypeEnum.Male,
                                  groupValue: _productTypeEnum,
                                  activeColor:
                                      Color.fromARGB(255, 197, 90, 216),
                                  contentPadding: EdgeInsets.all(0.0),
                                  tileColor: Colors.deepPurple.shade300,
                                  title: Text(
                                    ProductTypeEnum.Male.name,
                                    style: TextStyle(color: Colors.purple),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  }),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: RadioListTile<ProductTypeEnum>(
                                  value: ProductTypeEnum.Female,
                                  groupValue: _productTypeEnum,
                                  activeColor:
                                      Color.fromARGB(255, 197, 90, 216),
                                  contentPadding: EdgeInsets.all(0.0),
                                  tileColor: Colors.deepPurple.shade300,
                                  title: Text(ProductTypeEnum.Female.name,
                                      style: TextStyle(color: Colors.purple)),
                                  onChanged: (val) {
                                    setState(() {
                                      _productTypeEnum = val;
                                    });
                                  }),
                            ),
                          ],
                        ),
                        //Input E-Mail
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            // controller: _textEditingController,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.purple,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "E-Mail",
                              hintText: 'e-Mail',
                              labelStyle: TextStyle(color: Colors.purple),
                            ),
                          ),
                        ),
                        //Text Area Address
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20),
                          child: TextFormField(
                            controller: _textarea,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            maxLength: 200,
                            decoration: const InputDecoration(
                                hintText: "Write Your Address",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.redAccent)),
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        //PickImage Certificate
                        image != null
                            ? Image.file(
                                image!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                width: 250,
                                height: 250,
                                fit: BoxFit.fill,
                              ),
                        CertiButton(
                            title: 'Certificate',
                            icon: Icons.image_outlined,
                            onClick: () => pickImage(ImageSource.gallery)),
                        //PickImage ID-Card
                        image1 != null
                            ? Image.file(
                                image1!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                                width: 250,
                                height: 250,
                                fit: BoxFit.fill,
                              ),
                        IdcardButton(
                            title: 'ID-Card',
                            icon: Icons.image_outlined,
                            onClick: () => pickImage1(ImageSource.gallery)),

                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: GridView.builder(
                        //         itemCount: imageFileList!.length,
                        //         gridDelegate:
                        //             SliverGridDelegateWithFixedCrossAxisCount(
                        //                 crossAxisCount: 3),
                        //         itemBuilder: (BuildContext context, index) {
                        //           return Image.file(
                        //             File(imageFileList![index].path),
                        //             fit: BoxFit.cover,
                        //           );
                        //         }),
                        //   ),
                        // ),

                        Row(
                          children: [
                            Expanded(
                                child: ConfirmButton(
                                    title: 'Submit',
                                    icon: Icons.check_box_outlined,
                                    onClick: () => {})),
                            SizedBox(
                              width: 100,
                            ),
                            Expanded(
                                child: CancelButton(
                                    title: 'Cancel',
                                    icon: Icons.cancel_outlined,
                                    onClick: () => {}))
                          ],
                        )
                      ],
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

Widget ConfirmButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(Icons.check_box_outlined),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ]),
      ));
}

Widget CancelButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(Icons.cancel_outlined),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ]),
      ));
}

Widget CertiButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(Icons.upload_file),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ]),
      ));
}

Widget IdcardButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
      width: 280,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(Icons.upload_file),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ]),
      ));
}
