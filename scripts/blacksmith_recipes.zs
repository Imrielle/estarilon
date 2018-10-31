import mods.artisanworktables.builder.RecipeBuilder;

RecipeBuilder.get("blacksmith")
  .setShaped([
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:saddle>)
  .addTool(<ore:artisansNeedle>, 10)
  .create();