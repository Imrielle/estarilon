import mods.artisanworktables.builder.RecipeBuilder;

// Remove vanilla recipes
#recipes.remove(<minecraft:leather_boots>);
#recipes.remove(<minecraft:leather_helmet>);
#recipes.remove(<minecraft:leather_chestplate>);
#recipes.remove(<minecraft:leather_leggings>);

RecipeBuilder.get("tailor")
  .setShaped([
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>]])
  .addOutput(<minecraft:leather_chestplate>)
  .addTool(<ore:artisansNeedle>, 10)
  .create();

RecipeBuilder.get("tailor")
  .setShaped([
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_leggings>)
  .addTool(<ore:artisansNeedle>, 10)
  .create();

RecipeBuilder.get("tailor")
  .setShaped([
    [null, null, null],
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_boots>)
  .addTool(<ore:artisansNeedle>, 5)
  .create();

RecipeBuilder.get("tailor")
  .setShaped([
    [null, null, null],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_helmet>)
  .addTool(<ore:artisansNeedle>, 5)
  .create();

RecipeBuilder.get("tailor")
  .setShaped([
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:saddle>)
  .addTool(<ore:artisansNeedle>, 10)
  .create();