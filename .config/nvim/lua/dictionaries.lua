-- local dictionary_base = vim.fn.getenv("XDG_CONFIG_HOME") .. "/nvim/lua/dictionaries/"
local dictionary_base = "/home/user/.config/nvim/lua/dictionaries/"

local Dictionary_files = {
  ["de-DE"] = {"dictionary_de-de.txt", "dictionary_names.txt"},
  ["en-US"] = {"dictionary_en-us.txt", "dictionary_names.txt"},
}

function GetDictFiles(lang)
  local files = Dictionary_files[lang]
  if files then
    return files
  else
    return nil
  end
end

function ReadFiles(lang)
  local files = GetDictFiles(lang)
  local dict = {}
  if files then
    for _, file in ipairs(files) do
      local f = assert(io.open(file, "r"))
      if f then
        for l in f:lines() do
          table.insert(dict, l)
        end
      else
        print("Can not read dict file %q", file)
      end
    end
  else
    print("Lang %q has no files", lang)
  end
  return dict
end

for k,v in pairs(Dictionary_files) do
  for a,b in pairs(v) do
    Dictionary_files[k][a] = dictionary_base .. b
  end
end

Dictionaries = {
  ["de-DE"] = ReadFiles("de-DE"),
  ["en-US"] = ReadFiles("en-US"),
}
