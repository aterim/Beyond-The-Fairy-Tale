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
components {
  id: "script"
  component: "/game/objects/tree/spruce.script"
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
    id: "opened"
    value: "false"
    type: PROPERTY_TYPE_BOOLEAN
  }
}
components {
  id: "script1"
  component: "/game/baseScripts/heroHide.script"
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
  id: "spinemodel"
  type: "spinemodel"
  data: "spine_scene: \"/game/objects/tree/spruce.spinescene\"\n"
  "default_animation: \"pine_small\"\n"
  "skin: \"spruce_pyramid\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  "material: \"/main/materials/scaleSpriteWithShadow.material\"\n"
  ""
  position {
    x: 0.0
    y: -9.90354
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
