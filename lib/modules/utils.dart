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