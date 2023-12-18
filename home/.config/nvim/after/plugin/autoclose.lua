-- It's rare that I need a closing single quote and it's annoying to remove
-- them from my comments when I use contractions.
require("autoclose").setup({
  keys = {
    ["'"] = { close = false }
  },
  options = {
    disable_when_touch = true,
    -- Extend regex to include forward slashes.
    touch_regex = "[%w(%[{/]",
  },
})
