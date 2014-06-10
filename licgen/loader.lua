local M = {}

local lfs = require('lfs')
local debug_getinfo = debug.getinfo
local io_open = io.open
local table_insert = table.insert
local table_sort = table.sort

local _ENV = M

local info = debug_getinfo(3, 'S')
local templates_dir = info.source:match('@?(.*)[/\\][^/\\]+[/\\][^/\\]+$') .. '/templates/'

function list()
  local templates = {}
  for file in lfs.dir(templates_dir) do
    local template_path = templates_dir .. file
    local mode, _ = lfs.attributes(template_path, 'mode')
    if mode == 'file' then
      local lic_name = file:match('^(.-)%.lic$')
      if lic_name then
        table_insert(templates, lic_name)
      end
    end
  end
  table_sort(templates)
  return templates
end

function load(name)
  local template_path = templates_dir .. name .. '.lic'
  local file = io_open(template_path, 'r')
  if not file then
    return nil
  end
  local content = file:read('*a')
  file:close()
  return content
end

return M
