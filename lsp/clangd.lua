return {
  cmd = { 'clangd' },
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
