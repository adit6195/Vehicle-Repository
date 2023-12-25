import 'package:flutter/material.dart';
import 'package:lyqik/object.dart';

class VehicleRegistration extends StatefulWidget {
  const VehicleRegistration({super.key});

  @override
  State<VehicleRegistration> createState() => _VehicleRegistrationState();
}

class _VehicleRegistrationState extends State<VehicleRegistration> {
  TextEditingController _numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _vehicleType = ["--Select Type", "Bike", "Car"];
  String? _selectedType = "";
  final _fuelType = ["--Select Fuel", "Petrol", "Diesel"];
  String? _selectedFuel = "";
  final _brandType = ["--Select Brand", "TVS", "Honda", "Hero"];
  String? _selectedBrand = "";
  List<Vehicle> vehicleList = [];

  @override
  void initState() {
    super.initState();
    _selectedType = _vehicleType[0];
    _selectedFuel = _fuelType[0];
    _selectedBrand = _brandType[0];
  }

  // String brand = "TVS";
  // List<String> dropdownbrand = [
  //   // {"title": "--Select Brand--", "value": "1"},
  //   // {"title": "TVS", "value": "2"},
  //   // {"title": "Honda", "value": "3"},
  //   // {"title": "Hero", "value": "4"},
  //   // {"title": "Hyundai", "value": "5"},
  //   // {"title": "Maruti Shizuki", "value": "6"},
  //   "TVS", "Honda", "Hero"
  // ];
  // List dropdownfuel = [
  //   {"title": "--Select Fuel--", "value": "1"},
  //   {"title": "Petrol", "value": "2"},
  //   {"title": "Diesel", "value": "3"},
  // ];
  // List dropdowntype = [
  //   {"title": "--Select Type--", "value": "1"},
  //   {"title": "Bike", "value": "2"},
  //   {"title": "Car", "value": "3"},
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.deepPurple,
        // surfaceTintColor: Colors.,
        backgroundColor: Colors.deepPurple,
        // elevation: ,
        title: Text(
          "Vehicle Details",
          style: TextStyle(
              fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 15.0, right: 10.0, top: 20.0, bottom: 10.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Vehicle Number",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _numberController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Invalid Number";
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      label: Text("Vehicle Type"),
                      // border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Text(
                      "Brand Name",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == "--Select Brand") {
                        return "Invalid Brand";
                      }
                      return null;
                    },
                    value: _selectedBrand,
                    items: _brandType
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedBrand = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      label: Text("Brand Name"),
                      // border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      "Vehicle Type",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == "--Select Type") {
                        return "Invalid Vehicle Type";
                      }
                      return null;
                    },
                    value: _selectedType,
                    items: _vehicleType
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedType = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      label: Text("Vehicle Type"),
                      // border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: const Text(
                      "Fuel Type",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == "--Select Fuel") {
                        return "Invalid Fuel Type";
                      }
                      return null;
                    },
                    value: _selectedFuel,
                    items: _fuelType
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    onChanged: (val) {
                      setState(() {
                        _selectedFuel = val as String;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_drop_down_circle,
                      color: Colors.black,
                    ),
                    decoration: const InputDecoration(
                      label: Text("Fuel Type"),
                      // border: OutlineInputBorder(),
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xff00a884),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Add Vehicle',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState?.validate() == true)
                        // &&
                        //     _brandType != "--Select Brand--" ||
                        // _vehicleType != "--Select Type--" ||
                        // _fuelType != "--Select Fuel--"
                        // )
                        {
                          Navigator.pop(
                              context,
                              Vehicle(
                                  vehicleNo: _numberController.text,
                                  brand: _selectedBrand.toString(),
                                  type: _selectedType.toString(),
                                  fuel: _selectedFuel.toString()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Please fill all the Fields")));
                        }
                      },
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
