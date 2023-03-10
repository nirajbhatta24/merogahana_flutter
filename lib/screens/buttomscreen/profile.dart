import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mero_gahana/screens/login_screen.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _username = 'Bibek'; // Replace with user's actual username
  final String _password = 'Bhusal'; // Replace with user's actual password
  final String _imageUrl = 'https://cdn-icons-png.flaticon.com/512/6522/6522516.png';

  final _formKey = GlobalKey<FormState>();
  GoogleMapController? mapController;
  Set<Marker> markers = {};

  LatLng kaushal = const LatLng(27.7127356, 85.3459928);

  @override
  void initstate(){
    markers.add(
      Marker(
          markerId: MarkerId(kaushal.toString()),
          position: kaushal,
          infoWindow: const InfoWindow(
              title: 'AB+', snippet: "Kaushal Khanal"),
          icon: BitmapDescriptor.defaultMarker),
    );
  }


  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    // Do something with the picked image file
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    child: Stack(
                      fit: StackFit.expand,
                      clipBehavior: Clip.none,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(_imageUrl),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: -12,
                          child: SizedBox(
                            height: 46,
                            width: 46,
                            
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _username,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _username = value!;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  initialValue: _password,
                  decoration: const InputDecoration(
                    labelText: 'Last Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Lastname';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      _username = value!;
                    });
                  },
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                        content: Text('Profile saved'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.green,
                      ),
                    );
                    
                    }
                  },
                  child: const Text('Save'),
                ),
                const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Confirm Logout'),
                            content: const Text('Are you sure you want to logout?'),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: const Text('No'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Logout');
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      ).then((result) {
                        if (result == 'Logout') {
                          // TODO: Implement logic to logout user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Logged out successfully'),
                              duration: Duration(seconds: 2),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginScreen()),
                          );
                        }
                      });
                    },
                    child: const Text('Logout'),
                  ),
                  const SizedBox(height: 5.0),
                  SizedBox(
                    height: 300.0,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: kaushal, 
                        zoom: 10
                      ),
                      markers: <Marker>{
                        Marker(
                          markerId: const MarkerId("my_location"),
                          position: kaushal,
                          infoWindow: const InfoWindow(title: "My Location"),
                          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                        )
                      },
                      mapType: MapType.normal,
                      onMapCreated: (controller) {
                        setState(() {
                          mapController = controller;
                        });
                      }
                    )

                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}