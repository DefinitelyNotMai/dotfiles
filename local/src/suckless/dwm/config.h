/* See LICENSE file for copyright and license details. */
#include <X11/XF86keysym.h>
/* appearance */
static const unsigned int borderpx  = 2;
static const unsigned int snap      = 32;
static const int showbar            = 1;
static const int topbar             = 1;
static const char *fonts[]          = { "scientifica:size=8:style=Medium:antialias=true:autohint=true", "Symbols Nerd Font:size=8:antialias=true:autohint=true" };
static const char col_white[]       = "#ffffff";
static const char col_black[]       = "#1f1f1f";
static const char col_gray1[]       = "#424242";
static const char col_gray2[]       = "#757575";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_white, col_black, col_black },
	[SchemeSel]  = { col_white, col_gray1, col_gray2 },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "KeePassXC",  NULL,       NULL,       0,            1,           -1 },
	{ "Otpclient",  NULL,       NULL,       0,            1,           -1 },
};

/* layout(s) */
static const float mfact        = 0.55;
static const int nmaster        = 1;
static const int resizehints    = 1;
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const Layout layouts[] = {
	{ "[T]",    tile },
	{ "[F]",    NULL },
	{ "[M]",    monocle },
};

#define M Mod4Mask
#define A Mod1Mask
#define S ShiftMask
#define C ControlMask
#define TAGKEYS(KEY,TAG) \
    { M,        KEY,    view,           {.ui = 1 << TAG} }, \
    { M|C,      KEY,    toggleview,     {.ui = 1 << TAG} }, \
    { M|S,      KEY,    tag,            {.ui = 1 << TAG} }, \
    { M|C|S,    KEY,    toggletag,      {.ui = 1 << TAG} },
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

static Key keys[] = {
    /* window controls */
	{ M,    XK_backslash,   togglebar,      {0} },
	{ M,    XK_j,           focusstack,     {.i = +1 } },
	{ M,    XK_k,           focusstack,     {.i = -1 } },
	{ M,    XK_o,           incnmaster,     {.i = +1 } },
	{ M|S,  XK_o,           incnmaster,     {.i = -1 } },
	{ M,    XK_h,           setmfact,       {.f = -0.05} },
	{ M,    XK_l,           setmfact,       {.f = +0.05} },
	{ M,    XK_space,       zoom,           {0} },
	{ M,    XK_Tab,         view,           {0} },
	{ M|S,  XK_q,           killclient,     {0} },
    /* layout controls */
	{ M,    XK_t,           setlayout,      {.v = &layouts[0]} },
	{ M,    XK_f,           setlayout,      {.v = &layouts[1]} },
	{ M|S,  XK_t,           setlayout,      {.v = &layouts[2]} },
	{ M|S,  XK_space,       togglefloating, {0} },
    /* monitor controls */
	{ M,    XK_comma,       focusmon,       {.i = -1 } },
	{ M,    XK_period,      focusmon,       {.i = +1 } },
	{ M|S,  XK_comma,       tagmon,         {.i = -1 } },
	{ M|S,  XK_period,      tagmon,         {.i = +1 } },
    /* dmenu-specific commands */
    { M,    XK_d,           spawn,          SHCMD("dmenu_run") },
    { M,    XK_Escape,      spawn,          SHCMD("dmenu-stat") },
    { M|S,  XK_Escape,      spawn,          SHCMD("dmenu-sys") },
    { M,    XK_grave,       spawn,          SHCMD("dmenu-mount") },
    { M|S,  XK_grave,       spawn,          SHCMD("dmenu-umount") },
    /* dunst controls */
    { M,    XK_slash,       spawn,          SHCMD("dunstctl close") },
    { M|S,  XK_slash,       spawn,          SHCMD("dunstctl close-all") },
    { M|C,  XK_slash,       spawn,          SHCMD("dunstctl history-pop") },
    { M|A,  XK_slash,       spawn,          SHCMD("dunstctl context") },
    /* scrot controls */
    { M,    XK_Print,       spawn,          SHCMD("scrot /mnt/slowboi/pictures/scrot-screenshots/%Y-%m-%d-%T.png") },
    { M|S,  XK_Print,       spawn,          SHCMD("scrot -s /mnt/slowboi/pictures/scrot-screenshots/%Y-%m-%d-%T.png") },
    /* terminal and terminal apps */
    { M,    XK_Return,      spawn,          SHCMD("st") },
    { M,    XK_r,           spawn,          SHCMD("st -e lfrun") },
    { M,    XK_a,           spawn,          SHCMD("st -e htop") },
    { M|S,  XK_a,           spawn,          SHCMD("st -e nmtui") },
    { M|C,  XK_F2,          spawn,          SHCMD("st -e bc") },
    { M,    XK_n,           spawn,          SHCMD("st -e newsboat") },
    { M|C,  XK_v,           spawn,          SHCMD("st -e pulsemixer") },
    /* ncmpcpp and mpd */
    { M,    XK_m,           spawn,          SHCMD("st -e ncmpcpp") },
    { M|S,  XK_m,           spawn,          SHCMD("mpd") },
    { M|A,  XK_m,           spawn,          SHCMD("killall mpd") },
    /* brightness & volume controls */
    { 0,    XF86XK_MonBrightnessDown,   spawn,  SHCMD("brightnessctl set 5%-") },
    { 0,    XF86XK_MonBrightnessUp,     spawn,  SHCMD("brightnessctl set 5%+") },
    /* app keybinds */
    { M|S,  XK_w,           spawn,          SHCMD("brave") },
    { M,    XK_w,           spawn,          SHCMD("torbrowser-launcher") },
    { M|S,  XK_r,           spawn,          SHCMD("pcmanfm") },
    { M,    XK_F1,          spawn,          SHCMD("keepassxc") },
    { M|S,  XK_F1,          spawn,          SHCMD("otpclient") },
    { M|C,  XK_F1,          spawn,          SHCMD("virtualbox") },
    { M,    XK_F2,          spawn,          SHCMD("freetube") },
    { M|S,  XK_F2,          spawn,          SHCMD("obs-studio") },
    { M|C,  XK_x,           spawn,          SHCMD("slock") },
    /* tag controls */
	{ M,    XK_0,           view,           {.ui = ~0 } },
	{ M|S,  XK_0,           tag,            {.ui = ~0 } },
	TAGKEYS(    XK_1,                           0)
	TAGKEYS(    XK_2,                           1)
	TAGKEYS(    XK_3,                           2)
	TAGKEYS(    XK_4,                           3)
	TAGKEYS(    XK_5,                           4)
	TAGKEYS(    XK_6,                           5)
	TAGKEYS(    XK_7,                           6)
	TAGKEYS(    XK_8,                           7)
	TAGKEYS(    XK_9,                           8)
};

static Button buttons[] = {
	{ ClkClientWin,     M,      Button1,    movemouse,      {0} },
	{ ClkClientWin,     M,      Button3,    resizemouse,    {0} },
};
