import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

import '../../shared/constants/routes_const.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  MapState? actualState = MapState.loading;

  @observable
  int selectedIndex = 0;

  @observable
  late TabController tabController;

  // Map Page Variables
  @observable
  bool servicestatus = false;

  @observable
  bool haspermission = false;

  @observable
  late LocationPermission permission;

  @observable
  late Position position;

  @observable
  String? long = "";

  @observable
  String? lat = "";

  @observable
  late StreamSubscription<Position> positionStream;

  @observable
  LatLng? center;

  // Person Page Variables
  @observable
  var personFormKey = GlobalKey<FormState>();

  @observable
  List<String> typeDoc = ['CPF', 'RG'];

  @observable
  String? selectedDocType = 'CPF';

  @observable
  TextEditingController docNumberController = TextEditingController();

  @observable
  TextEditingController personNameController = TextEditingController();

  @observable
  TextEditingController personMothersNameController = TextEditingController();

  @observable
  TextEditingController datePickerController = TextEditingController();

  // Vehicle Page Variables
  @observable
  var vehicleFormKey = GlobalKey<FormState>();

  @observable
  List<String> typeDocVehicle = ['Placa', 'Chassi'];

  @observable
  String? selectedDocTypeVehicle = 'Placa';

  @observable
  TextEditingController docVehicleNumberController = TextEditingController();

  @action
  checkIsLogged(context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        log('User is currently signed out!');
        Navigator.pushReplacementNamed(context, RoutesConst.login);
      } else {
        log('User is signed in!');
      }
    });
  }

  @observable
  @action
  onMapCreated(GoogleMapController controller) {}

  @action
  getLocation(String string) async {
    actualState = MapState.loading;

    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    if (kDebugMode) {
      print(position.longitude);
    }
    if (kDebugMode) {
      print(position.latitude);
    }

    long = position.longitude.toStringAsFixed(6);
    lat = position.latitude.toStringAsFixed(6);

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high, //accuracy of the location data
      distanceFilter: 100, //minimum distance (measured in meters) a
      //device must move horizontally before an update event is generated;
    );

    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position position) {
      if (kDebugMode) {
        print(position.longitude);
      }
      if (kDebugMode) {
        print(position.latitude);
      }

      try {
        long = position.longitude.toString();
        lat = position.latitude.toString();

        center = LatLng(double.parse(long!), double.parse(lat!));

        actualState = MapState.hasPosition;
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  @action
  checkGps() async {
    servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (kDebugMode) {
            print('Location permissions are denied');
          }
        } else if (permission == LocationPermission.deniedForever) {
          if (kDebugMode) {
            print("'Location permissions are permanently denied");
          }
        } else {
          haspermission = true;
        }
      } else {
        haspermission = true;
      }

      if (haspermission) {
        try {
          getLocation(long!).then(actualState = MapState.hasPosition);
        } catch (e) {}
      }
    } else {
      if (kDebugMode) {
        print("GPS Service is not enabled, turn on GPS location");
      }
    }
  }
}

enum MapState { loading, error, hasPosition }
