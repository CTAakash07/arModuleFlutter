import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:flutter/material.dart';
import 'package:testing_app/home_page.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print("Error while Implementing firebase is" + e.toString());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

// only iOS working code
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  late ARKitController arkitController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ARKitSceneView(onARKitViewCreated: onARKitViewCreated),
//         child: ARKitSceneView(
//           detectionImagesGroupName: "AR Resources",
//           onARKitViewCreated: (ARKitController controller) {
//             controller.onAddNodeForAnchor = (anchor) {
//               if (anchor is ARKitImageAnchor) {
// // Create an ARKitSphere geometry
//                 final sphere = ARKitSphere(
//                   radius: 0.06, // Set the radius of the sphere
//                   materials: [
//                     ARKitMaterial(
//                       diffuse: ARKitMaterialProperty.image("assest/images/home.png"),
//                       doubleSided: true,
//                     )
//                   ],
//                 );
//                 // Create an ARKitNode with the sphere geometry
//                 final node = ARKitNode(
//                   geometry: sphere,
//                   position: Vector3(
//                       anchor.transform.getColumn(3).x, anchor.transform.getColumn(3).y, anchor.transform.getColumn(3).z), // Set the initial position of the sphere
//                 );
//                 // Add the node to the AR scene
//                 controller.add(node);
//               }
//             };
//           },
//         ),
      ),
    );
  }
  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
}
