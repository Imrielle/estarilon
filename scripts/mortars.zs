import mods.advancedmortars.Mortar;

// Yellow Dye
Mortar.addRecipe(["wood"], <minecraft:dye:11>, 1, [<minecraft:yellow_flower>]);
Mortar.addRecipe(["stone"], <minecraft:dye:11>, 2, [<minecraft:yellow_flower> * 2]);
Mortar.addRecipe(["iron"], <minecraft:dye:11>, 3, [<minecraft:yellow_flower> * 3]);
Mortar.addRecipe(["diamond"], <minecraft:dye:11>, 4, [<minecraft:yellow_flower> * 4]);

// Light Blue Dye
Mortar.addRecipe(["wood", "stone", "iron", "diamond"], <minecraft:dye:12>, 1, [<minecraft:red_flower:1>]);