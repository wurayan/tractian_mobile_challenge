import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_challenge_treeview/model/asset_model.dart';
import 'package:tractian_challenge_treeview/model/entity_model.dart';
import 'package:tractian_challenge_treeview/model/filter_model.dart';
import 'package:tractian_challenge_treeview/model/location_model.dart';
import 'package:tractian_challenge_treeview/service/api_rest.dart';

part 'assets_states.dart';

class AssetsCubit extends Cubit<AssetState> {
  AssetsCubit() : super(AssetsLoading());

  Api api = Api();

  final List<EntityModel> _allItens = [];

  Future<void> getItens(String companyId) async {
    try {
      final List<AssetModel> assets = await api.getAssets(companyId);
      final List<LocationModel> locations = await api.getLocations(companyId);

      Map<String, AssetModel> assetMap = {
        for (var asset in assets) asset.id: asset
      };
      Map<String, LocationModel> locationMap = {
        for (var location in locations) location.id: location
      };

      int assetLength = assets.length;
      int locationLength = locations.length;

      for (var i = 0; i < assetLength; i++) {
        AssetModel asset = assets[i];
        if (asset.isRootComponent) {
          _allItens.add(asset);
        } else {
          String? parentId = asset.parentId;
          String? locationId = asset.locationId;
          if (parentId != null && assetMap.containsKey(parentId)) {
            assetMap[parentId]?.children.add(asset);
          } else if (locationId != null &&
              locationMap.containsKey(locationId)) {
            locationMap[locationId]?.children.add(asset);
          } else {
            _allItens.add(asset);
          }
        }
      }

      for (var i = 0; i < locationLength; i++) {
        LocationModel location = locations[i];
        if (location.isRootLocation) {
          _allItens.add(location);
        } else if (locationMap.containsKey(location.parentId)) {
          locationMap[location.parentId]?.children.add(location);
        }
      }

      if (_allItens.isEmpty) {
        emit(AssetsEmpty("Failed to locate assets"));
      } else {
        _allItens.sort(
          (a, b) => a.hasChildren && !b.hasChildren
              ? -1
              : !a.hasChildren && b.hasChildren
                  ? 1
                  : 0,
        );
        emit(AssetsSuccess(_allItens));
      }
    } catch (e) {
      emit(AssetsError(e.toString()));
    }
  }

  Future<void> filterItens(FilterModel filter) async {
    if (filter.filterActive) {
      List<EntityModel> filteredItens = _filterText(_allItens, filter);
      filteredItens = _filter(filteredItens, filter);
      if (filteredItens.isEmpty) {
        emit(AssetsSuccess([]));
      } else {
        emit(AssetsSuccess(filteredItens));
      }
    } else {
      emit(AssetsSuccess(_allItens));
    }
  }

  List<EntityModel> _filterText(List<EntityModel> itens, FilterModel filter) {
    if (!filter.textSearch) return itens;
    List<EntityModel> result = [];
    for (var item in itens) {
      if (item.hasChildren) {
        List<EntityModel> filteredChildren = _filterText(item.children, filter);
        if (filteredChildren.isNotEmpty) {
          result.add(_filteredClone(item, filteredChildren));
        }
      }
      if (result.isEmpty &&
          item.name.toLowerCase().contains(filter.text!.toLowerCase())) {
        result.add(item);
      }
    }
    return result;
  }

  List<EntityModel> _filter(List<EntityModel> itens, FilterModel filter) {
    if (!filter.iconSearch) return itens;
    List<EntityModel> result = [];
    for (var item in itens) {
      if (item is AssetModel && _checkCondition(item, filter)) {
        result.add(item);
      } else if (item.hasChildren) {
        List<EntityModel> filteredChildren = _filter(item.children, filter);
        if (filteredChildren.isNotEmpty) {
          result.add(_filteredClone(item, filteredChildren));
        }
      }
    }
    return result;
  }

  bool _checkCondition(AssetModel asset, FilterModel filter) {
    if (filter.isCritic && filter.isEnergy) {
      return asset.isEnergy && asset.isCritic;
    }
    if (filter.isCritic) return asset.isCritic;
    if (filter.isEnergy) return asset.isEnergy;
    return false;
  }

  _filteredClone(EntityModel entityModel, List<EntityModel> newChildren) =>
      entityModel is AssetModel
          ? entityModel.filteredClone(newChildren)
          : entityModel is LocationModel
              ? entityModel.filteredClone(newChildren)
              : throw Exception(
                  "Type error: couldn't recognize the type of EntityModel");

  // List<EntityModel> filterEntities(
  //     List<EntityModel> entities, FilterModel filter) {
  //   List<EntityModel> filteredEntities = [];

  //   for (var entity in entities) {
  //     // Check if the current entity is an AssetModel and meets the criteria based on the filter
  //     if (entity is AssetModel &&
  //         (filter.isCritic && entity.isCritic ||
  //             filter.isEnergy && entity.isEnergy)) {
  //       filteredEntities.add(entity);
  //     } else if (entity.children != null) {
  //       // Recursively filter the children
  //       var filteredChildren = filterEntities(entity.children!, filter);
  //       if (filteredChildren.isNotEmpty) {
  //         // Add the current entity with its filtered children if any children meet the criteria
  //         filteredEntities.add(EntityModel(
  //           id: entity.id,
  //           children: filteredChildren,
  //         ));
  //       }
  //     }
  //   }

  //   return filteredEntities;
  // }
}
