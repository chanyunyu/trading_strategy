mixin Data {
  dynamic get comparableIdentifier => hashCode;

  @override
  bool operator ==(other) {
    if (other is! Data) {
      return false;
    }
    return comparableIdentifier == other.comparableIdentifier;
  }

  @override
  int get hashCode => super.hashCode;

  fromJson(Map<String, dynamic> json);
}

class EmptyData with Data {
  @override
  fromJson(Map<String, dynamic> json) {}
}
