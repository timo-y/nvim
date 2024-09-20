-- comments the current line, or a number of lines 5gcc
vim.keymap.set("n", "gcc", require("SingleComment").SingleComment, { expr = true })
-- comments the selected lines
vim.keymap.set("v", "gcc", require("SingleComment").Comment, {})
-- toggle a comment top/ahead of the current line
vim.keymap.set("n", "gca", require("SingleComment").ToggleCommentAhead, {})
-- comments ahead of the current line
vim.keymap.set("n", "gcA", require("SingleComment").CommentAhead, {})
-- comment a block, and removes the innermost block comment in normal mode
vim.keymap.set({ "n", "v" }, "gcb", require("SingleComment").BlockComment)
