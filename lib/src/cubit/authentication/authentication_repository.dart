// fetch the data from source
// sources like file, server, database, firebase

import 'dart:convert';
import 'package:authentication_cubit/src/helpers/file_helper.dart';
import 'package:authentication_cubit/src/helpers/storage_helper.dart';
import 'package:authentication_cubit/src/models/user_data.dart';
import 'package:flutter/rendering.dart';

class AuthenticationRepository {

  Future<List<UserData>> readUserDataFile() async {
    String path = "assets/data/user_data.json";
    String rawData = await FileHelper.readJSONFile(path); // JSON Array String
    List<dynamic> decodedData =
        jsonDecode(rawData); // Convert List<dynamic> into List<UserData>
    List<UserData> userList = decodedData
        .map((jsonObjectMap) => UserData.fromJson(jsonObjectMap))
        .toList();

    return userList;
  }

}

// JSON Array String  --> decode it --> List<Map>
// JSON Object String --> decode it --> Map   ,,  java --> hashmap  ,, python --dict


// UserData --- to JSON --> Map -- jsonEncode --> String --> Memory
// Memory --> String -- jsonDecode --> Map --- fromJSON ---> UserData