require('neorg').setup {
    load = {
        ["core.defaults"] = {},
        ["core.export"] = {},
        ["core.gtd.base"] = {
            config = {
                workspace = "work",
            }
        },
        ["core.tangle"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.tangle"] = {
            config = { -- Note that this table is optional and doesn't need to be provided
                -- Configuration here
            }
        },
        ["core.integrations.nvim-cmp"] = {},
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/metrix",
                    home = "~/notes/home",
                    university = "~/bachelor/current"
                }
            }
        },
        ["core.norg.concealer"] = {},
        ["core.export.markdown"] = {
            config = {
                extensions = "all"
            }
        }
    }
}
