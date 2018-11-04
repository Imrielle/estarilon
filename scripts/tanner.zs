import mods.artisanworktables.builder.RecipeBuilder;

// Remove vanilla recipes
recipes.remove(<minecraft:leather_boots>);
recipes.remove(<minecraft:leather_helmet>);
recipes.remove(<minecraft:leather_chestplate>);
recipes.remove(<minecraft:leather_leggings>);

RecipeBuilder.get("tanner")
  .setShaped([
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>]])
  .addOutput(<minecraft:leather_chestplate>)
  .addTool(<ore:artisansPunch>, 10)
  .create();

RecipeBuilder.get("tanner")
  .setShaped([
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_leggings>)
  .addTool(<ore:artisansPunch>, 10)
  .create();

RecipeBuilder.get("tanner")
  .setShaped([
    [null, null, null],
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_boots>)
  .addTool(<ore:artisansPunch>, 5)
  .create();

RecipeBuilder.get("tanner")
  .setShaped([
    [null, null, null],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:leather_helmet>)
  .addTool(<ore:artisansPunch>, 5)
  .create();

RecipeBuilder.get("tanner")
  .setShaped([
    [<minecraft:leather>, null, <minecraft:leather>],
    [<minecraft:leather>, <minecraft:leather>, <minecraft:leather>],
    [<minecraft:leather>, null, <minecraft:leather>]])
  .addOutput(<minecraft:saddle>)
  .addTool(<ore:artisansPunch>, 10)
  .create();