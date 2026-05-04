vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<c-Up>',    ':wincmd k<CR>')
vim.keymap.set('n', '<c-Down>',  ':wincmd j<CR>')
vim.keymap.set('n', '<c-Left>',  ':wincmd h<CR>')
vim.keymap.set('n', '<c-Right>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

local function toggle_term()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == 'terminal' then
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buf then
          vim.api.nvim_win_close(win, false)
          return
        end
      end
      vim.cmd('botright split')
      vim.api.nvim_win_set_buf(0, buf)
      vim.cmd('startinsert')
      return
    end
  end
  vim.cmd('botright split | terminal')
  vim.cmd('startinsert')
end

vim.keymap.set('n', '<C-`>', toggle_term)
vim.keymap.set('t', '<C-`>', function() vim.cmd('stopinsert'); toggle_term() end)
