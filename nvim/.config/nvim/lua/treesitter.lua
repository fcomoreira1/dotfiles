require'nvim-treesitter.configs'.setup {
	ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	highlight = {
		enable = true,
		disable = {"php"}, 
        use_languagetree = true
	},
	indent = {
		enable=true,
		disable = {"python"}
	},
    autopairs = {
        enable = true,
    },
    --[[ autotag = {
        enable = true,
    }, ]]
}
