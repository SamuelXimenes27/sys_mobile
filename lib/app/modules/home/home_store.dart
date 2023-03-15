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

  // Vehicle Search Page
  @observable
  String? ownerName = '';

  @observable
  String? vehicleType = '';

  @observable
  String? model = '';

  @observable
  String? brand = '';

  @observable
  String? plate = '';

  @observable
  String? chassi = '';

  @observable
  String? renavam = '';

  @observable
  String? yearFab = '';

  @observable
  String? vehicleColor = '';

  @observable
  String? mercosulPlate = '';

  @observable
  String? numberOfAxles = '';

  @observable
  String cargoCapacity = '';

  // Mock data
  Map<dynamic, Map> mockDataVehicles = {
    0: {
      'vehicle_type': 'Carro',
      'brand': 'Ford',
      'model': 'Mustang',
      'plate': 'JTQ-7943',
      'chassi': '2AY tmCPLa AA G83421',
      'renavam': '53408710498',
      'yearFab': 2022,
      'color': 'vermelho',
      'is_new_plate': true,
      'owner_name': 'Júlia Novaes',
    },
    1: {
      'vehicle_type': 'Moto',
      'brand': 'Honda',
      'model': 'CB 500',
      'plate': 'HQX-6686',
      'chassi': '22A A83k6u S4 0p2980',
      'renavam': '92893117562',
      'yearFab': 2022,
      'color': 'preto',
      'is_new_plate': true,
      'owner_name': 'Lucas Ferreira',
    },
    2: {
      'vehicle_type': 'Caminhão',
      'brand': 'Mercedes-Benz',
      'model': 'Actros',
      'plate': 'NFA-5637',
      'chassi': '7CA 5xwAmL 58 BA1549',
      'renavam': '47064066874',
      'yearFab': 2021,
      'color': 'branco',
      'is_new_plate': true,
      'owner_name': 'Pedro Henrique',
      'cargo_capacity': '35 toneladas',
      'number_of_axles': 2,
    },
    3: {
      'vehicle_type': 'ônibus',
      'brand': 'Scania',
      'model': 'Touring',
      'plate': 'MXW-1262',
      'chassi': '5bN lM5yD6 vb ax4830',
      'renavam': '51559504882',
      'yearFab': 2020,
      'color': 'azul',
      'is_new_plate': false,
      'owner_name': 'Maria Silva',
      'cargo_capacity': '15 toneladas',
      'number_of_axles': 2,
    },
    4: {
      'vehicle_type': 'Moto',
      'brand': 'Honda',
      'model': 'CG 160',
      'plate': 'IDJ-6372',
      'chassi': '3Af u33plW AM 4j2575',
      'renavam': '77912700589',
      'yearFab': 2022,
      'color': 'vermelho',
      'is_new_plate': true,
      'owner_name': 'Júlia Novaes',
    },
    5: {
      'vehicle_type': 'Moto',
      'brand': 'Yamaha',
      'model': 'YZF-R3',
      'plate': 'MMY-8925',
      'chassi': '6WA G82HE5 Xu m28317',
      'renavam': '31268274932',
      'yearFab': 2021,
      'color': 'azul',
      'is_new_plate': true,
      'owner_name': 'Lucas Silva',
    },
    6: {
      'vehicle_type': 'Carro',
      'brand': 'Chevrolet',
      'model': 'Onix',
      'plate': 'HRM-6521',
      'chassi': '54r nNw1TH 7b WA6835',
      'renavam': '17898114971',
      'yearFab': 2021,
      'color': 'branco',
      'is_new_plate': true,
      'owner_name': 'Gabriel Lima',
    },
    7: {
      'vehicle_type': 'Carro',
      'brand': 'Volkswagen',
      'model': 'Gol',
      'plate': 'JGL-5489',
      'chassi': '1GS 1Pgk0G xt nz5405',
      'renavam': '04866063407',
      'yearFab': 2022,
      'color': 'preto',
      'is_new_plate': true,
      'owner_name': 'Maria Santos',
    },
    8: {
      'vehicle_type': 'Carro',
      'brand': 'Fiat',
      'model': 'Argo',
      'plate': 'NAL-8945',
      'chassi': '4h1 Yx3LFT 0a W45992',
      'renavam': '48022324385',
      'yearFab': 2020,
      'color': 'azul',
      'is_new_plate': false,
      'owner_name': 'Thiago Silva',
    },
    9: {
      'vehicle_type': 'Caminhão',
      'brand': 'Mercedes-Benz',
      'model': 'Axor 3344',
      'plate': 'JOJ-9498',
      'chassi': '3T6 bV6yKs bA Sr1424',
      'renavam': '49209393850',
      'yearFab': 2019,
      'color': 'vermelho',
      'is_new_plate': false,
      'owner_name': 'José Oliveira',
      'cargo_capacity': '30 toneladas',
      'number_of_axles': 3,
    },
    10: {
      'vehicle_type': 'Caminhão',
      'brand': 'Scania',
      'model': 'G480',
      'plate': 'JVF-3140',
      'chassi': '8nn jWwSS7 mG SK0635',
      'renavam': '14158022971',
      'yearFab': 2020,
      'color': 'branco',
      'is_new_plate': true,
      'owner_name': 'Lucas Pereira',
      'cargo_capacity': '25 toneladas',
      'number_of_axles': 2,
    },
    11: {
      'vehicle_type': 'Caminhão',
      'brand': 'Volvo',
      'model': 'FH 540',
      'plate': 'KBW-7162',
      'chassi': '2UR 0u540D p6 4D9692',
      'renavam': '53953891802',
      'yearFab': 2021,
      'color': 'azul',
      'is_new_plate': true,
      'owner_name': 'Marcelo Souza',
      'cargo_capacity': '40 toneladas',
      'number_of_axles': 4,
    },
  };

  Map<dynamic, Map> mockDataPersons = {
    0: {
      'typeDoc': 'CPF',
      'numberDoc': '14988273067',
      'name': 'Júlia Novaes',
      'mother_name': '',
      'birthday': '12/01/1981',
    },
    1: {
      'typeDoc': 'RG',
      'numberDoc': '372316700',
      'name': 'Carlos Eduardo Costa',
      'mother_name': 'Manuela Ramos',
      'birthday': '02/03/1968',
    },
    2: {
      'typeDoc': 'CPF',
      'numberDoc': '39780113010',
      'name': 'Nathan Silva',
      'mother_name': 'Ana Sophia Campos',
      'birthday': '03/01/1993',
    },
    3: {
      'typeDoc': 'RG',
      'numberDoc': '400053871',
      'name': 'Enrico Gonçalves',
      'mother_name': 'Beatriz Melo',
      'birthday': '08/03/1985',
    },
    4: {
      'typeDoc': 'CPF',
      'numberDoc': '48267887032',
      'name': 'André Rocha',
      'mother_name': 'Mariane Novaes',
      'birthday': '12/03/1962',
    },
    5: {
      'typeDoc': 'RG',
      'numberDoc': '419744915',
      'name': 'Davi Lucca Carvalho',
      'mother_name': 'Juliana Santos',
      'birthday': '02/03/1993',
    },
    6: {
      'typeDoc': 'CPF',
      'numberDoc': '99638791012',
      'name': 'Bárbara Porto',
      'mother_name': 'Maria Alice Viana',
      'birthday': '23/02/1987',
    },
    7: {
      'typeDoc': 'RG',
      'numberDoc': '377437657',
      'name': 'Marina Souza',
      'mother_name': 'Isabella Dias',
      'birthday': '19/01/1966',
    },
    8: {
      'typeDoc': 'CPF',
      'numberDoc': '46088330066',
      'name': 'Thales Teixeira',
      'mother_name': 'Giovanna Rodrigues',
      'birthday': '20/02/1949',
    },
    9: {
      'typeDoc': 'RG',
      'numberDoc': '249805133',
      'name': 'Olivia Nogueira',
      'mother_name': 'Luiza Melo',
      'birthday': '27/10/2000',
    },
    10: {
      'typeDoc': 'CPF',
      'numberDoc': '91009150090',
      'name': 'Lavínia Campos',
      'mother_name': 'Ana Sophia Nogueira',
      'birthday': '02/03/1976',
    },
    11: {
      'typeDoc': 'RG',
      'numberDoc': '439826810',
      'name': 'Lavínia Campos',
      'mother_name': 'Pietra Fogaça',
      'birthday': '19/02/1998',
    },
  };

  @action
  searchByDocNumberVehicle(String numberDoc, String typeDocSearch) {
    int count = 0;
    Map<dynamic, dynamic>? docNumber;

    for (var p in mockDataVehicles.values) {
      if (p[typeDocSearch == 'Placa' ? 'plate' : 'chassi'] == numberDoc) {
        count++;
        docNumber = p;
      }
    }

    if (count == 1) {
      ownerName = docNumber!['owner_name'];
      vehicleType = docNumber['vehicle_type'];
      model = docNumber['model'];
      brand = docNumber['brand'];
      plate = docNumber['plate'];
      chassi = docNumber['chassi'];
      renavam = docNumber['renavam'];
      yearFab = docNumber['yearFab'].toString();
      vehicleColor = docNumber['color'];
      mercosulPlate = docNumber['is_new_plate'].toString();
      numberOfAxles = docNumber['number_of_axles'].toString();
      cargoCapacity = docNumber['cargo_capacity'].toString();
      actualSearchState = SearchState.hasData;
    } else if (count > 1) {
      log('Forneça mais informações para a busca');
      actualSearchState = SearchState.error;
    } else {
      log('Veículo não encontrado');
      actualSearchState = SearchState.error;
    }
  }

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
    docVehicleNumberController.clear();

    ownerName = '';
    vehicleType = '';
    model = '';
    brand = '';
    renavam = '';
    yearFab = '';
    vehicleColor = '';
    mercosulPlate = '';
    numberOfAxles = '';
    cargoCapacity = '';
  }
}

enum SearchState { loading, error, hasData }

enum MapState { loading, error, hasPosition }
