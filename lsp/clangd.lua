return {
  cmd = {
	  "clangd",
	  "--query-driver=/usr/bin/*,/bin/*", 
  },

  root_markers = { '.clangd', 'compile_commands.json' },
  filetypes = { 'c', 'cpp' },
}
