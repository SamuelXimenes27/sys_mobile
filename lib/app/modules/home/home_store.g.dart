// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreBase, Store {
  late final _$actualStateAtom =
      Atom(name: 'HomeStoreBase.actualState', context: context);

  @override
  MapState? get actualState {
    _$actualStateAtom.reportRead();
    return super.actualState;
  }

  @override
  set actualState(MapState? value) {
    _$actualStateAtom.reportWrite(value, super.actualState, () {
      super.actualState = value;
    });
  }

  late final _$actualSearchStateAtom =
      Atom(name: 'HomeStoreBase.actualSearchState', context: context);

  @override
  SearchState? get actualSearchState {
    _$actualSearchStateAtom.reportRead();
    return super.actualSearchState;
  }

  @override
  set actualSearchState(SearchState? value) {
    _$actualSearchStateAtom.reportWrite(value, super.actualSearchState, () {
      super.actualSearchState = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: 'HomeStoreBase.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$tabControllerAtom =
      Atom(name: 'HomeStoreBase.tabController', context: context);

  @override
  TabController? get tabController {
    _$tabControllerAtom.reportRead();
    return super.tabController;
  }

  @override
  set tabController(TabController? value) {
    _$tabControllerAtom.reportWrite(value, super.tabController, () {
      super.tabController = value;
    });
  }

  late final _$servicestatusAtom =
      Atom(name: 'HomeStoreBase.servicestatus', context: context);

  @override
  bool get servicestatus {
    _$servicestatusAtom.reportRead();
    return super.servicestatus;
  }

  @override
  set servicestatus(bool value) {
    _$servicestatusAtom.reportWrite(value, super.servicestatus, () {
      super.servicestatus = value;
    });
  }

  late final _$haspermissionAtom =
      Atom(name: 'HomeStoreBase.haspermission', context: context);

  @override
  bool get haspermission {
    _$haspermissionAtom.reportRead();
    return super.haspermission;
  }

  @override
  set haspermission(bool value) {
    _$haspermissionAtom.reportWrite(value, super.haspermission, () {
      super.haspermission = value;
    });
  }

  late final _$permissionAtom =
      Atom(name: 'HomeStoreBase.permission', context: context);

  @override
  LocationPermission get permission {
    _$permissionAtom.reportRead();
    return super.permission;
  }

  @override
  set permission(LocationPermission value) {
    _$permissionAtom.reportWrite(value, super.permission, () {
      super.permission = value;
    });
  }

  late final _$positionAtom =
      Atom(name: 'HomeStoreBase.position', context: context);

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$longAtom = Atom(name: 'HomeStoreBase.long', context: context);

  @override
  String? get long {
    _$longAtom.reportRead();
    return super.long;
  }

  @override
  set long(String? value) {
    _$longAtom.reportWrite(value, super.long, () {
      super.long = value;
    });
  }

  late final _$latAtom = Atom(name: 'HomeStoreBase.lat', context: context);

  @override
  String? get lat {
    _$latAtom.reportRead();
    return super.lat;
  }

  @override
  set lat(String? value) {
    _$latAtom.reportWrite(value, super.lat, () {
      super.lat = value;
    });
  }

  late final _$positionStreamAtom =
      Atom(name: 'HomeStoreBase.positionStream', context: context);

  @override
  StreamSubscription<Position> get positionStream {
    _$positionStreamAtom.reportRead();
    return super.positionStream;
  }

  @override
  set positionStream(StreamSubscription<Position> value) {
    _$positionStreamAtom.reportWrite(value, super.positionStream, () {
      super.positionStream = value;
    });
  }

  late final _$centerAtom =
      Atom(name: 'HomeStoreBase.center', context: context);

  @override
  LatLng? get center {
    _$centerAtom.reportRead();
    return super.center;
  }

  @override
  set center(LatLng? value) {
    _$centerAtom.reportWrite(value, super.center, () {
      super.center = value;
    });
  }

  late final _$personFormKeyAtom =
      Atom(name: 'HomeStoreBase.personFormKey', context: context);

  @override
  GlobalKey<FormState> get personFormKey {
    _$personFormKeyAtom.reportRead();
    return super.personFormKey;
  }

  @override
  set personFormKey(GlobalKey<FormState> value) {
    _$personFormKeyAtom.reportWrite(value, super.personFormKey, () {
      super.personFormKey = value;
    });
  }

  late final _$typeDocAtom =
      Atom(name: 'HomeStoreBase.typeDoc', context: context);

  @override
  List<String> get typeDoc {
    _$typeDocAtom.reportRead();
    return super.typeDoc;
  }

  @override
  set typeDoc(List<String> value) {
    _$typeDocAtom.reportWrite(value, super.typeDoc, () {
      super.typeDoc = value;
    });
  }

  late final _$selectedDocTypeAtom =
      Atom(name: 'HomeStoreBase.selectedDocType', context: context);

  @override
  String? get selectedDocType {
    _$selectedDocTypeAtom.reportRead();
    return super.selectedDocType;
  }

  @override
  set selectedDocType(String? value) {
    _$selectedDocTypeAtom.reportWrite(value, super.selectedDocType, () {
      super.selectedDocType = value;
    });
  }

  late final _$docNumberControllerAtom =
      Atom(name: 'HomeStoreBase.docNumberController', context: context);

  @override
  TextEditingController get docNumberController {
    _$docNumberControllerAtom.reportRead();
    return super.docNumberController;
  }

  @override
  set docNumberController(TextEditingController value) {
    _$docNumberControllerAtom.reportWrite(value, super.docNumberController, () {
      super.docNumberController = value;
    });
  }

  late final _$personNameControllerAtom =
      Atom(name: 'HomeStoreBase.personNameController', context: context);

  @override
  TextEditingController get personNameController {
    _$personNameControllerAtom.reportRead();
    return super.personNameController;
  }

  @override
  set personNameController(TextEditingController value) {
    _$personNameControllerAtom.reportWrite(value, super.personNameController,
        () {
      super.personNameController = value;
    });
  }

  late final _$personMothersNameControllerAtom =
      Atom(name: 'HomeStoreBase.personMothersNameController', context: context);

  @override
  TextEditingController get personMothersNameController {
    _$personMothersNameControllerAtom.reportRead();
    return super.personMothersNameController;
  }

  @override
  set personMothersNameController(TextEditingController value) {
    _$personMothersNameControllerAtom
        .reportWrite(value, super.personMothersNameController, () {
      super.personMothersNameController = value;
    });
  }

  late final _$datePickerControllerAtom =
      Atom(name: 'HomeStoreBase.datePickerController', context: context);

  @override
  TextEditingController get datePickerController {
    _$datePickerControllerAtom.reportRead();
    return super.datePickerController;
  }

  @override
  set datePickerController(TextEditingController value) {
    _$datePickerControllerAtom.reportWrite(value, super.datePickerController,
        () {
      super.datePickerController = value;
    });
  }

  late final _$vehicleFormKeyAtom =
      Atom(name: 'HomeStoreBase.vehicleFormKey', context: context);

  @override
  GlobalKey<FormState> get vehicleFormKey {
    _$vehicleFormKeyAtom.reportRead();
    return super.vehicleFormKey;
  }

  @override
  set vehicleFormKey(GlobalKey<FormState> value) {
    _$vehicleFormKeyAtom.reportWrite(value, super.vehicleFormKey, () {
      super.vehicleFormKey = value;
    });
  }

  late final _$typeDocVehicleAtom =
      Atom(name: 'HomeStoreBase.typeDocVehicle', context: context);

  @override
  List<String> get typeDocVehicle {
    _$typeDocVehicleAtom.reportRead();
    return super.typeDocVehicle;
  }

  @override
  set typeDocVehicle(List<String> value) {
    _$typeDocVehicleAtom.reportWrite(value, super.typeDocVehicle, () {
      super.typeDocVehicle = value;
    });
  }

  late final _$selectedDocTypeVehicleAtom =
      Atom(name: 'HomeStoreBase.selectedDocTypeVehicle', context: context);

  @override
  String? get selectedDocTypeVehicle {
    _$selectedDocTypeVehicleAtom.reportRead();
    return super.selectedDocTypeVehicle;
  }

  @override
  set selectedDocTypeVehicle(String? value) {
    _$selectedDocTypeVehicleAtom
        .reportWrite(value, super.selectedDocTypeVehicle, () {
      super.selectedDocTypeVehicle = value;
    });
  }

  late final _$docVehicleNumberControllerAtom =
      Atom(name: 'HomeStoreBase.docVehicleNumberController', context: context);

  @override
  TextEditingController get docVehicleNumberController {
    _$docVehicleNumberControllerAtom.reportRead();
    return super.docVehicleNumberController;
  }

  @override
  set docVehicleNumberController(TextEditingController value) {
    _$docVehicleNumberControllerAtom
        .reportWrite(value, super.docVehicleNumberController, () {
      super.docVehicleNumberController = value;
    });
  }

  late final _$getLocationAsyncAction =
      AsyncAction('HomeStoreBase.getLocation', context: context);

  @override
  Future getLocation(String string) {
    return _$getLocationAsyncAction.run(() => super.getLocation(string));
  }

  late final _$checkGpsAsyncAction =
      AsyncAction('HomeStoreBase.checkGps', context: context);

  @override
  Future checkGps() {
    return _$checkGpsAsyncAction.run(() => super.checkGps());
  }

  late final _$HomeStoreBaseActionController =
      ActionController(name: 'HomeStoreBase', context: context);

  @override
  dynamic searchByPersonName(String name) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.searchByPersonName');
    try {
      return super.searchByPersonName(name);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkIsLogged(dynamic context) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.checkIsLogged');
    try {
      return super.checkIsLogged(context);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onMapCreated(GoogleMapController controller) {
    final _$actionInfo = _$HomeStoreBaseActionController.startAction(
        name: 'HomeStoreBase.onMapCreated');
    try {
      return super.onMapCreated(controller);
    } finally {
      _$HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualState: ${actualState},
actualSearchState: ${actualSearchState},
selectedIndex: ${selectedIndex},
tabController: ${tabController},
servicestatus: ${servicestatus},
haspermission: ${haspermission},
permission: ${permission},
position: ${position},
long: ${long},
lat: ${lat},
positionStream: ${positionStream},
center: ${center},
personFormKey: ${personFormKey},
typeDoc: ${typeDoc},
selectedDocType: ${selectedDocType},
docNumberController: ${docNumberController},
personNameController: ${personNameController},
personMothersNameController: ${personMothersNameController},
datePickerController: ${datePickerController},
vehicleFormKey: ${vehicleFormKey},
typeDocVehicle: ${typeDocVehicle},
selectedDocTypeVehicle: ${selectedDocTypeVehicle},
docVehicleNumberController: ${docVehicleNumberController}
    ''';
  }
}
