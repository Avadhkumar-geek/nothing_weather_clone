String? getSvgPath(String text, bool isDayTime) {
  final Map<String, String> dayTimeMappings = {
    'sunny': 'assets/svg/sunny.svg',
    'mostly sunny': 'assets/svg/sunny.svg',
    'partly sunny': 'assets/svg/partly_sunny.svg',
    'clouds and sun': 'assets/svg/partly_sunny.svg',
    'some clouds': 'assets/svg/partly_sunny.svg',
    'intermittent clouds': 'assets/svg/partly_sunny.svg',
    'mostly cloudy': 'assets/svg/partly_sunny.svg',
    'hazy sunshine': 'assets/svg/hazy_sunshine.svg',
    'cloudy': 'assets/svg/cloudy.svg',
    'light rain': 'assets/svg/rain.svg',
    'rain': 'assets/svg/rain.svg',
    'showers': 'assets/svg/rain.svg',
    'thunderstorm': 'assets/svg/thunderstorm.svg',
    'thunderstorms': 'assets/svg/thunderstorm.svg',
    'mostly cloudy w/ t-storms': 'assets/svg/thunderstorm.svg',
    'partly sunny w/ t-storms': 'assets/svg/thunderstorm.svg',
    'partly cloudy w/ t-storms': 'assets/svg/thunderstorm.svg',
    'snow': 'assets/svg/snow.svg',
    'fog': 'assets/svg/fog.svg',
    'mostly cloudy w/ snow': 'assets/svg/snow.svg',
    'ice': 'assets/svg/snow.svg',
  };

  final Map<String, String> nightTimeMappings = {
    'clear': 'assets/svg/clear.svg',
    'mostly clear': 'assets/svg/clear.svg',
    'partly cloudy': 'assets/svg/partly_cloudy.svg',
    'some clouds': 'assets/svg/partly_cloudy.svg',
    'intermittent clouds': 'assets/svg/partly_cloudy.svg',
    'mostly cloudy': 'assets/svg/partly_cloudy.svg',
    'hazy moonlight': 'assets/svg/hazy_clouds.svg',
    'cloudy': 'assets/svg/cloudy.svg',
    'light rain': 'assets/svg/rain.svg',
    'rain': 'assets/svg/rain.svg',
    'showers': 'assets/svg/rain.svg',
    'thunderstorm': 'assets/svg/thunderstorm.svg',
    'thunderstorms': 'assets/svg/thunderstorm.svg',
    'mostly cloudy w/ t-storms': 'assets/svg/thunderstorm.svg',
    'partly sunny w/ t-storms': 'assets/svg/thunderstorm.svg',
    'partly cloudy w/ t-storms': 'assets/svg/thunderstorm.svg',
    'snow': 'assets/svg/snow.svg',
    'fog': 'assets/svg/fog.svg',
    'mostly cloudy w/ snow': 'assets/svg/snow.svg',
    'ice': 'assets/svg/snow.svg',
  };

  final mappings = isDayTime ? dayTimeMappings : nightTimeMappings;
  return mappings.containsKey(text) ? mappings[text] : 'assets/svg/cloudy.svg';
}
