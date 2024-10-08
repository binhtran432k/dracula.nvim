local uv = vim.uv or vim.loop

local M = {}

M.bg = "#000000"
M.fg = "#ffffff"
M.day_brightness = 0.3

---@param c string
local function rgb(c)
  c = string.lower(c)
  return { tonumber(string.sub(c, 2, 3), 16), tonumber(string.sub(c, 4, 5), 16), tonumber(string.sub(c, 6, 7), 16) }
end

local me = string.sub(debug.getinfo(1, "S").source, 2)
M.me = vim.fn.fnamemodify(me, ":h:h")

---@param opts DraculaConfig
function M.get_style_name(opts)
  if opts.style and opts.style ~= "default" then
    return "dracula-" .. opts.style
  end
  return "dracula"
end

---@param modname string
function M.mod(modname)
  if package.loaded[modname] then
    return package.loaded[modname]
  end
  local ret = loadfile(M.me .. "/" .. string.gsub(modname, "%.", "/") .. ".lua")()
  package.loaded[modname] = ret
  return ret
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
function M.blend(foreground, alpha, background)
  alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
  local bg = rgb(background)
  local fg = rgb(foreground)

  local blendChannel = function(i)
    local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

function M.blend_bg(hex, amount, bg)
  return M.blend(hex, amount, bg or M.bg)
end

function M.blend_fg(hex, amount, fg)
  return M.blend(hex, amount, fg or M.fg)
end

---@param group string
function M.highlight(group, hl)
  if hl.style then
    if type(hl.style) == "table" then
      hl = vim.tbl_extend("force", hl, hl.style)
    elseif hl.style:lower() ~= "none" then
      -- handle old string style definitions
      for s in string.gmatch(hl.style, "([^,]+)") do
        hl[s] = true
      end
    end
    hl.style = nil
  end
  vim.api.nvim_set_hl(0, group, hl)
end

---@param groups DraculaHighlights
---@return table<string, vim.api.keyset.highlight>
function M.resolve(groups)
  for _, hl in pairs(groups) do
    if type(hl.style) == "table" then
      for k, v in pairs(hl.style) do
        hl[k] = v
      end
      hl.style = nil
    end
  end
  return groups
end

-- Simple string interpolation.
--
-- Example template: "${name} is ${value}"
--
---@param str string template string
---@param table table key value pairs to replace in the string
function M.template(str, table)
  return (
    string.gsub(str, "($%b{})", function(w)
      return vim.tbl_get(table, unpack(vim.split(w:sub(3, -2), ".", { plain = true }))) or w
    end)
  )
end

---@param color string | DraculaPalette
function M.invert(color)
  if type(color) == "table" then
    for key, value in pairs(color) do
      color[key] = M.invert(value)
    end
  elseif type(color) == "string" then
    local hsluv = require("dracula.hsluv")
    if color ~= "NONE" then
      local hsl = hsluv.hex_to_hsluv(color)
      hsl[3] = 100 - hsl[3]
      if hsl[3] < 40 then
        hsl[3] = hsl[3] + (100 - hsl[3]) * M.day_brightness
      end
      return hsluv.hsluv_to_hex(hsl)
    end
  end
  return color
end

---@param file string
function M.read(file)
  local fd = assert(io.open(file, "r"))
  ---@type string
  local data = fd:read("*a")
  fd:close()
  return data
end

---@param file string
---@param contents string
function M.write(file, contents)
  vim.fn.mkdir(vim.fn.fnamemodify(file, ":h"), "p")
  local fd = assert(io.open(file, "w+"))
  fd:write(contents)
  fd:close()
end

M.cache = {}

---@param key string
function M.cache.file(key)
  return vim.fn.stdpath("cache") .. "/" .. key .. ".json"
end

---@param key string
function M.cache.read(key)
  ---@type boolean, DraculaCache
  local ok, ret = pcall(function()
    return vim.json.decode(M.read(M.cache.file(key)), { luanil = {
      object = true,
      array = true,
    } })
  end)
  return ok and ret or nil
end

---@param key string
---@param data DraculaCache
function M.cache.write(key, data)
  pcall(M.write, M.cache.file(key), vim.json.encode(data))
end

function M.cache.clear()
  for _, style in ipairs({ "default", "day", "soft" }) do
    uv.fs_unlink(M.cache.file(style))
  end
end

---@param hl DraculaHighlight
---@param opts DraculaConfig
function M.handle_undercurl(opts, hl)
  if opts.prefer_undercurl then
    hl.undercurl = true
  else
    hl.underline = true
  end
  return hl
end

return M
