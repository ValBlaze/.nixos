vim.keymap.set({ 'n', 'x', 'o' }, 's', '<Plug>(leap)')
vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
vim.keymap.set({ 'x', 'o' }, 'x', '<Plug>(leap-forward-till)')
vim.keymap.set({ 'x', 'o' }, 'X', '<Plug>(leap-backward-till)')

-- Highly recommended: define a preview filter to reduce visual noise
-- and the blinking effect after the first keypress
-- (`:h leap.opts.preview`). You can still target any visible
-- positions if needed, but you can define what is considered an
-- exceptional case.
-- Exclude whitespace and the middle of alphabetic words from preview:
--   foobar[baaz] = quux
--   ^----^^^--^^-^-^--^
require('leap').opts.preview = function(ch0, ch1, ch2)
  return not (ch1:match('%s') or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a')))
end

-- Define equivalence classes for brackets and quotes, in addition to
-- the default whitespace group:
require('leap').opts.equivalence_classes = {
  ' \t\r\n',
  '([{',
  ')]}',
  '\'"`',
}

-- Use the traversal keys to repeat the previous motion without
-- explicitly invoking Leap:
require('leap.user').set_repeat_keys('<enter>', '<backspace>')

do
  -- Return an argument table for `leap()`, tailored for f/t-motions.
  local function as_ft(key_specific_args)
    local common_args = {
      inputlen = 1,
      inclusive = true,
      -- To limit search scope to the current line:
      -- pattern = function (pat) return '\\%.l'..pat end,
      opts = {
        labels = '', -- force autojump
        safe_labels = vim.fn.mode(1):match('[no]') and '' or nil,
      },
    }
    return vim.tbl_deep_extend('keep', common_args, key_specific_args)
  end

  local clever = require('leap.user').with_traversal_keys
  local clever_f = clever('f', 'F')
  local clever_t = clever('t', 'T')

  for key, key_specific_args in pairs({
    f = { opts = clever_f },
    F = { backward = true, opts = clever_f },
    t = { offset = -1, opts = clever_t },
    T = { backward = true, offset = 1, opts = clever_t },
  }) do
    vim.keymap.set({ 'n', 'x', 'o' }, key, function()
      require('leap').leap(as_ft(key_specific_args))
    end)
  end
end
