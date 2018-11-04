import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

val iron = <ore:ingotIron>;
val stick = <ore:stickWood>;

//== Remove the original ==
//recipes.remove(<inspirations:north_compass:0>);
//recipes.remove(<inspirations:cactus_seeds>);
//recipes.remove(<animania:block_straw>);

//== Add Replacements ==
//recipes.addShaped(<inspirations:north_compass:0>, [[null, iron, null],[iron, stick, iron],[null, iron, null]]);
//recipes.addShaped(<animania:block_straw> * 3, [[null, null, null],[null, null, null],[<minecraft:wheat>, <minecraft:wheat>, <minecraft:wheat>]]);