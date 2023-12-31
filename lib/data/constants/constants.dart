Map<int, String> days = {
  0: 'TODAY',
  1: 'MON',
  2: 'TUE',
  3: 'WED',
  4: 'THU',
  5: 'FRI',
  6: 'SAT',
  7: 'SUN',
};

DateTime epochToDateTime(int epoch) {
  final date = DateTime.fromMillisecondsSinceEpoch(epoch * 1000);
  return date;
}
