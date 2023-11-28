/// All the tails that are available in BattleSnake.
///
/// Note some tails may only be used if they are awarded.
enum Tails {
  /**
   * The default tail.
   */
  defaultTail,

  /**
   * The standard set of tail customizations available to everyone.
   */
  blockBum,
  bolt,
  curled,
  fatRattle,
  freckle,
  hook,
  pixel,
  roundBum,
  sharp,
  skinny,
  smallRattle,

  /**
   * Designed by friends and partners of Battlesnake!
   */
  rbcNecktie,
  replitNotmark,

  /**
   * Designed by the community for everyone to use.
   */
  mysticMoon,

  /**
   * Released for the Battlesnake Winter Classic 2019 tournament.
   * Available for everyone.
   */
  bonhomme,
  flake,
  iceSkate,
  present,

  /**
   * Released for the 2020 Stay Home and Code competition.
   * Available for everyone.
   */
  coffee,
  mouse,
  weight,
  tigerTail,
  
  /**
   * Rewards for Fall League 2020 Challenge Arenas.
   */
  leaf,
  pumpkin,

  /**
   * Awarded to members throughout the 2021 Battlesnake Competitive Season.
   */
  alligator,
  comet,
  fish,
  flame,
  football,
  iguana,
  ion,
  missile,
  shinnyJeans,
  snail,
  tire,
  virus,

  /**
   * Tail rewards for competing in the Spring League 2021 competition.
   */
  ghost,
  pixelRound,
  swirl,
  swoop,

  /**
   * Tail rewards for Summer League 2021.
   */
  rattle,
  rocket,

  /**
   * Rewards for Fall League 2021.
   */
  offroad,
  shiny,
}

extension TailValues on Tails {
  /// Handles the fact that we cannot set default values in enums in dart.
  ///
  /// Instead, we will call stringValue to grab the hyphenated string value that
  /// the api expects.
  String get unsanitizedStringValue {
    switch (this) {
      case Tails.defaultTail: return 'default';
      case Tails.blockBum: return 'block-bum';
      case Tails.fatRattle: return 'fat-rattle';
      case Tails.roundBum: return 'round-bum';
      case Tails.smallRattle: return 'small-rattle';
      case Tails.rbcNecktie: return 'rbc-necktie';
      case Tails.replitNotmark: return 'replit-notmark';
      case Tails.mysticMoon: return 'mystic-moon';
      case Tails.iceSkate: return 'ice-skate';
      case Tails.tigerTail: return 'tiger-tail';
      case Tails.shinnyJeans: return 'shinny-jeans';
      case Tails.pixelRound: return 'pixel-round';
      default:
        return this.name;
    }
  }
}
