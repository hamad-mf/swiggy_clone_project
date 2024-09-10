import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:swiggy_clone_project/View/Add%20Address/add_address.dart';
import 'package:swiggy_clone_project/View/Global_widgets/common_button.dart';
import 'package:swiggy_clone_project/utils/constants/color_constants.dart';

class AddNewAdress extends StatefulWidget {
  const AddNewAdress({super.key});

  @override
  State<AddNewAdress> createState() => _AddNewAdressState();
}

class _AddNewAdressState extends State<AddNewAdress> {
  IconData? selectedIcon; // Holds the currently selected icon

  // List of icons to choose from
  final List<Map<String, dynamic>> icons = [
    {"icon": FontAwesomeIcons.house, "name": "Home"},
    {"icon": FontAwesomeIcons.building, "name": "Apartment"},
  ];

  TextEditingController adrsnamecontroller = TextEditingController();
  TextEditingController adrsdistrictcontroller = TextEditingController();
  TextEditingController adrslocalitycontroller = TextEditingController();
  TextEditingController adrslandmarkcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add your new adress",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              DropdownButton<IconData>(
                hint: const Text('Select type'),
                value: selectedIcon,
                items: icons.map((icon) {
                  return DropdownMenuItem<IconData>(
                    value: icon["icon"] as IconData,
                    child: Row(
                      children: [
                        Icon(icon["icon"] as IconData),
                        const SizedBox(width: 10),
                        Text(icon["name"]),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedIcon = value; // Update selected icon
                  });
                },
              ),
              SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: adrsnamecontroller,
                decoration: InputDecoration(
                    icon: Icon(Icons.map),
                    hintText: 'eg:home,office',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'Name of adress',
                    labelStyle: TextStyle(color: ColorConstants.primaryColor),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor))),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: adrsdistrictcontroller,
                decoration: InputDecoration(
                    icon: Icon(Icons.map_rounded),
                    hintText: 'Enter your district',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'District',
                    labelStyle: TextStyle(color: ColorConstants.primaryColor),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor))),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: adrslocalitycontroller,
                decoration: InputDecoration(
                    icon: Icon(Icons.map_sharp),
                    hintText: 'Enter your local place name',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'locality',
                    labelStyle: TextStyle(color: ColorConstants.primaryColor),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor))),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: adrslandmarkcontroller,
                decoration: InputDecoration(
                    icon: Icon(Icons.place),
                    hintText: 'eg:schools,hotels',
                    hintStyle: TextStyle(color: Colors.grey),
                    labelText: 'landmark',
                    labelStyle: TextStyle(color: ColorConstants.primaryColor),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: ColorConstants.primaryColor))),
                onSaved: (String? value) {},
                validator: (String? value) {
                  return (value != null && value.contains('@'))
                      ? 'Do not use the @ char.'
                      : null;
                },
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: CommonButton(
                      buttonText: "Save",
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddAddress(
                                    selectedIcon: selectedIcon,
                                    visible: true,
                                    adname: adrsnamecontroller.text,
                                    addistrict: adrsdistrictcontroller.text,
                                    adlandmark: adrslandmarkcontroller.text,
                                    adlocality: adrslocalitycontroller.text)));
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
