return {
  -- ctags like menu
  {
    "simrat39/symbols-outline.nvim",
    opts = {
      width = 25,
      symbols = {
        File = { icon = Lsp_signs.File, hl = "@text.uri" },
        Module = { icon = Lsp_signs.Module, hl = "@namespace" },
        Class = { icon = Lsp_signs.Class, hl = "@type" },
        Method = { icon = Lsp_signs.Method, hl = "@method" },
        Property = { icon = Lsp_signs.Property, hl = "@method" },
        Field = { icon = Lsp_signs.Field, hl = "@field" },
        Constructor = { icon = Lsp_signs.Constructor, hl = "@constructor" },
        Enum = { icon = Lsp_signs.Enum, hl = "@type" },
        Interface = { icon = Lsp_signs.Interface, hl = "@type" },
        Function = { icon = Lsp_signs.Function, hl = "@function" },
        Variable = { icon = Lsp_signs.Variable, hl = "@constant" },
        Constant = { icon = Lsp_signs.Constant, hl = "@constant" },
        Key = { icon = Lsp_signs.Keyword, hl = "@type" },
        EnumMember = { icon = Lsp_signs.EnumMember, hl = "@field" },
        Struct = { icon = Lsp_signs.Struct, hl = "@type" },
        Event = { icon = Lsp_signs.Event, hl = "@type" },
        Operator = { icon = Lsp_signs.Operator, hl = "@operator" },
        TypeParameter = { icon = Lsp_signs.TypeParameter, hl = "@parameter" },
        Boolean = { icon = Lsp_signs.Boolean, hl = "@boolean" },
        Null = { icon = Lsp_signs.Null, hl = "@type" },
        Component = { icon = Lsp_signs.Component, hl = "@function" },
        Fragment = { icon = Lsp_signs.Fragment, hl = "@constant" },
        Object = { icon = Lsp_signs.Object, hl = "@type" },
        Array = { icon = Lsp_signs.Array, hl = "@constant" },
        Number = { icon = Lsp_signs.Number, hl = "@number" },
        String = { icon = Lsp_signs.String, hl = "@string" },
        Namespace = { icon = Lsp_signs.Namespace, hl = "@namespace" },
        Package = { icon = Lsp_signs.Package, hl = "@namespace" },
      },
    },
  },
}
