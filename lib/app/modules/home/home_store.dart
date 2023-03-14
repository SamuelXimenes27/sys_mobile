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
  SearchState? actualSearchState = SearchState.loading;

  @observable
  int selectedIndex = 0;

  @observable
  TabController? tabController;

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

  // Mock data
  Map<String, dynamic> carro = {
    'marca': 'Ford',
    'modelo': 'Mustang',
    'ano': 2022,
    'preco': 130000.0,
    'opcional': {
      'arCondicionado': true,
      'vidrosEletricos': true,
      'tetoSolar': false,
    },
    'coresDisponiveis': ['vermelho', 'preto', 'branco'],
  };

  Map<dynamic, Map> mockDataPersons = {
    0: {
      'typeDoc': 'CPF',
      'numberDoc': '14988273067',
      'name': 'Júlia Novaes',
      'mother_name': '',
      'birthday': '',
    },
    1: {
      'typeDoc': 'RG',
      'numberDoc': '372316700',
      'name': 'Carlos Eduardo Costa',
      'mother_name': 'Manuela Ramos',
      'birthday': '',
    },
    2: {
      'typeDoc': 'CPF',
      'numberDoc': '39780113010',
      'name': 'Nathan Silva',
      'mother_name': 'Ana Sophia Campos',
      'birthday': '',
    },
    3: {
      'typeDoc': 'RG',
      'numberDoc': '400053871',
      'name': 'Enrico Gonçalves',
      'mother_name': 'Beatriz Melo',
      'birthday': '',
    },
    4: {
      'typeDoc': 'CPF',
      'numberDoc': '48267887032',
      'name': 'André Rocha',
      'mother_name': 'Mariane Novaes',
      'birthday': '',
    },
    5: {
      'typeDoc': 'RG',
      'numberDoc': '419744915',
      'name': 'Davi Lucca Carvalho',
      'mother_name': 'Juliana Santos',
      'birthday': '',
    },
    6: {
      'typeDoc': 'CPF',
      'numberDoc': '99638791012',
      'name': 'Bárbara Porto',
      'mother_name': 'Maria Alice Viana',
      'birthday': '',
    },
    7: {
      'typeDoc': 'RG',
      'numberDoc': '377437657',
      'name': 'Marina Souza',
      'mother_name': 'Isabella Dias',
      'birthday': 'Isis Correia',
    },
    8: {
      'typeDoc': 'CPF',
      'numberDoc': '46088330066',
      'name': 'Thales Teixeira',
      'mother_name': 'Giovanna Rodrigues',
      'birthday': '',
    },
    9: {
      'typeDoc': 'RG',
      'numberDoc': '249805133',
      'name': 'Olivia Nogueira',
      'mother_name': 'Luiza Melo',
      'birthday': '',
    },
    10: {
      'typeDoc': 'CPF',
      'numberDoc': '91009150090',
      'name': 'Lavínia Campos',
      'mother_name': 'Ana Sophia Nogueira',
      'birthday': '',
    },
    11: {
      'typeDoc': 'RG',
      'numberDoc': '439826810',
      'name': 'Lavínia Campos',
      'mother_name': 'Pietra Fogaça',
      'birthday': '',
    },
  };

  @action
  searchByPersonName(String name) {
    int count = 0;
    Map<dynamic, dynamic>? person;

    for (var p in mockDataPersons.values) {
      if (p['name'] == name) {
        count++;
        person = p;
      }
    }

    if (count == 1) {
      log(person.toString());
      selectedDocType = person!['typeDoc'];
      docNumberController.text = person['numberDoc'];
      personMothersNameController.text = person['mother_name'];
      datePickerController.text = person['birthday'];
      actualSearchState = SearchState.hasData;
    } else if (count > 1) {
      log('Forneça mais informações para a busca');
      actualSearchState = SearchState.error;
    } else {
      log('Pessoa não encontrada');
      actualSearchState = SearchState.error;
    }
  }

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

  @action
  clearInputs(context) {
    FocusScope.of(context).unfocus();
    docNumberController.clear();
    personNameController.clear();
    personMothersNameController.clear();
    datePickerController.clear();
  }
}

enum SearchState { loading, error, hasData }

enum MapState { loading, error, hasPosition }
