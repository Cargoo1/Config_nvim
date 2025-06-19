-- ~/.config/nvim/lua/config/dap-config.lua

-- Cargar los módulos necesarios
local dap = require("dap")
local dapui = require("dapui")

-- Configuración de nvim-dap-ui
dapui.setup()
require("dap-go").setup()

-- Configuración de listeners para abrir/cerrar la interfaz de DAP
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Mapeos de teclas
vim.keymap.set('n', '<Leader>dt', dap.toggle_breakpoint, {})  -- Alternar punto de interrupción
vim.keymap.set('n', '<Leader>dc', dap.continue, {})          -- Continuar la ejecución

-- Configuración de codelldb para C/C++
dap.adapters.codelldb = {
    type = 'server',
    port = '${port}',
    executable = {
        command = '/home/acamargo/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb',  -- Ruta al ejecutable de codelldb
        args = { '--port', '${port}' },
    },
}

-- Configuración para C
dap.configurations.c = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {"-0", "+0"},
    },
}
