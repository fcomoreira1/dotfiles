local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node

local line_begin = require("luasnip.extras.expand_conditions").line_begin
local tex_utils = {}
tex_utils.in_mathzone = function() -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env('equation')
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env('itemize')
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env('tikzpicture')
end


return {
  s({ trig = "mtex", snippetType = "autosnippet" },
    fmta(
      [[
    \documentclass{scrartcl}

    \usepackage[font,<>]{moreira}
    \author{Francisco Moreira Machado<>}

    \title{<>}

    \begin{document}
      \maketitle
      <>
    \end{document}
    ]],
      { i(1), i(2), i(3), i(0) }
    ),
    { condition = line_begin }
  ),
  s({ trig = "dm", snippetType = "autosnippet" },
    fmta(
      [[
        \[
        <>
        .\] <>
      ]],
      { i(1), i(0) }
    ),
    { condition = line_begin }
  ),
  s({ trig = "!!", snippetType = "autosnippet", wordtrig = false, regtrig = true },
    fmta(
      [[
        $<>$<>
      ]],
      { i(1), i(0) }
    )
  ),
  s({ trig = "beg", snippetType = "autosnippet" },
    fmta(
      [[
         \begin{<>}
             <>
         \end{<>}
       ]],
      { i(1), i(2), rep(1) }
    )
  ),
  s({ trig = ";a", snippetType = "autosnippet" },
    {
      t("\\alpha"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "cala", snippetType = "autosnippet" },
    {
      t("\\mathcal{A}"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "calp", snippetType = "autosnippet" },
    {
      t("\\mathcal{P}"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "calb", snippetType = "autosnippet" },
    {
      t("\\mathcal{B}"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "calc", snippetType = "autosnippet" },
    {
      t("\\mathcal{C}"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "cald", snippetType = "autosnippet" },
    {
      t("\\mathcal{D}"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "cc", snippetType = "autosnippet" },
    {
      t("\\subset")
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ";b", snippetType = "autosnippet" },
    {
      t("\\beta"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ";l", snippetType = "autosnippet" },
    {
      t("\\lambda"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ";e", snippetType = "autosnippet" },
    {
      t("\\varepsilon"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ";g", snippetType = "autosnippet" },
    {
      t("\\gamma"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ";s", snippetType = "autosnippet" },
    {
      t("\\sigma"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "~~", snippetType = "autosnippet" },
    {
      t("\\approx"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "~=", snippetType = "autosnippet" },
    {
      t("\\cong"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "__", snippetType = "autosnippet", wordTrig = false },
    fmta([[_{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "^^", snippetType = "autosnippet", wordTrig = false },
    fmta([[^{<>}<>]], { i(1), i(0) }),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "...", snippetType = "autosnippet" },
    {
      t("\\ldots"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "=>", snippetType = "autosnippet" },
    {
      t("\\implies"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "=<", snippetType = "autosnippet" },
    {
      t("\\impliedby"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = ">=", snippetType = "autosnippet" },
    {
      t("\\geq"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "<=", snippetType = "autosnippet" },
    {
      t("\\leq"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "!=", snippetType = "autosnippet" },
    {
      t("\\neq"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "oo", snippetType = "autosnippet" },
    {
      t("\\infty"),
    },
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "ff", snippetType = "autosnippet" },
    fmta(
      [[
      \frac{<>}{<>} <>
      ]],
      {
        i(1),
        i(2),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "set", wordTrig = true },
    fmta(
      [[
      \{ <> \} <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "lr(", snippetType = "autosnippet" },
    fmta(
      [[
      \left( <> \right) <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "lr[", snippetType = "autosnippet" },
    fmta(
      [[
      \left[ <> \right] <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "lr|", snippetType = "autosnippet" },
    fmta(
      [[
      \left| <> \right| <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "ceil", snippetType = "autosnippet" },
    fmta(
      [[
      \left\lceil <> \right\rceil <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
  s({ trig = "floor", snippetType = "autosnippet" },
    fmta(
      [[
      \left\lfloor <> \right\rfloor <>
      ]],
      {
        i(1),
        i(0)
      }
    ),
    { condition = tex_utils.in_mathzone }
  ),
}
