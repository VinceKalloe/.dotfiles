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