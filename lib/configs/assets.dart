class Assets {
  static final images = AppImageAssets();
  static final icons = AppIcons();
}

class AppFont {
  static const appFONT = 'Proxima-Nova';
}

class AppImageAssets {
  static const String root = "assets/images";
  final String background = "$root/background.png";
  final String bgGradient = "$root/bg_gradient.png";
  final String next = "$root/next.png";
  final String cards = "$root/cardsIcon.png";
  final String record = "$root/record.png";
  final String chat = "$root/chatIcon.png";
  final String flame = "$root/flameIcon.png";
  final String user = "$root/userIcon.png";
  final String profile_pic = "$root/profile_pic.png";
  final String optionIcon = "$root/optionIcon.png";
  final String dropdownIcon = "$root/dropdownIcon.png";
}

class AppIcons {
  static const String root = "assets/icons";
  final String personIcon = "$root/personIcon.png";
  final String timerIcon = "$root/timerIcon.png";
}
