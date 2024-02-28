import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';




final AddVoterController addVoterController = Get.find<AddVoterController>();


class AddVoterController extends GetxController {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController voterIdController = TextEditingController();
  final TextEditingController religionController = TextEditingController();
  final TextEditingController casteController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();
  final TextEditingController aadhaarNoController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController1 = TextEditingController();
  final TextEditingController otpController2 = TextEditingController();
  final TextEditingController otpController3 = TextEditingController();
  final TextEditingController otpController4 = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController otherConcernsController = TextEditingController();
  final TextEditingController wardController = TextEditingController();
  final TextEditingController boothController = TextEditingController();


  final RxString imagePath = ''.obs;
  var selectedBox = 1.obs;
  RxString selectedWard = ''.obs;
  RxBool isWardSelected = false.obs;
  RxString selectedBooth = ''.obs;
  RxString selectedABCSupporter = ''.obs;
  var selectedVoteForABC = ''.obs;

  final RxString capturedImagePath = RxString('');

  Future<void> pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      capturedImagePath.value = photo.path;
      print("You've captured a photo: ${photo.path}");
    }
  }

  @override
  void onClose() {
    wardController.dispose();
    fullNameController.dispose();
    ageController.dispose();
    voterIdController.dispose();
    religionController.dispose();
    casteController.dispose();
    occupationController.dispose();
    aadhaarNoController.dispose();
    phoneController.dispose();
    otpController1.dispose();
    otpController2.dispose();
    otpController3.dispose();
    otpController4.dispose();
    addressController.dispose();
    otherConcernsController.dispose();
    boothController.dispose();
    super.onClose();
  }

  void saveVoterDetails() {
    final String fullName = fullNameController.text;
    final String age = ageController.text;
    final String voterId = voterIdController.text;
    final String religion = religionController.text;
    final String caste = casteController.text;
    final String occupation = occupationController.text;
    final String aadhaarNo = aadhaarNoController.text;
    final String phone = phoneController.text;
    final String imagePathValue = imagePath.value;
    final String address = addressController.text;
    final String otherConcerns = otherConcernsController.text;
    final String booth = selectedBooth.value;
    final String ward = selectedWard.value;

    print("Voter Details: Full Name: $fullName, Age: $age, Voter ID: $voterId, Religion:"
        " $religion, Caste: $caste, Occupation: $occupation, Aadhaar No.: $aadhaarNo, Phone: $phone, "
        "Address: $address, Other Concerns: $otherConcerns, Image Path: $imagePathValue,Ward:$ward,"
        "Booth:$booth");

    print("Voter details saved");
  }

  void updateImagePath(String newPath) {
    imagePath.value = newPath;
    update();
  }

  void requestOtp() {
    print("OTP request made");
  }

  void selectBox(int value) {
    selectedBox.value = value;
  }

  String getSelectedOption() {
    return selectedBox.value == 1 ? "Yes" : "No";
  }

  void saveSelectedOption() {
    String selectedOption = getSelectedOption();
    print("Selected Option: $selectedOption");
  }

  var isActiveStep1 = false.obs;
  var isActiveStep2 = false.obs;
  var isActiveStep3 = false.obs;

  void activateStep(int step) {
    if (step == 1) {
      isActiveStep1.value = true;
      isActiveStep2.value = false;
      isActiveStep3.value = false;
    } else if (step == 2) {
      isActiveStep1.value = false;
      isActiveStep2.value = true;
      isActiveStep3.value = false;
    } else if (step == 3) {
      isActiveStep1.value = false;
      isActiveStep2.value = false;
      isActiveStep3.value = true;
    }
    update();
  }

  var concerns = {
    "Sanitation": false,
    "Schools": false,
    "Surveillance": false,
    "Public Transport": false,
    "Parks": false,
    "Roads": false,
  }.obs;

  void toggleConcern(String concern) {
    concerns[concern] = !(concerns[concern] ?? false);
    concerns.refresh();
  }

  List<String> getSelectedConcerns() {
    return concerns.entries.where((entry) => entry.value).map((entry) => entry.key).toList();
  }

  void saveSelectedConcernsAndOther() {
    List<String> selectedConcerns = getSelectedConcerns();
    String otherConcerns = otherConcernsController.text;
    print("Selected Concerns: $selectedConcerns");
    print("Other Concerns: $otherConcerns");

  }

  // Method to update the selected ward
  void updateSelectedWard(String? newWard) {
    if (newWard != null && newWard.isNotEmpty) {
      selectedWard.value = newWard;
      isWardSelected.value = true;
    } else {
      isWardSelected.value = false;
    }
    update();
  }

  String getSelectedWard() {
    return selectedWard.value;
  }

  //booth
  void setSelectedBooth(String? booth) {
    if(booth != null) {
      selectedBooth.value = booth;

      boothController.text = booth;
    }
  }
  //abs supporter
  void setSelectedABCSupporter(String option) {
    selectedABCSupporter.value = option;
  }
  // Method to update this selection
  void setSelectedVoteForABC(String option) {
    selectedVoteForABC.value = option;
  }

}



//widget for headings  of form
class HeadingText extends StatelessWidget {
  final String text;
  final Color color;

  const HeadingText({
    Key? key,
    required this.text,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      style: TextStyle(
        fontSize: 14.sp, // Responsive font size
        fontWeight: FontWeight.w500, // Medium weight
        fontFamily: 'Montserrat', // Montserrat font
        color: color, // Text color
      ),
      maxLines: 1,
    );
  }
}
