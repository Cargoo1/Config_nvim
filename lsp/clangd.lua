return {
  cmd = {
	  "clangd",
	  "--query-driver=/usr/bin/*,/bin/*", 
  },
  init_options = {
	  fallbackFlags = {
		  "-std=c++98",
		  "-Wextra",
		  "-Werror",
		  "-Wall"
	  }

  },
  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
