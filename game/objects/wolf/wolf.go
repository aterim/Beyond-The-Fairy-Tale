components {
  id: "base"
  component: "/game/objects/wolf/wolf.script"
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
  id: "blockGO"
  component: "/game/baseScripts/blockGameObject.script"
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
    id: "type"
    value: "1.0"
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
  data: "spine_scene: \"/game/objects/wolf/wolf.spinescene\"\n"
  "default_animation: \"normal_idle\"\n"
  "skin: \"old\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  "material: \"/main/materials/scaleSpriteWithShadow.material\"\n"
  ""
  position {
    x: 4.9376554
    y: 1.28475
    z: 0.0
  }
  rotation {
    x: 0.0
    y: 0.0
    z: 0.0
    w: 1.0
  }
}
