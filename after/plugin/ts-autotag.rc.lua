local status, autotag = pcall(require, "nvim-ts-autotag")
if (not status) then
  print("ERROR: Auto-tag is not installed")
end

autotag.setup {}
