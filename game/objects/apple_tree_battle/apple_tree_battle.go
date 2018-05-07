components {
  id: "base"
  component: "/game/objects/apple_tree/apple_tree.script"
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
  data: "spine_scene: \"/game/objects/apple_tree_battle/apple_tree_batlle.spinescene\"\n"
  "default_animation: \"battle_idle\"\n"
  "skin: \"\"\n"
  "blend_mode: BLEND_MODE_ALPHA\n"
  "material: \"/main/materials/scaleSpriteWithShadow.material\"\n"
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
