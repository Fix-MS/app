import 'package:fix_ms/presentation/widgets/current_location_layer.dart';
import 'package:fix_ms/presentation/widgets/fix_ms_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';

import '../../routes.dart';

class LiveLocationPage extends StatefulWidget {
  static const String route = '/home';

  const LiveLocationPage({Key? key}) : super(key: key);

  @override
  LiveLocationPageState createState() => LiveLocationPageState();
}

class LiveLocationPageState extends State<LiveLocationPage> {
  late final MapController _mapController;

  int interActiveFlags = InteractiveFlag.all;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: FixMSAppBar(
        automaticallyImplyLeading: false,
        title: 'FixMS',
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.issues);
            },
            icon: const Icon(
              Icons.warning_amber,
            ),
            tooltip: 'Gespeicherte Mängel',
          ),
          IconButton(
            icon: const Icon(Icons.policy),
            tooltip: 'Datenschutz und Impressum',
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.imprint);
              // handle the press
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Einstellungen',
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.settings);
              // handle the press
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Flexible(
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  center:
                      LatLng(51.950637, 7.638475),
                  zoom: 18,
                  interactiveFlags: interActiveFlags,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(51.950637, 7.638475),
                        width: 160,
                        height: 160,
                        builder: (context) => const Icon(
                          Icons.my_location,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                ],

              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(builder: (BuildContext context) {
        return FloatingActionButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pushNamed(Routes.form);
            });
          },
          child: const Icon(
            Icons.add,
          ),
        );
      }),
    );
  }
}
