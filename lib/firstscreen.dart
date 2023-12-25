import 'package:flutter/material.dart';
import 'package:lyqik/card.dart';
import 'package:lyqik/new.dart';
import 'package:lyqik/object.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Vehicle> bikevehicleList = [];
  List<Vehicle> carvehicleList = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed:() {
        //   Vehicle(brand: )

        // },),
        floatingActionButton: SizedBox(
          width: 200,
          child: FloatingActionButton(
            onPressed: () async {
              final Vehicle result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VehicleRegistration()),
              );

              // Handle the result when the second page is popped
              if (result != null) {
                print('Received result: $result');
                // ScaffoldMessenger.of(context).showSnackBar(
                //   SnackBar(content: Text('Received result: $result')),
                // );
                setState(() {
                  if (result.type == "Bike") {
                    bikevehicleList.add(result);
                  } else {
                    carvehicleList.add(result);
                  }
                });
              }
            },
            child: Text(
              "Add Vehicle",
              style: TextStyle(fontSize: 22),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Vehicle Details",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 25),
          ),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            // labelStyle: TextStyle(fontSize: ),
            // indicatorSize: ""
            labelColor: Colors.white,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                text: "Bike",
                icon: Icon(
                  Icons.motorcycle,
                ),
              ),
              Tab(
                text: "Car",
                icon: Icon(Icons.car_repair),
              )
            ],
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 85),
          child: TabBarView(children: [
            SingleChildScrollView(child: rendervehicleList()),
            SingleChildScrollView(child: rendercarList()),
            // SingleChildScrollView(child: rendervehicleList("Car"))
          ]),
        ),
      ),
    );
  }

  rendervehicleList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 15,
        );
      },
      itemCount: bikevehicleList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // if (vehicleList[index].type == "Bike") {
        return Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // vehicleList.remove(vehicleList[index]);
                    // print(vehicleList[index].type +
                    //     vehicleList[index].fuel +
                    //     vehicleList[index].brand +
                    //     vehicleList[index].vehicleNo);
                  });
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 280,
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          // shape: BoxShape.,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              card(bikevehicleList[index]),
            ],
          ),
        );
        // } else {
        //   Container(
        //     child: Text("empty data"),
        //   );
        // }
      },
    );
  }

  rendercarList() {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 15,
        );
      },
      itemCount: carvehicleList.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        // if (carvehicleList[index].type == "Car") {
        return Container(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    // vehicleList.remove(vehicleList[index]);
                    // print(vehicleList[index].type +
                    //     vehicleList[index].fuel +
                    //     vehicleList[index].brand +
                    //     vehicleList[index].vehicleNo);
                  });
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 280,
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          color: Colors.red,
                          // shape: BoxShape.,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.close),
                    ),
                  ],
                ),
              ),
              card(carvehicleList[index]),
            ],
          ),
        );
        // } else {
        //   Container(
        //     child: Text("empty data"),
        //   );
        // }
      },
    );
  }
}
