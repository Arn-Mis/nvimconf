return {

    "brianhuster/live-preview.nvim",
    dependencies = { -- You can choose one of the following pickers
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("livepreview.config").set({
            port = 5500,
            browser = "default",
            dynamic_root = false,
            sync_scroll = true,
            picker = "",
        })
        vim.keymap.set("n", "<Leader>lp", ":LivePreview start<CR>", {noremap = true, silent = true})
    end,
}
