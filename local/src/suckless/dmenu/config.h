/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"scientifica:size=8:style=Medium:antialias=true:autohint=true"
};
static const char *prompt   = NULL;      /* -p  option; prompt to the left of input field */
static const char col_white[]   = "#ffffff";
static const char col_black[]   = "#1f1f1f";
static const char col_gray1[]   = "#424242";
static const char col_gray2[]   = "#757575";
static const char *colors[SchemeLast][2] = {
	/*               fg         bg       */
	[SchemeNorm] = { col_white, col_black },
	[SchemeSel]  = { col_white, col_gray1 },
	[SchemeOut]  = { col_white, col_gray2 },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
