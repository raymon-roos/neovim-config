--  Note that $NOTES_HOME is a shell environment variable pointing to
--  the single flat directory holding all the notes or "zettels"

local nmap = require('utils.keymapper').nmap
local user_func = vim.api.nvim_create_user_command
local fn = vim.fn

local function create_zettel(file_name, split)
  local zettel_name = fn.fnameescape(
    fn.expand('$NOTES_HOME/') .. file_name
    .. fn.strftime("-%Y%m%d%H%M") .. '.md'
  )

  if split ~= 'split' and split ~= 'vsplit' and split ~= 'edit' then
    split = 'edit'
  end

  vim.cmd(split .. ' ' .. zettel_name)
  print(fn.expand('%:p:~'))
end

user_func('NewZettel', function(opts)
    create_zettel(opts.fargs[1], 'edit')
  end,
  { nargs = 1 }
)
nmap('<leader>zz', ':NewZettel ', { silent = false })
--  mnemonic: zettel->zettel

user_func('SplitZettel', function(opts)
    create_zettel(opts.fargs[1], 'split')
  end,
  { nargs = 1 }
)
nmap('<leader>zs', ':SplitZettel ', { silent = false })
--  mnemonic: zettel->split

user_func('VertZettel', function(opts)
    create_zettel(opts.fargs[1], 'vsplit')
  end,
  { nargs = 1 }
)
nmap('<leader>zv', ':VertZettel ', { silent = false })
--  mnemonic: zettel->vertical

nmap( -- Change working directory to zettelkasten and open index
  '<leader>zi',
  '<CMD> e $NOTES_HOME/index-202202270044.md <CR>'
  .. '<CMD> cd $NOTES_HOME <CR>'
  .. '<CMD> pwd <CR>'
) --  mnemonic: zettel->index

user_func('ZettelReferences', function()
    require('telescope.builtin').live_grep({ default_text = vim.fn.expand('%:t') })
  end,
  { nargs = 0 }
)
nmap('<leader>zr', ':ZettelReferences <CR>')

-- Be explicit about input and output files,
-- to prevent running accidently on the wrong project.
-- Also, don't parse the index file.
nmap( -- Generate ctags
  '<leader>zt',
  '<CMD> !ctags -R --exclude=index-202202270044.md -f "$NOTES_HOME"/tags "$NOTES_HOME"/*.md <CR>'
) -- mnemonic: zettel->tags

nmap('<leader>zp', '<CMD>MPToggle <CR>')

-- nmap( -- update the list of tags at the end of index.md
--   '<leader>zT',
--   "<CMD> execute 'g/^` @[a-z-]* `/d' | %read !awk '\\!/^\\!_TAG_/ {print \"` @\" $1 \" `\"}' ./tags | sort -u <CR>"
-- ) -- works like a dream, but decided there are plenty powerful tools for
-- listing/searching/finding tags so it's counter productive maintaining a list manually.
