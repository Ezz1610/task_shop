// import 'dart:async';
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';

// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:fawttara/core/app_utils/media_query_values.dart';
// import 'package:flutter_nearby_connections/flutter_nearby_connections.dart';

// enum DeviceType { admin, user }

// class PeerToPeerConnection {
//   static final sharedInstance = PeerToPeerConnection._();
//   final NearbyService nearbyService = NearbyService();
//   final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
//   final StreamController<List<Device>> allDevicesController =
//       StreamController.broadcast();
//   final StreamController<List<Device>> connectedDevicesController =
//       StreamController.broadcast();
//   List<Device> _devices = [];
//   List<Device> _connectedDevices = [];
//   late StreamSubscription connectionStateChangedSubscription;
//   late StreamSubscription receivedDataSubscription;

//   List<Device> get allDevices => _devices;

//   List<Device> get connectedDevices => _connectedDevices;

//   Stream<List<Device>> get allDevicesControllerStream =>
//       allDevicesController.stream;

//   Stream<List<Device>> get connectedDevicesControllerStream =>
//       connectedDevicesController.stream;

//   Sink<List<Device>> get allDevicesControllerStreamSink =>
//       allDevicesController.sink;

//   Sink<List<Device>> get connectedDevicesControllerStreamSink =>
//       allDevicesController.sink;

//   void init({
//     required DeviceType deviceRole,
//     required String deviceId,
//     required Function(dynamic data) onEvent,
//   }) async {
//     String devInfo = '';
//     String devId = '';
//     if (Platform.isAndroid) {
//       AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
//       devInfo = androidInfo.model;
//       devId = androidInfo.id;
//     }
//     if (Platform.isIOS) {
//       IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
//       devInfo = '${iosInfo.localizedModel}';
//     }

//     await nearbyService.init(
//       /// device id
//       deviceName: devInfo,
//       serviceType: 'mpconn',
//       strategy: Strategy.P2P_CLUSTER,
//       callback: (isRunning) async {
//         dPrint('isRunning $isRunning');
//         dPrint('deviceRole $deviceRole');
//         dPrint('devInfo $devInfo');
//         dPrint('devId $devId');

//         if (isRunning) {
//           if (deviceRole == DeviceType.admin) {
//             // await stopBrowsingForPeers();
//             // await Future.delayed(const Duration(microseconds: 200));
//             await startBrowsingForPeers();
//           } else {
//             // await stopAdvertisingPeer();
//             // await stopBrowsingForPeers();
//             // await Future.delayed(const Duration(microseconds: 200));
//             await startAdvertisingPeer();
//             await startBrowsingForPeers();
//           }
//         }
//       },
//     );

//     connectionStateChangedSubscription =
//         nearbyService.stateChangedSubscription(callback: (devicesList) async {
//           for (var device in devicesList) {
//         _logDeviceInfo(device);
//       }
//       // if (deviceRole == DeviceType.admin) {
//       //   for (var device in devicesList) {
//       //     await addDevice(device: device).then((value) {
//       //       Map<String, dynamic> mapData = {LocalApis.POST_ADMIN_ID: devInfo};

//       //       var sentData = BaseConnectionModel(
//       //         type: LocalApis.POST_ADMIN_ID,
//       //         senderID: devInfo,
//       //         data: jsonEncode(mapData).toString(),
//       //       );

//       //       /// admin post recpie id
//       //       PeerToPeerConnection.sharedInstance
//       //           .emit(receiverId: device.deviceId, data: sentData.toMap());
//       //     });
//       //   }
//       // }

//       _devices = devicesList;
//       _connectedDevices =
//           _devices.where((d) => d.state == SessionState.connected).toList();
//       allDevicesController.sink.add(_devices);
//       connectedDevicesController.sink.add(_connectedDevices);
//     });

//     receivedDataSubscription =
//         nearbyService.dataReceivedSubscription(callback: (data) {
//       onEvent(data);
//     });
//   }

//   Future<List<Device>> getConnectedDevices() async {
//     return _connectedDevices;
//   }

//   Future<void> getConnectionState() async {
//     dPrint('all devices ${_devices.length}');
//     dPrint('connected devices ${_connectedDevices.length}');
//   }

//   Future<void> startBrowsingForPeers() async {
//     await nearbyService.startBrowsingForPeers();
//   }

//   Future<void> updateConnections({
//     required DeviceType deviceRole,
//   }) async {
//     dPrint('connection update');
//     if (deviceRole == DeviceType.user) {
//       await stopAdvertisingPeer();
//       await startAdvertisingPeer();
//     } else {
//       await stopBrowsingForPeers();
//       await startBrowsingForPeers();
//     }
//   }

//   Future<void> stopBrowsingForPeers() async {
//     await nearbyService.stopBrowsingForPeers();
//   }

//   Future<void> startAdvertisingPeer() async {
//     await nearbyService.startAdvertisingPeer();
//   }

//   Future<void> stopAdvertisingPeer() async {
//     await nearbyService.stopAdvertisingPeer();
//   }

//   Future<List<Device>> getAllDevices() async {
//     return _devices;
//   }

//   Future<void> addDevice({required Device device}) async {
//     await nearbyService.invitePeer(
//       deviceID: device.deviceId,
//       deviceName: device.deviceName,
//     );
//   }

//   Future<void> removeDevice({required Device device}) async {
//     await nearbyService.disconnectPeer(
//       deviceID: device.deviceId,
//     );
//   }

//   Future<void> emit({
//     required String receiverId,
//     required Map<String, dynamic> data,
//   }) async {
//     await nearbyService.sendMessage(receiverId, jsonEncode(data));
//   }

//   void close() {
//     allDevicesController.close();
//     connectedDevicesController.close();
//     connectionStateChangedSubscription.cancel();
//     receivedDataSubscription.cancel();
//     nearbyService.stopBrowsingForPeers();
//     nearbyService.stopAdvertisingPeer();
//   }

//   void _logDeviceInfo(Device device) {
//     log("deviceId: ${device.deviceId} | deviceName: ${device.deviceName} | state: ${device.state}");
//   }

//   PeerToPeerConnection._();
// }
