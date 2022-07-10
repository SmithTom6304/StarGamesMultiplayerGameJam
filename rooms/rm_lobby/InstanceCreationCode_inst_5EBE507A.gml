

draw = function() {
	draw_self();
	drawTitle();
	drawContents();
}

title = "SOME GAME RULES";
titleFont = fntTitle;

contentsFont = fntMedium;
contentsHOffset = 30;
contentsVOffset = 35;

contents = 

"- Collect flags (+1 point each)\n" +
"- Steal from your enemies (+2 points each)\n" +
"- Catch the first flag of the round (+5 points)\n" +
"- Finish with most flags (+5 points)\n" +
"- No collisions (+3 points)\n" +
"\n" +
"- Control using [WASD] or arrow keys + space";
