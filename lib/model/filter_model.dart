
class FilterModel {
  String? text;
  bool isEnergy;
  bool isCritic;

  FilterModel({this.text, this.isEnergy = false, this.isCritic = false});

  @override
  String toString() =>
      "IsEnergy: $isEnergy\nIsCritic: $isCritic\nText Value: $text";

  bool get textSearch => text != null && text!.isNotEmpty;
  bool get iconSearch => isEnergy || isCritic;
  bool get filterActive => textSearch || iconSearch;
}
