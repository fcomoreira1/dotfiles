local npairs = require("nvim-autopairs")

npairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string', 'string'},
        java = false,-- don't check treesitter on java
    },
    enable_check_bracket_line = false,
    fast_wrap = {
        map = '<M-e>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '$',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey='Comment'
    },
    disable_filetype = { "TelescopePrompt" , "vim" },
})
local Rule = require('nvim-autopairs.rule')

-- you can use some built-in conditions

local cond = require('nvim-autopairs.conds')

npairs.add_rule(Rule("|", "|", {"tex", "latex"}))

local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } })


require('nvim-ts-autotag').setup()
