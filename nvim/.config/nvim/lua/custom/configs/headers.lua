math.randomseed(os.time())
local headers = {
	default = {
		"                ▄ ▄                        ",
		"            ▄   ▄▄▄     ▄ ▄▄▄ ▄ ▄          ",
		"            █ ▄ █▄█ ▄▄▄ █ █▄█ █ █          ",
		"         ▄▄ █▄█▄▄▄█ █▄█▄█▄▄█▄▄█ █          ",
		"       ▄ █▄▄█ ▄ ▄▄ ▄█ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄       ",
		"       █▄▄▄▄ ▄▄▄ █ ▄ ▄▄▄ ▄ ▄▄▄ ▄ ▄ █ ▄     ",
		"     ▄ █ █▄█ █▄█ █ █ █▄█ █ █▄█ ▄▄▄ █ █     ",
		"     █▄█ ▄ █▄▄█▄▄█ █ ▄▄█ █ ▄ █ █▄█▄█ █     ",
		"         █▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄█ █▄█▄▄▄█         ",
	},
	nvim = {
		"                                                    ",
		" ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
		" ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
		" ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
		" ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
		" ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
		" ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	},
	nvchad = {
		"███▄    █ ██▒   █▓ ▄████▄   ██░ ██  ▄▄▄      ▓█████▄ ",
		"██ ▀█   █▓██░   █▒▒██▀ ▀█  ▓██░ ██▒▒████▄    ▒██▀ ██▌",
		"██  ▀█ ██▒▓██  █▒░▒▓█    ▄ ▒██▀▀██░▒██  ▀█▄  ░██   █▌",
		"██▒  ▐▌██▒ ▒██ █░░▒▓▓▄ ▄██▒░▓█ ░██ ░██▄▄▄▄██ ░▓█▄   ▌",
		"██░   ▓██░  ▒▀█░  ▒ ▓███▀ ░░▓█▒░██▓ ▓█   ▓██▒░▒████▓ ",
		" ▒░   ▒ ▒   ░ ▐░  ░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒▒   ▓▒█░ ▒▒▓  ▒ ",
		" ░░   ░ ▒░  ░ ░░    ░  ▒    ▒ ░▒░ ░  ▒   ▒▒ ░ ░ ▒  ▒ ",
		"  ░   ░ ░     ░░  ░         ░  ░░ ░  ░   ▒    ░ ░  ░ ",
		"        ░      ░  ░ ░       ░  ░  ░      ░  ░   ░    ",
		"              ░   ░                           ░      ",
	},
	face1 = {
		"       ░▒▒▒▒▒▒▓▓▓▓▓▓▓▒▒▓▓▒▓██▒▓▓▓▒▒░░▓██▓▓▓▓▒▒░▒▀▒▒▒▒░░░      ▒ ░▒░ ▒░ ▒▒       ",
		"   ░  ▒▒░▒▒▒▒▒▓▒▓▒▓▒▒░▓▓▒▒▒██▓▓▓▓▒██░▐█▓▓▓▓▓▀▒░░▒░ ░ ▒░░░░    ░▒ ▒▒▒▒░▒  ▒      ",
		"     ░▌▒░▓▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▓▓██▌ ▓▓▓▓░▒░ ░░░░▒   ░        ░▒ ▒▒▒▒▒   ▒     ",
		"     ▐▒▒░▓▒▒▒▌▒▒▒▒▒▒▒▒▌▒▒▒▒▒▓▓▓▓▓▓▓██▒▒▒▓░▀▒░▒░░░░░▒   ░       ░░ ░▒▒▒▒    ░    ",
		"       ▒▒▒▒░▒▒▒▒▒▒▒▒▒▓▓▓▒▒▒▒▓▓▓▓▒▒▓▓▓▒░░▓░░ ▒░░▒░░ ░░            ▒ ▒▒▒▒         ",
		"       ▒▒▒▒▐▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓▓▐▒▒▒ ░░▒▓▓▓░   ░░▒░              ▒  ░░▒▒        ",
		"  ░    ▒▐▐▒ ░▒▒▌▓▓▓▒▓▒▓▓▒▒▒▓▒▓▓▓▓▒▐▌▓░░░▒▓▓▒▒▄    ░░░            ▒░  ▒▒▒        ",
		" ░░░   ▒▐▌▒  ▐▒▒▓▓▓▒▀ ░  ▒▒▒▐▒▓▓▓▒▒░▓░░░░▒▓▒░░▓▄                  ░  ▒▒░        ",
		"  ░ ░  ▒▓▀▒   ▒ ▓▓▓▒░  ░ ░▒▒ ░▒▒▓▓▐░ ▀░░  ▒░░░   ░░▒            ░ ░ ▐░▒░        ",
		"       ▒▓ ▒░░▐▓ ▐▓▒░  ░ ░░░ ▒  ▒▒░  ▒░ ▒░       ░                   ▒ ░    ▒    ",
		"       ▐▒ ░░░▐▓▒░▒▒░   ░ ░░  ░░  ▒  ░▒                   ▄▄▒ ▒ ░   ▒░ ░    ▒    ",
		"       ▐▌░ ░░▐▓▒▒░             ░   ░░▓▒░   ░   ░▀▀░      ▀▓▒   ░  ▒   ░     ▒   ",
		"        ▒ ▄   ▓░░                     ░▒░▒▄ ▐▓  ▄     ▐▄▓ ▓▒          ░     ▒░  ",
		"        ▒ ▒ ░ ▓▌░ ░        ░▒░░░      ▒▒▒░▒▓▓▓▐▓▓▄▓▌▓▓▓▓▓▓▓▒░         ░         ",
		"        ▐░  ░ ▓▓▒  ░  ▒░        ▄░░░░░▓███▓▓▓▓▒▓▓▓▓█▓▓▓▓▄▀▒▓                    ",
		"         ▒▒  ░▓▓▓▄    ░▒  ░▄ ░▒▓▓▓▓▓▓▓▓▓███▓▓▓▓▓▓▓▓▓▓▓▓▓▒▓▒░      ░             ",
		"          ▒   ▌ ▀▓ ▐  ░░▒▓▓▓▓▓▓▓▓▓▓▓▒░▓▓██▄▐▓▓▒▓▓▓▓▓▓▓▓▓▓▒░░      ░             ",
		"              ▀   ▓ ▓▌ ░▒▒▀▓▓▓▓▓▓▓▓▓▓▐▒▓███▓▓▓▒▓▓▓▓▓▓▓▓▓▓▒░░      ░             ",
		"                    ▓▒ ░░▒▒ ░▒▒▓▓▓▓▓▓▄    ░ ▄▄▌▓▓▓▓▓▓▓▒▒▒░░                     ",
		"            ░       █▌  ▐     ░▒▒▒▓▓▓▓▓▄▄  ▐▓▓█▓▓▓▓▓▓▓▒▒░                       ",
		"            ▐       █▌  █       ░░▒▓▓▓▓▓▀▀▀▀░░    ▄▓▒▒░░   ░                    ",
		"                   ▐▀   ▓         ░░ ░      ▄▄░▒░░▒▒▒░░   ░░       ░            ",
		"                        ░            ░    ░░▒░   ▄▓▓▓    ░░░░   ▄▄              ",
		"                                      ░      ▄▄▓▓▓▓▀   ░░░ ░▒▓▌ ▀               ",
		"                                        ▀▀▓▀▀▀▀▀      ░     ▒░                  ",
	},

	-- face2 = {
	-- 	"███▓█▓███▓█▓▓▀░░░                                   ░    ░░    ░░░ ░▐▓█▓████████",
	-- 	"████▒▒▒▌▒▓▒░░ ░▒░░                                             ░░░░░▐▒▐▄████████",
	-- 	"███▌▄▒▒▒░▒▒  ░▒                                                  ▀ ▓▄▌  ▓███████",
	-- 	"███▒░▒▒▓░▒▓  ░░         ░▒▒▒▓░                                         ▄▓█▓█████",
	-- 	"███▓▄▒▓▓▓▓▓▒           ▒▓▓▓▓▓▓▒                                        ░░▒▓▓████",
	-- 	"█████▌█░░░▀ ▄         ▒▓▓▓▓▓▓▓▓▒░                                     ░ ▒▓▓▓▓███",
	-- 	"████▀ ▓▒▒▓ ▒▒░        ▓▓▓▓█▓▓█▓▓▓▓▄                                 ▄   ▐▓▓▓████",
	-- 	"███▄▄░▓▓▓▓░░         ▓▓▓██▓██▓██▓▓▓▓▓▄▄                                ░░▓██████",
	-- 	"████▄▓▒▓▓ ▐░         ▓░    ▒▓█▓▓▓▓▒    ░░ ░▄                           ▒ ███████",
	-- 	"█████▓░▒▓ ░  ▒       ░░░░░░░░▒▓▓▓░     ░░░▒▀▒░░                        ▓▌▓██████",
	-- 	"█████▓▌▐▓▒  ▒              ░░▐▓▓▓▒░                                  ░▄▐▓▀██████",
	-- 	"█████▓▓░▓▓             ░░▒▒▓▓▓█▓▒▒▓▓▓░ ░░                            ▄▓▓░▓▓█████",
	-- 	"██████▓▓▌░░          ▐██████▓██▓▒▒████▓▄▄▄▄░▓▒▒                     ▐▓▓▓▒▐██████",
	-- 	"████████▓█░          ▓█████▓███▒▒▒▓███████▓▒▒▌░                  ░▒▄░▓▄▒▓ ██████",
	-- 	"████████▓▓▓▓▒░    ░  ▐▓████▒░░░░▒▒▒▓██████▓▓░░░                 ▒▓▄▐▓▓▄▒▐▐██████",
	-- 	"██████████▓▒░▒░       ▓▓███▌▄░ ░ ░▄▓███▓▓▓▓▓▒▒░                ▒▐▓▓▌ ▓▓  ▐██████",
	-- 	"███████▓█▓▓▓▒▒ ░       ▓▓███▓▒░░▓▓▓██▓▓▓▓▓▓▒▒░░               ▒░▐▓▓ ▓▐▀▄▐███████",
	-- 	"█████▓▓██▌▓▓▓           ▓▓▓▒       ░▀▓▓▓▒▒▓▒░░  ░             ░░▓▓▀▓▒ ▓▒▓███████",
	-- 	"█████▓▓██▓▄▀▌            ▓▒▒▒▒░░░░▒▒▓▓▒▓▒▒▒▒▒  ░              ▄▓▓▀▒ ▄▓▒█████████",
	-- 	"█████▓▓███▓▓▌             ▒▒▒░░░░▒▒▒▓▒▒▒▒▒░░                 ▐▓▓▓░ ▀░▄▓█████████",
	-- 	"██████▓████▓█ ░             ▒▓▓▓▓▓▓▓▒▒▒░       ░░           ▒▓▓▓▒  ▐▓▓█▓███████▓",
	-- 	"████▓▓███▓▓▓▓▄▄              ░▒▒▀▒▒▒▒        ░░▒░░░ ░       ▓▓▓▓▓▄ ▀█▓▓▓█▓▓▓▓▓▓▓",
	-- 	"████▓▓▀▓▌▓▓▒▒░      ░                        ░▒▒░░░░░ ▒▄     ░▓▌▓▓▓░░▓▓▓█▓▓▓▓▓▓▓",
	-- 	"█████▄█▓▓▀   ▄      ░░                     ░ ░▒▒▒▒▒ ▒  ▓▓▄     ▓▓▓▓░▄▓▓▓▓▓▓▓▓▓▓▓",
	-- 	"████▌▓░░░         ▐                           ░░▒ ▄▐▒░ ▓▓▓▓ ▒  ▒▓▒▓▒▓▓▓▓▓▓█▓▓▓▓▓",
	-- 	"▓██▓▓▒▒▒▒▒▒  ░░                         ░    ░░▒▒▒▒ ▒▒  ▓▓▓  ▒▄░▀▒▒▓▓▓▓▀▓▓█▓▓▓▓▓",
	-- 	"█▀▀▒▒▓▓▓▒▒▒▒░  ▒░▒░░                       ░░░▒▒░░▒ ▒▒  ▐█▌  ▒▓▓░░▄▓▓▓▓▌▀▓▓▓▓▓▓▓",
	-- 	"▌ ▒▒░░ ░░░                                     ░▒▒▒▌░▒  ▐▒  ▄  ░░▒▄▓▓▓▓▓▓▓▓▓▓▓▓▓",
	-- 	"█▓▓▓███▓▓████▓█▄▄                                 ░░  ░░ ░▀▌▓▒▄░▐▒▒▒▀▒▓▓▓▓▓▓▓▓▓▓",
	-- 	"████████████████████▄▄▄ ▄                       ░░▒▌           ▀  ▓▓▒▓▓▓▓▓▓▓▓▓▓▓",
	-- },

	face3 = {
		"▒▓▒░██▓█▌ ░░▓▓▓▓▒▒▌   ▐▓▓▓▓▓▓▌█▓▒▒▓▓▓▓▓▓▒ ░░▒░░  ▐     ░ ░▒▒██████▓░▓▓██▓▒▒▀▓██▒",
		" ░░▐▓███░ ░░░▓▒▓▓▒▓    ▓▓▓▓▓▓▌▒▒▒▒▒▓▓▓▓█▒▒▒▒░ ░       ░▒▒▒▒▒▓█▓▒▀▀█▓▒▀██▒▒▒▒▒▓██",
		"░  ▓███▌  ░▒▐▓▒▓░▒▓    ░       ░░▒▒▓▓█████▓░░  ▓▀░  ░▒▓▓▓▓█▌▒▒█▓▓▒░▒▓░▐▓▓▒▒░▒▒▒▓",
		"   ▓█▓▌░░▒░▒▓▌▒▒░░▒    ▒▒▒▒▒▒░░░░░░░▒████████▓▒▒▒▒▓▓▓▓█▓▓█▓█▒▒░██▓▓▒▓░░░▀▒▒▒░▓▓▓",
		" ░ ▓█▓▓▌▐▄▓█▒▒▓▒░░▒    ░░         ░▒▒████████████████████▓▓▓▐▓▒▒▀█▒▓▓▒░ ░ ▐▒▒▒▒▒",
		"▓▄▄▓█████▒░░▒▒▒░░░   ░     ▒▓▒░▒▒▒▒▓▓▓███████████████████▓▓▓▐▓░░▒░▀▓▓▓▒▒░░  ▀▒▒▓",
		"▓▒░▐▓▓▓░▓▒▒▒▓▓░░░       ░    ░░▒▓█▓▓▓▒█████████████████▓██▓▓▒▓▌░▒▒  ▒▓▓▓▒▒░░░░▒▓",
		"▓▓▄▒▒▓█▄▓▒▒▒░░░▒      ░  ▒▒▓▓▓█▓███▓▌█████████████████████▓▓▒▓▒░▒▒  ▒▐░░░▒▒▒▒▓░▒",
		"▓▒░░▓██▒▒▒░░░▒░       ▐  ▐▓▓████████▓░░▓▓▒░ ▐▒▓████████████▓▒▓▒▒▒▒  ▒▐▒   ▒░░▓▒░",
		"▒▌░▒██▌░░░░▒░░░░░     ░░  ▓▓▓█████▓▓▌▒░ ▒▒▒▒███████████████▓▒█▒█▌▒  ░▐▒    ▒▒▓▒▒",
		"▒▒▒▐▓▓▒░░▒▒ ░▒ ░▒  ▒▒ ░░  ▒░▀███████▓▒▒▒▒▓▓▒██████████████▓▓▒▓▒▓▒▓        ░░▒▓▒▒",
		"▒▒▒▒▒░▒▒▒   ▒▓ ░▒▒▒▒▒ ░░  ▐  ░░▒▒▓██▓▒▒▓▀▀▀░░▒░░░░▀▀▀▐▒▓█████▒▒▓▌░ ░░ ░ ░  ▐▄▐▒▒",
		"▒▒▒▒░ ▓  ░░ ░▒░░▓▒▒░▓░ ░   ▒   ▒░▒▒▓▓▓▓ ░  ░  ░▄▄▄▓▓▓████████▒▒▒  ░▒░ ▒ ░  ▐█▒▐░",
		"░░▒▒▒ ▒▒▒░░░░▐▒▒▒░ ░▓▓   ░ ░    ░░▒▒▒▓░  ▒▒▒▒▒▒▒▒▓▒▒▒▓▓▓██▓▒▓▀░░░░▒░░ ▐ ░  █▒▒░░",
		"▒░▒▒▒░▒▓▒░▒░░ ░▒▒▒░░▓▓░ ░   ░░    ▒░▒▒▒▒▒░▒░▒░  ░░▒▓██████▓▀  ░░░░▒░░  ░░░░█▌░▐ ",
		"▒▒▒▒▒░▒▒▓▒▒▄░▒░░░░▒▒▓▒▒▒▄░░░  ░     ▒░▒▒▒▒▒▒▒▒▓▓▓▓███████▀     ░░▒░░▒▒  ▒▒░█▌░░ ",
		"▒▒▒▒▒▒▒░░▒▓▒▒▒▒░░░▒░░▒▓▓▓▓▄▒▒▒          ▒▒▒▒▒▓▓▓▓▓▓▓▀▀▀  ▒     ░░▐▒▒░ ░▒▒▒▒▀▒▒▒ ",
		"▒▒▒▒▒▒▒░▒▒▒░░▒▒▒▒▄░░░░░░▒▒▒▒▒▓▒▒▒░          ▒▒▒▒▒▒▒░  ░ ▒     ▒░▐░ ░▒▒░░▒▒▒▒▒▒▒▒",
		"▒▒▒▒▒▒▒▓▓▓▓▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▓▓▓▒▒▒▒▒░             ░░░░░░▒      ▒▌░▐▒▄▐▒▒▒▒▒▐▀▀▒▒▒",
		"▒▒▒▒▒▒▒▓▓▓▓▓▓▓▒▒▒▒ ░░ ░ ▒░    ░▒░ ░░░░░░             ░▐       ▒▒░▒▒▌░░░░░▒▐██▒▒▒",
	},

	-- face4 = {
	-- 	"█████████████▄          ▄████████████████▄▄▄ ▄▀  ░▄▐▀▀▄  ▀░▀▀ ▀▀▀  ▀    ▀▀▀█████",
	-- 	"██████████████▄      ▄████▀▒██████████████████▄▄▀▒░            ▐█▄          ████",
	-- 	"████████████████   ▄████▀░███████████▓▄▄▄▐▄██████▄              ██▄       ▄█████",
	-- 	"█████████████████ █████░▄█████████████████████████▀              ▀▀      ▒██████",
	-- 	"███████████████▀ ▀███░░████████████████████████████▄                     ▐██████",
	-- 	"██████████████▀ █░██ ▒█████████████████████░█████████              ▄██▄  ▓██████",
	-- 	"██████████████▒▐▌░█ ▄██████████████████████▀ ▌▀███████████▄    ▄▄ ▐████▄  ▒█████",
	-- 	"██████████████░▐ ░░████████ █████████▀▒▒▄▄▄▄▄▄▒▀███████████▄▄▄███ ▐█████  ▒█████",
	-- 	"██████████████▌▐░ ████████████████████████████▄▒ ████████████████  ██████ █▀████",
	-- 	"███████████████░░ █▀ ▐▀███▀█████████████████████▄ ███████████████ ▐███████ █▐███",
	-- 	"███████████████▌ ▐▄▄▄▄  ▀█████████████▀     ▀  ███▄▐███████▀ ███▀ ▐████████▐▌ ██",
	-- 	"███████████████░ ░██▓█▄▌▄▄██████████▀▄▄▒▄░▒▄░▄  ███▄ █████▐ ███▌  ███████████▄ ▐",
	-- 	"██████████▀▀▀    ██████████████████████▄▓▄▀▀▓█▄ ▌██▄▀ ▀ ▄▀ ▀▄▀▐░  ▀███████████▄ ",
	-- 	"█████████  ▐▀▄▄ █████████████████████████▄▄▄▄██████▀▄   ▄░█      ▄▒▀▐█████████▀█",
	-- 	"███████▀   ▄█  ██████████▐█████████████████████▀ ▄░   ▄█▌▀  ▄▄▄▀    ███████ ▀██ ",
	-- 	"██████▀  ▄█▀▒▒ ▀███████████████████████████▀▄▄▄██   ▄▐▓▒▀▀▀        ▐██▌█▌██  ██▀",
	-- 	"███████▐█▒▄▄▄    ▀███████▀▀▀████████████████ ███▌▀▀                ███▌ ▌▐█  ██ ",
	-- 	"███████▒▀██████▄ ▄ ▀██████▄▄ ███████████▀▄█▀▀                     ▐███    █▌ ██ ",
	-- 	"█████████▄ ▀███████▄ ▀███████████████▓▄▀▀                  ▄      ▓███▌   █  ██▌",
	-- 	"████████████▄ ▀██████  ▀█████████████▀                 ▄█▀▀      ▒████▌   █  █▀▌",
	-- 	"███████████████ █████░   ███▀▀▀▀▀     ▒             ▄█▀▀          ▀███▌   █  █ ▀",
	-- 	"██████████████▌   ▀░             ▄  ▄▄▐           ▄█                  ▀   ▌  █ ▌",
	-- 	"█████████████▀          ▄        ▀████▒          ▀              ▄         ▌ ▐▌▐▌",
	-- 	"███████████        ▄▄▄▀▀▀██▄      ▐███▌                              ▄▀██▄    █▓",
	-- 	"███████████▌  ▄▄▄▀▀      ▀██▌       ██    ▄▄▄                   ▄▄█████▀▀      ▀",
	-- 	"█████████████▀            ▐██░    ████  ▄▀   ▓▄              ▄████▀▀            ",
	-- 	"█████████████              █▌      ██   █    █▌            ▄███▀                ",
	-- 	"████████████▀                     ▀░   ░▀▐██▀  ▄▀        ▄██▀                   ",
	-- 	"███████████▌                      ░    ██▀    ▀        ▄▀▀▀                     ",
	-- 	"███████████                      ▀█▌   █             ▄█▀                        ",
	-- },
	--
	-- face5 = {
	-- 	"░              ░         ░             ░                              ░░░ ░░▓░  ",
	-- 	"▌             ▒ ▒░  ░▒░ ░░ ░▐░▄░░░░░  ▐                                    ░▐▌  ",
	-- 	"▌░           ▒░▄▄▄▄▄▄▄▄▄▒▒ ░░░▀▀▀▒▒░░ ▒░               ░░                  ░▐▌  ",
	-- 	"░░   ▒░▒▄▄▓████████████████████▓▒▒▄   ░       ░     ░   ▒                ░ ░▐▌  ",
	-- 	"░  ░▓▓▓▓████████████████████████████▄  ▒▒▄▄░  ░░       ▒          ░      ░░░▓▌  ",
	-- 	"░░░▓▓▓▓▓▒░▀▀▀▀▀▀▀▀░▀▀▀▀▀▓▓▓▓▓▒▒███████████████▓▒▄░░   ▒░░░░░░░          ░░░░█░  ",
	-- 	"░░██▓▓▓▓▄▄▄▄▄▓▒▄▓▓▓▒░▒▒░    ▀▓█▒▒██████████████████▄▄█▒░░▒▓▌▄░░░░░   ░ ░░░░▓█░  ",
	-- 	"▒████▓▓▓▓▓▓████████▒▓▒░░▒▒▒  ░▀█▒▓███████████████████▌▄▄▄▒░░▓░░░░   ░ ░░░░▐█▌░  ",
	-- 	"██████▓▓▓▓░▓██████░▒▒▒▄▒▒▒▒▒ ▓██████████████████████████████▓▄▒░░  ░  ░░░░██░   ",
	-- 	"████████▓▓▌░██████░▓▓█▓▓▒▒▄█░██████████████████████▀▒▓████████▓▒ ░░  ░░░▄██░    ",
	-- 	"██████████▓▓░▀████▌▒▓██▓████▒████████████████████▒▓▓▓▓▓▓▓▓▓██▀     ░░░░███░     ",
	-- 	"▐████████████▓▄▓▀███▄▄██████▄████████████████████▓▓▒░░▒░▄  ░░ ░░░░▒░░░▀▓▀░      ",
	-- 	"░▀████████████████▓█████████████████████████████▓▌▒▒░▒▒▒▓▌  ░░░░░▓█░            ",
	-- 	"░ ▓█▀▀████████████████████████████████████████▓██▒▓▓▓▒▒▒█▒░░  ░░▓░█░            ",
	-- 	"░░░▓█▄░░▀████████████████████████████████████████▐███████▓    ░░▓░░▓            ",
	-- 	"    ░▀██▄░░▀██████████████████████████████████████▄▄███▀▓     ░▒▌░░░▒           ",
	-- 	"     ░░▀▀█▓▄▄██████████████████████████████████████▓▀▒▒▄▌     ░▒░░░░▓░░         ",
	-- 	"       ░░░▀█████████████████████████████████████████████      ░░░░░░▐▌  ░       ",
	-- 	"   ░     ░▐████████████████████████████████████████████▌     ░░░░░ ░░▓   ▒      ",
	-- 	"          ░░░▓▓▓▓██████████████████████████████▓█████▀░    ▄░░░░ ░  ░▓   ░▒     ",
	-- 	"                ▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ ▀   ▀          ▀          ",
	-- },
	-- face6 = {
	-- 	"██████████████████████████████████▀▀▀▀▀▀▀▀▀▀▀███████████████████████████████████",
	-- 	"█████████████████████████████▀░░░░░░░░░░░░░░░░░▒▒▓██████████████████████████████",
	-- 	"██████████████████████████▒▒░░░░░░░░░░░░░░░▒▓▓▒▒▒▒▒▓▓███████████████████████████",
	-- 	"████████████████████████▒▒░░▒▒░░░░░░░░░░░░░░░░▒▒▒▒▒░░░▓█████████████████████████",
	-- 	"██████████████████████▒▒░▒▓▓░░░░▒░▒░░░░░░░░░░▒▒▄░▒▒░▒▒░░▓███████████████████████",
	-- 	"████████████████████▓▒░░▒▒░▒▒▒▓▒▒▒▓░▒▓░▒░░░▒▒▓▓▒▒▓▓▒░░░░░░██████████████████████",
	-- 	"███████████████████▓░░▒▒▒▒▒▒▒▓▓▒▒▓▓░░▒▒▒░▒▒▒▒░▓▓▓▒▒▒▒░░░░░░▀████████████████████",
	-- 	"██████████████████▓░░▒▒▒▒▒▒▒▓▓▒▒▒▓▒░░░▒░░░▓▓▓▒░▒▒▒▒░░░▒░░░░░▒███████████████████",
	-- 	"█████████████████▌░░░▒▒▓▒▒▒▒▒▒▒░░▒░░░▒░░░░░░▒▒▒░░░░░░░░▒░░░░░▒██████████████████",
	-- 	"████████████████▌░░▒▒▒▓▒▒░░▒▒░░░░░░▒▒░░░░▒░░░░░░░░░░░░░░░░░░░▒▓█████████████████",
	-- 	"████████████████░░▒▒░▒▒░▒░░░░░░░░░░░░░░░░░▒░░░░░░░░░░░░░░░░░░▒▒█████████████████",
	-- 	"███████████████▌░░▒░░░░░░░▒░░░░░░░▓▒░░░░░░▒▓▒░░░░░░░░░░░░░░░░░▒▒████████████████",
	-- 	"███████████████▒░▒░░░░░░░░▓▒░░░░░░██▓░░░░░░▓█▒▒░░░░░░░░░░░░░░░▒▓▓███████████████",
	-- 	"███████████████░░░░░░░░░░░▒█▒▒░░▒░▒███▄░░░░░▒███▒▒░░░░░░░░░░░░░▒▒███████████████",
	-- 	"██████████████▌░░░░░░░░▒▓▓▒▓█▓█▒░▓▓▓██████▓▒▒▒▓▓▀▀▀▒▒▒▒░░░░░░░░░▒▓██████████████",
	-- 	"██████████████▌░░░░░░░░▒██▀▀▒░░▀▀▓███████████▀░░░▒▒█▓▓▒░░░░░░░░░░▓██████████████",
	-- 	"██████████████▌░░░░░░░░░▓█▓██▓▒░░▒▒▓█████████▓█▄▓█████▒░░░░░░░░░░▒██████████████",
	-- 	"██████████████▌░░░░░▒▓▒░▒█████▓███████████████████████▒░░░░░░░░░░▒▓█████████████",
	-- 	"██████████████▒░░░░░▒▓▓▓▓████████████████▓████████████░░░░░░░░░░░░▒█████████████",
	-- 	"█████████████▓░░░░░░░░▀▓▓████████████████▓███████████▒▒░░░░░░░░░░░░░████████████",
	-- 	"█████████████▒░░░░░░░░░░░▀██████████████████████████▓▒░░░░░░░░░░░░░░░███████████",
	-- 	"███████████▓▒░░░░░░░░░░░░▒░░████████████████████████▓░░░░░░░░░░░░░░░░░▀█████████",
	-- 	"██████████▓▒░░░░░▒▒▒░░░░░░░░ ▀████████████████████▀░ ░░░░░░░░░░░░░░░░░░░▀███████",
	-- 	"████████▀░░▒░░░░▒▒▒▒░░░░░░░░░░░░▀███████████████▀░░░░░░░░░░░░░░░░░░░▒░░░░░▀█████",
	-- 	"███████▓░▓▓▒░░░▓▒▓▒░▒░░░░░▒░░░░░░░▒▒▀████████▀▒▒▒░░░░░▒░░░░░░░▒░░░░░░░░░░░░░░███",
	-- 	"██████▀▄█▒▒░░░▓▒▒▒░▒░░░░░░▒░░░░░░░▓▓▓▒▒▒▒▒▒▒▒▒▒▓▒░░░▒▓▒▒░░░░░░░▒░░░░░░░░░░░░░░▒▀",
	-- 	"█████░▒░░▓░░░▒░░░░▒░░░░░░▓░░░░░░░░▓▓▓▓▓▓▓▓▓▓▓▓██▓▒░▓▒▒▓▒░░░░░░░▓░░░░░░░░░░░░░░░░",
	-- 	"████░░░░▓░░░▒░░░░░░░░░░░▐▌░░░░░░░▓██████████████▓▓▒▒▒▒▒░░░░░░░░░▓░░░░░░░▒░░░░░▒░",
	-- },

	face7 = {
		"                                                      ░░░░░░                    ",
		"                             ▄▒▒▒▀▀▀▀▀▀▀░░░        ░░░░░░░░░▒░                  ",
		"                       ▄▄▓▓▀        ░░░░░░▀▀▒▒    ░            ░▒▒░             ",
		"                    ░░ ░░                     ░▒░ ░░              ░░░           ",
		"                  ░                            ▒                     ░          ",
		"                ░                              ░▒  ░░                  ░        ",
		"              ▒                            ░░    ░    ▒▒░              ░        ",
		"            ░▒                 ░          ░     ░▓      ▒▒░           ░░        ",
		"            ▒         ▄░    ░   ▄     ░░       ░░▓       ░░▒░   ░ ░ ░ ▒░        ",
		"           ▒░                       ░           ▒▓         ▒▒░  ░░▒ ▒░▒░        ",
		"           ░░                  ▒▒▒▒▄  ░         ▓░          ▒▒▒░░░▒▒░ ▒░        ",
		"           ▒▒                 ▐▒▒▒▒▒▒         ▒▒▒           ░░▒▒░░▒▒  ▒         ",
		"            ▓▓▒░ ░            ▒▒░░░▒▒░░    ░░░▒░              ░  ░▒░░░▒         ",
		"            ▐▌▄▓▓▓▒░░          ▒▄▒▓▒▌   ░░░ ░▒▒                    ▒  ░░        ",
		"             ░▓▓▒░░░░░░░░       ░▒▒░░▒▒░  ░░▒▒░                                 ",
		"               ░▒░▒░░░░░░░      ▐▒  ░░░▒▒░░▒▓▒▒                                 ",
		"               ▐░░▓▒▒░░░░      ░▓▓░░░░░░░▓░░▒▓▒                                 ",
		"              ░░░░▓▓▓▓▒▒░      ▐▓▓░░░░░▒░░▓▒▒▒▒▓                                ",
		"              ▀▓▒▒▒▓▓▓▓▒░░░  ▄▓▓▓░░▒░░▒░▒ ░▓▒▒▒▓▓                               ",
		"                 ▐▓▓▓▓▓▒▒▄▄▄▓▓▀    ░▒▒░░░░ ░▒▒░▒▓▓▄                             ",
		"                   ▒▓▓▓▓▓▓▓▓▓        ▓▒▒░▒░░ ░▒░░▒▓▒▄                           ",
		"                     ▐▓▓▓▓▓░          ▒▒░░ ░   ░▒░░▒▒▓▄                         ",
		"                       ▀▀              ▒▒ ░  ░░ ░░▒▄░▒▓▓▄                       ",
		"                                       ░▒░░░  ░░░▄▒▒▓▀▀▀▀▀▀▓▄                   ",
		"                                        ▒  ▒▄▒▒▒▒░▒░     ░ ░ ▒▒                 ",
		"                                       ▐▓▓▓░░░░░░░▒░░    ░ ░░ ░▒                ",
		"                                   ▄▓▓▓▀▒░░░          ░░     ▒ ▒▒               ",
		"                                 ░▓▓▓▒░░▒                ░   ░░░▒░              ",
		"                                ▒▓▓▀░░░░▒                ░░░ ▒ ░▒▒    ░         ",
		"                             ▄▓▓▒░░ ░  ░▒░                ░░ ▒  ▐▒     ░        ",
	},

	-- face8 = {
	-- 	"                 ▄        ▄▄▄       ▄▄▄▄▄▄   ▄▄▄▄▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄",
	-- 	"▒▒▒▒▒      ░░░░▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▒▒▒▒▒▒▐█████▌░▒▒████▓█████▒▒██████████████████████",
	-- 	"▒▒▒▒▒▒ ░░░░░    ▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████▌░▒▒███▓▐█████▌▒██████████████████████",
	-- 	"▒▒▒▒▒▒░░       ░▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████▌░░▒███▒▐█████▌░▐█████████████████▌███",
	-- 	"▒▒▒▒▒▒      ░░ ░ ▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒█████▌░░▒██░░░▀░░░▄▄░▒█████████████████████",
	-- 	"▒▒▒▒▒▒  ░░        ▒▒▒▒░▒▒▒▒▒▒▒▒▒▒▒▒▒▒███▀░░░░░░▄▄████████░▒█████████████████▌███",
	-- 	"▒▒▒▒▒▒░            ▒▒▒▒░▒▒▒▒▒▒▒░░▒▒░░░ ░░▄▄█████▀▀▀▀░   ▒░▒▐████████████████▌███",
	-- 	"▒▒▒▒▒░         ░░   ░    ░░░░░ ░█▄▄░ ░█░▐█▀▀    ░ ▄▄█▌░▓█▌▒▒██▓█████████████▒███",
	-- 	"▒▒▒▒▒░░        ░░  ░░░░░░█████████▌░░█▌▄  ▄█ ▓▄▄▄████▓███▌▒▒██▓█████████████▓███",
	-- 	"▒▒▒▒▒░░▒ ░░   ░ ░░░▀█▄▄░░ ▀███████░░████▓████▄▄▓▓██▓█████▌░▒▓█▓█████████████████",
	-- 	"▒▒▒▒▒░░░░░               ░░ ▀████████████░██▀▀▀▀▒▒▓███████░▒▒█▓█████████████▓███",
	-- 	"▒▒▒▒▒▒░░░░░ ░  ░░░░░▓▄▓▓▐█▄▄░█████████████████▄▒▓█████████░▒▒▌▓██████▓█████▌▒███",
	-- 	"░░░▒▒▒░░░░░░░  ░ ░░░▀███▓██▀░░████████████████████████████░▒▒▌█████████████▒▒███",
	-- 	"░▒░░░░░░░░░░░░    ░░░▒▒▓██▀░░░████████████████████████████░▒▒▒██▓████████▓▌▒▐███",
	-- 	"░░░░░░░░░░░░░░░     ░ ▀██▌░░░░▐███████████████████████████░▒▒▒▓████▓████▓█▒▒▐▒█▌",
	-- 	"░░▒░░░░░░░░░░░░░      ░ ▀ ░░░░▓███████████████████████████░▒▒▒▓██▓████▓███▒▒▓▐█▒",
	-- 	"░▒▒░░░░░░░░░░░░░░            ░▀██████████████████████████▌░▒▒▒▓▓█████▓███▌▒▒▒█▒▒",
	-- 	"░░░▒░░▒░ ░░░░░░▒▒▒▒           ░░ ░▄██████████████████████░░▒▒▒▓████▓████▓▒▒▒▒▓▒▒",
	-- 	"░░░░  ▒░  ░░ ▒▒▒▒▒▒▒▄           ░▐██████████████████████▌░░▒▒▐████▓██▓██▌▒▒▒▓▓▓▓",
	-- 	"  ░▒▒ ▒▒    ▒▒▒▒▒▒▒▒▒▓▄        ░  ▀▀▀░▒▒▓▓▒▓████████████░░░▒████▓████▓█▓▒▒▓▒▐▓▓▓",
	-- 	" ░ ░░     ░░░░▒▒▒▒▒▒▒▒▒▓▓          ▀▓▓▒▓▓██████████████ ░░▒██▓█▓▓▓▓▓██▓█▒█▒   ▓▓",
	-- },

	anya = {
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠔⣰⣿⣟⡽⢋⡴⣿⠏⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⠹⣿⣿⣿⣿⣿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡿⣡⠏⣴⡟⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢹⣿⣿⣿⣿⡿⠏⠁⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⣠⢾⣿⣿⡛⣰⡏⣼⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡄⣿⡿⢛⣻⡅⠀⡆⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⣠⡟⣸⣿⣿⢠⣿⠃⣿⣿⠃⣼⢿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⡇⢿⡇⣿⣿⠃⢠⡟⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⠀⢠⣿⢃⣿⣿⠇⣾⡟⠀⣿⢇⣴⡄⢸⣿⣿⣿⡟⣿⣧⠘⣿⣿⡇⣿⢿⢻⣷⠸⣇⢿⣿⠀⠀⣧⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⠀⡼⢹⡿⢸⣿⡿⢸⠟⣵⡿⠈⠈⠿⣷⠈⣿⣿⣿⠆⢿⣷⢀⢻⣿⡆⢹⢼⣷⣿⢀⣿⡜⢿⠦⠀⠩⡄⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⠀⣘⡇⣾⡿⢸⣿⡇⣠⡾⢋⣶⣦⠁⢒⡘⣷⡘⣿⣿⡄⣎⠻⡼⣧⡙⣿⣌⠘⣿⣿⢸⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀",
		"⠀⠀⠀⣰⣿⡇⢿⣿⢸⡿⢰⣿⢡⣿⠉⣯⣄⠀⣷⣿⣿⣌⡻⢧⢹⣷⢆⣉⠠⠄⡀⢢⠹⣿⢸⣿⣿⣿⡿⢱⣦⠄⢠⣶⠀⠀⠀⠀",
		"⠀⠀⣰⣿⣿⣷⢸⣿⠸⣿⢸⡏⣼⣿⠀⠟⠁⣸⣿⣿⣿⣿⣿⣷⣶⣴⡟⠿⡁⠀⢹⡎⢷⡹⢸⣿⣿⠟⣠⣿⠏⣼⢸⣿⡃⠀⠀⠀",
		"⠀⠀⣿⣿⣿⣿⡆⣿⡇⣿⢸⣿⡸⣿⣷⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⣿⣷⡀⣸⣿⢸⣇⢸⣿⡏⣸⣿⡏⣸⣿⢸⣿⡇⠀⠀⠀",
		"⠀⠀⢿⣿⣿⣿⣷⠸⣷⠸⢸⣿⣷⣮⣛⣛⣋⣿⣿⣿⣿⣿⣿⣿⣿⣿⡀⠈⢠⣠⣿⡿⢸⠏⣾⢋⣴⣿⢋⣴⣿⣿⢸⣿⡏⡶⠀⠀",
		"⠀⡇⣿⣿⣿⣿⣿⣧⡹⣧⠈⣿⣿⣿⣿⣿⣿⣿⡟⠛⠿⢿⣿⣿⣟⠿⣿⣿⣿⣿⡿⣣⡟⠜⣱⣿⠟⣴⣿⣿⣿⣿⢸⣿⠃⣟⡇⠀",
		"⢘⠀⢻⣿⣿⣿⣿⣿⣷⡘⢆⠻⣿⣿⣿⣿⣿⡿⣰⣿⣿⡇⢿⣿⣿⣿⣶⣭⣭⣭⣾⡟⣠⣾⠟⣥⣿⣿⣿⣿⣿⡇⣼⡿⠸⣸⣿⡄",
		"⢈⠀⠸⣿⣿⣿⣿⣿⣿⣿⡆⠀⠉⠻⢿⣿⣿⡇⣿⣿⣿⣿⢸⣿⣿⣿⣿⣿⣿⣿⢏⡼⢛⣴⣿⣿⣿⣿⣿⣿⣿⢁⣿⢡⢃⡏⣿⡇",
		"⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢰⡍⣛⠷⢭⣙⣛⣛⣸⣿⣿⣿⣿⣿⡿⠡⢊⣴⣿⣿⣿⣿⣿⣿⣿⣿⡏⣸⢇⡎⠘⡇⣿⡇",
		"⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⠀⢠⣼⣷⣬⠛⣶⣬⣭⠉⡍⠋⠙⢩⣭⡍⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⢣⡎⠀⠀⢹⣿⠃",
		"⠀⠀⠀⠀⠀⠹⣿⣿⣿⣿⣿⢣⣾⣿⣿⢿⣿⣇⢹⣻⠿⢛⣩⣭⣝⠻⣿⢁⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠀⠁⠀⠀⠀⣼⡟⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠛⢿⣿⢃⣿⣿⢿⣿⣿⣿⠉⡴⠉⠂⣾⣿⡿⢿⣷⡄⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⢀⠀⠂⠀⠟⠀⠀",
		"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢸⣿⣿⣿⣮⣛⠿⢣⠰⠧⠾⣿⣿⣿⣿⣾⣿⢸⣿⣿⣿⣿⣿⣿⠿⠛⠁⠀⠀⢀⠐⠀⡀⠄⠀⠀",
	},
}

return headers
