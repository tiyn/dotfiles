return {
  -- session management with git support
  "rmagatti/auto-session",
  lazy = false,
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { "~/", "~/code", "~/downloads", "/" },
    -- log_level = 'debug',
  },
}
