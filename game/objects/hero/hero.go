components {
  id: "base"
  component: "/game/objects/hero/hero.script"
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
    id: "go_time"
    value: "0.7"
    type: PROPERTY_TYPE_NUMBER
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
    value: "Object"
    type: PROPERTY_TYPE_HASH
  }
}
embedded_components {
  id: "spinemodel"
  type: "spinemodel"
  data: "spine_scene: \"/game/objects/hero/hero.spinescene\"\n"
  "default_animation: \"idle_bad\"\n"
  "skin: \"\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  "material: \"/main/materials/scaleSprite.material\"\n"
  ""
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
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "tile_set: \"/graphics/atlases/hero.atlas\"\n"
  "default_animation: \"shadow\"\n"
  "material: \"/main/materials/scaleSprite.material\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  ""
  position {
    x: 20.0
    y: 0.0
    z: -1.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
