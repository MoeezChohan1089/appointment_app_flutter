part of '../pages.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DoctorProvider>(
        builder: (BuildContext context, value, Widget? child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 56.0),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 64,
                          backgroundImage: (imageFile != null
                              ? FileImage(imageFile!)
                              : value.doctor!.profileUrl != "" &&
                                      imageFile == null
                                  ? NetworkImage(value.doctor!.profileUrl!)
                                  : null) as ImageProvider<Object>?,
                          child: imageFile != null ||
                                  value.doctor!.profileUrl != ""
                              ? null
                              : Center(
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 86,
                                  ),
                                ),
                        ),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 120,
                        child: CircleAvatar(
                          backgroundColor: AppTheme.dangerColor,
                          child: Center(
                              child: IconButton(
                            onPressed: () async {
                              final imgSource = await imgSourceDialog();

                              if (imgSource != null) {
                                await _pickImage(value.doctor, imgSource);
                              }
                            },
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                          )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    child: Card(
                      elevation: 4,
                      child: Row(
                        children: [
                          const SizedBox(width: 56),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name : ${value.doctor!.name}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Email : ${value.doctor!.email}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Phone Number : ${value.doctor!.phoneNumber}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 42),
                  Center(
                    child: MaterialButton(
                      onPressed: () async {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              EditDoctorProfile(doctor: value.doctor),
                        ));
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "Edit Profile",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      color: AppTheme.warningColor,
                      height: 40,
                      minWidth: 150,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: MaterialButton(
                      onPressed: () async {
                        try {
                          // Signout from FirebaseAuth
                          await FirebaseAuth.instance.signOut();

                          // Reloading the FirebaseAuth user, because sometime it stuck
                          await FirebaseAuth.instance.currentUser!.reload();

                          // Also call getUser again, for checking the FirebaseAuth with userChanges, which triggered when signOut()
                          // So it will be redirected to splash page again
                          await Provider.of<UserProvider>(context,
                                  listen: false)
                              .getUser(Provider.of<DoctorProvider>(context,
                                  listen: false));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Something went wrong"),
                            ),
                          );
                        }
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      color: AppTheme.dangerColor,
                      height: 40,
                      minWidth: 150,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  imgSourceDialog() async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Take Picture From"),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Ink(
                decoration: ShapeDecoration(
                  color: AppTheme.dangerColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.photo_camera, color: Colors.white),
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                ),
              ),
              Ink(
                decoration: ShapeDecoration(
                  color: AppTheme.dangerColor,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.photo, color: Colors.white),
                  onPressed: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel"),
            )
          ],
        );
      },
    );
  }

  _pickImage(Doctor? dokter, ImageSource imgSource) async {
    final pickedImage = await ImagePicker().pickImage(source: imgSource);

    imageFile = pickedImage != null ? File(pickedImage.path) : null;

    if (imageFile != null) {
      await _cropImage();
      await _updatePhotoProfile(dokter!);
    }
    return;
  }

  _cropImage() async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile!.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ],
    );
    if (croppedFile != null) {
      setState(() {
        imageFile = File(croppedFile.path);
      });
    }
  }

  _updatePhotoProfile(Doctor doctor) async {
    try {
      // Get file name
      String fileName = imageFile!.path.split("/").last;

      // Get firebase storage reference (Firebase Storage path)
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Photo Profile/${doctor.uid}/$fileName');

      // Save the image to firebase storage
      final dataImage = await ref.putFile(imageFile!);

      // Get the img url from firebase storage
      String imgUrl = await dataImage.ref.getDownloadURL();

      // Updating profile url
      await FirebaseFirestore.instance.doc("doctor/${doctor.uid}").update(
        {
          'profile_url': imgUrl,
        },
      );

      Doctor newData = doctor;
      newData.profileUrl = imgUrl;

      // Set the currentDoctor with new img Url, so its not neccesarry to get the data from Firestore
      Provider.of<DoctorProvider>(context, listen: false).setDoctor = newData;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }
}
