/* user and group to drop privileges to */
static const char *user  = "mai";
static const char *group = "mai";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#1f1f1f",     /* after initialization */
	[INPUT] =  "#424242",   /* during input */
	[FAILED] = "#ff0000",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
