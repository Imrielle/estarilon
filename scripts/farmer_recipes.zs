import mods.artisanworktables.builder.RecipeBuilder;

RecipeBuilder.get("blacksmith")
  .setShaped([
    [null, null, null],
    [null, null, null],
    [<minecraft:wheat>, <minecraft:wheat>, <minecraft:wheat>]])
  .addOutput(<animania:block_straw> * 3)
  .addTool(<ore:artisansNeedle>, 10)
  .create();