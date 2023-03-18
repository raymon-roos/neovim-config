local bo = vim.bo

bo.textwidth = 90
bo.fo = 'tcrqn1'

local get_input = require("nvim-surround.input").get_input
require("nvim-surround").buffer_setup({
  surrounds = {
    ["l"] = {
      add = function()
        local link = get_input("Enter link: "):gsub("\n", "")
        if link then
          return {
            { "[" },
            { "](" .. link .. ")" },
          }
        end
      end,
      find = "%b[]%b()",
      delete = "^(%[)().-(%]%b())()$",
      change = {
        target = "^()()%b[]%((.-)()%)$",
        replacement = function()
          local link = get_input("Enter link: "):gsub("\n", "")
          if link then
            return {
              { "" },
              { link },
            }
          end
        end,
      },
    },
  },
})
