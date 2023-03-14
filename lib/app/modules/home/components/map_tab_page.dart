import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../home_store.dart';

class MapTabPage extends StatefulWidget {
  const MapTabPage({Key? key}) : super(key: key);

  @override
  State<MapTabPage> createState() => _MapTabPageState();
}

class _MapTabPageState extends State<MapTabPage> {
  final HomeStore store = Modular.get();

  @override
  void initState() {
    store.checkGps();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Observer(
        builder: (context) {
          if (store.actualState == MapState.loading) {
            return Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.35),
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (store.actualState == MapState.error) {
            return Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.35),
              child: const Center(
                child: Text('Error 404'),
              ),
            );
          } else if (store.actualState == MapState.hasPosition) {
            return Stack(
              children: [
                SizedBox(
                  height: 450,
                  child: GoogleMap(
                    onMapCreated: store.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: store.center!,
                      zoom: 16.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 370, 0, 0),
                  child: SizedBox(
                    width: 172,
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(6)),
                        color: Colors.grey[300],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 7, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Latitude: ${store.lat}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Logitude: ${store.long}',
                                style: const TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
