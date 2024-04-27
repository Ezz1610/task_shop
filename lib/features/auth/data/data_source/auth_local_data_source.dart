// import '../../../../core/app_utils/app_prefs.dart';
// import '../../../../core/app_utils/media_query_values.dart';
// import '../../../../core/local_db/isar_db.dart';
// import 'package:injectable/injectable.dart';
// import 'package:isar/isar.dart';
//
// abstract class AuthLocalDataSource {
//   Future<List<int>> saveUsers(List<AppUsersDM> users);
//
//   Future<bool> clearUsers();
//
//   Future<AppUsersDM?> offLineLogIn(userNumber, userPassword);
// }
//
// @LazySingleton(as: AuthLocalDataSource)
// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   final Isaar _isarDB;
//   final AppPreferences preferences;
//
//   AuthLocalDataSourceImpl(
//     this._isarDB,
//     this.preferences,
//   );
//
//   @override
//   Future<bool> clearUsers() async {
//     final res = await _isarDB.deleteAll<AppUsersDM>();
//     dPrint("device clear : ${res == 1}");
//     return res == 1;
//   }
//
//   @override
//   Future<List<int>> saveUsers(List<AppUsersDM> users) async {
//     final res = await _isarDB.writeOrUpdateAll(objects: users);
//     users.map((e) => dPrint('${e.userNo} :${e.userAppPasscode}}'));
//     return res;
//   }
//
//   @override
//   Future<AppUsersDM?> offLineLogIn(userNumber, userPassword) async {
//     final response = await _isarDB.getOneWithQuery(
//         query: (QueryBuilder<AppUsersDM, AppUsersDM, QWhere> isa) {
//       return isa
//           .filter()
//           .userNoEqualTo(userNumber)
//           .userAppPasscodeEqualTo(userPassword);
//     });
//     if (response != null) {
//       return response;
//     } else {
//       throw IsarNoData();
//     }
//   }
//
// //end
// }
