local ipairs = ipairs
local print = print

local loader = require 'licgen.loader'

local function printf(fmt, ...)
  print(fmt:format(...))
end

local function print_help()
  printf("Usages:")
  printf("  %s TEMPLATE AUTHORS ", arg[0])
  print()
  print("Available templates:")
  for _, template in ipairs(loader.list()) do
    printf("  %s", template)
  end
end

if #arg < 1 then
  print_help()
else
  local template = loader.load(arg[1])
  if not template then
      printf("Unknown template %s", arg[1])
  end
  local year = os.date('%Y')
  local authors = table.concat(arg, ', ', 2)
  local licence = template:gsub('__YEAR__', year)
  if #arg > 1 then
    licence = licence:gsub('__AUTHORS__', authors)
  end
  print(licence)
end
