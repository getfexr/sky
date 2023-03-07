String getRemainingTimeString(DateTime time) {
  var now = DateTime.now();
  var diff = time.difference(now);

  if (diff < Duration.zero) {
    diff = -diff;
  }

  var hours = diff.inHours;
  var mins = diff.inMinutes - hours * 60;
  var secs = diff.inSeconds - hours * 60 * 60 - mins * 60;

  if (hours > 0) {
    return '${hours}h ${mins}m ${secs}s';
  } else if (mins > 0) {
    return '${mins}m ${secs}s';
  } else {
    return '${secs}s';
  }
}

class BiMap<K, V> {
  final Map<K, V> _forward;
  final Map<V, K> _backward;

  BiMap._(this._forward, this._backward);

  factory BiMap.fromMap(Map<K, V> map) {
    final forward = Map<K, V>.from(map);
    final backward = {
      for (var entry in forward.entries) entry.value: entry.key
    };
    return BiMap._(forward, backward);
  }

  void add(K key, V value) {
    _forward[key] = value;
    _backward[value] = key;
  }

  V operator [](K key) => _forward[key]!;

  K reverse(V value) => _backward[value]!;

  int length() => _forward.length;

  Iterable<K> get keys => _forward.keys;

  MapEntry<K, V> getByIndex(int index) {
    return _forward.entries.elementAt(index);
  }
}
