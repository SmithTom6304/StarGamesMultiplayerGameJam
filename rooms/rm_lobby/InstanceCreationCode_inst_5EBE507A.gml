

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

"This is NOT your conventional racing game:\n" +
"- Collect flags\n" +
"- Steal from your enemies\n" +
"- Finish with most flags\n" +
"- Control using [WASD] or arrow keys + space\n" +
"\n" +
"                     '...race for your lives!!'";
