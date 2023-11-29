/// Game maps are defined in the BattlesnakeOfficial/rules repo, inside the maps package.
///
/// https://docs.battlesnake.com/api/objects/game-maps
enum GameMap {
  /// Standard snake placement and food spawns
  standard,

  /// Standard snake placement with no food spawns
  empty,

  /// Arcade Maze
  arcadeMaze,

  /// Royale
  royale,

  /// Solo Maze where you need to find the food
  soloMaze,

  /// Inner border
  hzInnerWall,

  /// Concentric Rings
  hzRings,

  /// Columns
  hzColumns,

  /// Rivers and Bridges
  hzRiversBridge,

  /// Spiral
  hzSpiral,

  /// Scatter
  hzScatter,

  /// Directional Expanding Box
  hzGrowBox,

  /// Expanding Box
  hzExpandBox,

  /// Expanding Scatter
  hzExpandScatter,
}

extension GameMapExtensions on GameMap {
  String get jsonName {
    switch (this) {
      case GameMap.standard:
        return 'standard';
      case GameMap.empty:
        return 'empty';
      case GameMap.arcadeMaze:
        return 'arcade_maze';
      case GameMap.royale:
        return 'royale';
      case GameMap.soloMaze:
        return 'solo_maze';
      case GameMap.hzInnerWall:
        return 'hz_inner_wall';
      case GameMap.hzRings:
        return 'hz_rings';
      case GameMap.hzColumns:
        return 'hz_columns';
      case GameMap.hzRiversBridge:
        return 'hz_rivers_bridge';
      case GameMap.hzSpiral:
        return 'hz_spiral';
      case GameMap.hzScatter:
        return 'hz_scatter';
      case GameMap.hzGrowBox:
        return 'hz_grow_box';
      case GameMap.hzExpandBox:
        return 'hz_expand_box';
      case GameMap.hzExpandScatter:
        return 'hz_expand_scatter';
    }
  }
}
