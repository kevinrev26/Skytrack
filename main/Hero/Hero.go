components {
  id: "Hero"
  component: "/main/Hero/Hero.script"
}
embedded_components {
  id: "sprite"
  type: "sprite"
  data: "default_animation: \"Idle\"\n"
  "material: \"/builtins/materials/sprite.material\"\n"
  "textures {\n"
  "  sampler: \"texture_sampler\"\n"
  "  texture: \"/main/Hero/Hero.atlas\"\n"
  "}\n"
  ""
}
