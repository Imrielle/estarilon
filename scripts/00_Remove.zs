import crafttweaker.item.IItemStack;

val RemoveArray = [
  <rustic:painted_wood_cyan>,
  <rustic:painted_wood_white>,
  <rustic:painted_wood_orange>,
  <rustic:painted_wood_magenta>,
  <rustic:painted_wood_light_blue>,
  <rustic:painted_wood_yellow>,
  <rustic:painted_wood_lime>,
  <rustic:painted_wood_pink>,
  <rustic:painted_wood_gray>,
  <rustic:painted_wood_silver>,
  <rustic:painted_wood_cyan>,
  <rustic:painted_wood_purple>,
  <rustic:painted_wood_blue>,
  <rustic:painted_wood_brown>,
  <rustic:painted_wood_green>,
  <rustic:painted_wood_red>,
  <rustic:painted_wood_black>
] as IItemStack[];

for item in RemoveArray {
    recipes.remove(item);
}
