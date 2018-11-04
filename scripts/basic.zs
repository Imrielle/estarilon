import mods.artisanworktables.builder.RecipeBuilder;

// Sifter recipes
RecipeBuilder.get("basic")
  .setShapeless([<minecraft:dirt>])
  .addOutput(<minecraft:cobblestone>, 90)
  .addOutput(<minecraft:diamond>, 10)
  .addTool(<ore:artisansSifter>, 10)
  .create();