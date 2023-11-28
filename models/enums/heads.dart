enum Heads {
  /**
   * The default head.
   */
  defaultValue,

  /**
   * The standard set of head customizations available to everyone.
   */
  beluga,
  bendr,
  dead,
  evil,
  fang,
  pixel,
  sandWorm,
  safe,
  shades,
  silly,
  smile,
  tongue,
  
  /**
   * Designed by friends and partners of Battlesnake!
   */
  repitMark,
  
  /**
   * Designed by the community for everyone to use.
   */
  allSeeing,
  smartCaterpillar,
  transRightsScarf,

  /**
   * Released for the Battlesnake Winter Classic 2019 tournament.
   * Available for everyone.
   */
  bonhomme,
  earmuffs,
  rudolph,
  scarf,
  ski,
  snowWorm,
  snowman,

  /**
   * Released for the 2020 Stay Home and Code competition.
   * Available for everyone.
   */
  caffeine,
  gamer,
  workout,
  tigerKing,

  /**
   * Rewards for Fall League 2020 Challenge Arenas
   */
  jackolantern,
  pumpkin,

  /**
   * Awarded to members throughout the 2021 Battlesnake Competitive Season.
   */
  alligator,
  comet,
  football,
  iguana,
  laternFish,
  missile,
  mask,
  motoHelment,
  moustache,
  snail,
  rocketHelmet,
  spaceHelmet,
  
  /**
   * Head rewards for competing in the Spring League 2021 competition.
   */
  chomp,
  pixelRound,
  rbcBowler,
  sneaky,
  orca,
  
  /**
   * Head rewards for Summer League 2021.
   */
  villian,
  viper,
  
  /**
   * Rewards for Fall League 2021.
   */
  happy,
  whale,
}

extension HeadValues on Heads {
  /// Handles the fact that we cannot set default values in enums in dart.
  ///
  /// Instead, we will call stringValue to grab the hyphenated string value that
  /// the api expects.
  String get unsanitizedStringValue {
    switch (this) {
      case Heads.defaultValue: return 'default';
      case Heads.rbcBowler: return 'rbc-bowler';
      case Heads.sandWorm: return 'sand-worm';
      case Heads.allSeeing: return 'all-seeing';
      case Heads.smartCaterpillar: return 'smart-caterpillar';
      case Heads.transRightsScarf: return 'trans-rights-scarf';
      case Heads.snowWorm: return 'snow-worm';
      case Heads.tigerKing: return 'tiger-king';
      case Heads.motoHelment: return 'moto-helmet';
      case Heads.rocketHelmet: return 'rocket-helmet';
      case Heads.spaceHelmet: return 'space-helmet';
      default:
        return this.name;
    }
  }
}

/// TODO: fromString/toString/fromJson/toJson should TitleCase the values
/// TODO: stringValue of defaultHead is 'default'
/// export type CommunityHeads =