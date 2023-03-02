import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipms_app/utils/rive_utils.dart';
import 'package:rive/rive.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late SMIBool searchTrigger;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 243, 243, 1),
      appBar: AppBar(
        //title: const Text("ParkXpress", style: TextStyle(fontFamily: "ubuntu", color: Colors.black87),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {},
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                ),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text('Welcome',
                    style: TextStyle(color: Colors.black87, fontFamily: "ubuntu", fontSize: 25),
                    ),
                     SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Ian Luke',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontFamily: "ubuntu",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            color: Constants.PRIMARY_COLOR,
            borderRadius: BorderRadius.all(Radius.circular(24))
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: (){
                  searchTrigger.change(true);
                },
                child: SizedBox(
                  height: 36,
                  width: 36,
                  child: RiveAnimation.asset(
                    "assets/RiveAssets/icons.riv",
                    artboard: "HOME",
                    onInit: (artboard) {
                      StateMachineController controller = RiveUtils.getRiveController(artboard, stateMachineName: "SEARCH_Interactivity");
                    searchTrigger = controller.findInput("active") as SMIBool;
                    },
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}