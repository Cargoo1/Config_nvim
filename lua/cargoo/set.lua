vim.opt.nu = true
vim.opt.relativenumber = true

-- Usa tabs en lugar de espacios
vim.opt.expandtab = false  -- Usa tabs, no convierte los tabs en espacios
vim.opt.tabstop = 4        -- Define el tamaño de un tab (ajústalo según tus preferencias)
vim.opt.shiftwidth = 4     -- Define el ancho de indentación para autocompletado y movimientos (ajústalo según tus preferencias)
vim.opt.softtabstop = 4    -- Para alinear el cursor al tamaño de un tab
vim.opt.smarttab = true    -- Hace que los tabs se alineen correctamente con el código
vim.opt.smartindent = true


vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.cursorline = false
