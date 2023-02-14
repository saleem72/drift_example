//

extension DynaminToDouble on dynamic {
  double? extractDouble() {
    if (this is int) {
      return this.toDouble();
    } else if (this is double) {
      return this.toDouble();
    } else {
      return null;
    }
  }
}

double? extractDoubleFrom(dynamic value) {
  if (value is int) {
    return value.toDouble();
  } else if (value is double) {
    return value;
  } else {
    return null;
  }
}
