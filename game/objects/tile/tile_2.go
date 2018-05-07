components {
  id: "base"
  component: "/game/objects/tile/tile.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
components {
  id: "renderOrder"
  component: "/game/baseScripts/renderOrder.script"
  position {
    x: 0.0
    y: 0.0
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
  properties {
    id: "layer"
    value: "Tile"
    type: PROPERTY_TYPE_HASH
  }
}
embedded_components {
  id: "selector"
  type: "sprite"
  data: "tile_set: \"/graphics/atlases/tiles.atlas\"\n"
  "default_animation: \"tileSelect\"\n"
  "material: \"/main/materials/scaleSpriteWithShadow.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.0
    y: 0.0
    z: 1.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/graphics/atlases/tile_2.atlas\"\n"
  "default_animation: \"tiles0030\"\n"
  "material: \"/main/materials/scaleSpriteWithShadow.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 0.4526749
    y: -24.444445
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
