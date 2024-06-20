import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tractian_challenge_treeview/model/asset_model.dart';
import 'package:tractian_challenge_treeview/model/company_model.dart';
import 'package:tractian_challenge_treeview/model/location_model.dart';

class Api {
  final String _api = "https://fake-api.tractian.com";

  Future<String> getData(String endpoint) async {
    http.Response response = await http.get(Uri.parse("$_api/$endpoint"));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          "Failed to call API\nStatusCode: ${response.statusCode}\n${response.body}");
    }
  }

  Future<List<CompanyModel>> getCompanies() async {
    try {
      List companies = jsonDecode(await getData("companies")) as List;
      return List.generate(
        companies.length,
        (index) => CompanyModel.fromMap(companies[index]),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<LocationModel>> getLocations(String companyId) async {
    try {
      List locations =
          jsonDecode(await getData("companies/$companyId/locations")) as List;
      return List.generate(
        locations.length,
        (index) => LocationModel.fromMap(locations[index]),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<AssetModel>> getAssets(String companyId) async {
    try {
      List assets = jsonDecode(await getData("companies/$companyId/assets")) as List;
      return List.generate(
        assets.length,
        (index) => AssetModel.fromMap(assets[index]),
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
