const unsigned int interval = 1000;
static const char unknown_str[] = "n/a";

#define MAXLEN 2048

static const struct arg args[] = {
	{ cpu_perc, "  %s%% | ", NULL },
	{ ram_perc, " %s%% | ", NULL },
	{ datetime, " %s | ", "%d/%m/%Y" },
	{ datetime, " %s", "%H:%M" },
};
