part of 'assets_cubit.dart';

class AssetState {}

class AssetsLoading extends AssetState {}

class AssetsError extends AssetState {
  final String msg;
  AssetsError(this.msg);
}

class AssetsEmpty extends AssetState {
  final String msg;
  AssetsEmpty(this.msg);
}

class AssetsSuccess extends AssetState {
  final List<EntityModel> assets;
  AssetsSuccess(this.assets);
}
