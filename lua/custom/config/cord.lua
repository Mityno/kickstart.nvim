-- Editors name x icon table
local editor_icon_table = {
  emacs = 'https://linuxsimply.com/wp-content/uploads/2022/12/emacs-in-linux-1-768x768.png',
  nano = 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Gnu-nano.svg/1920px-Gnu-nano.svg.png',
  atom = 'https://logodix.com/logo/346515.png',
  pycharm = 'https://resources.jetbrains.com/storage/products/company/brand/logos/PyCharm_icon.png',
  notepadpp = 'https://logodix.com/logo/1677314.png',
  visualstudio = 'https://logodix.com/logo/58001.png',
  visualstudiocode = 'https://logodix.com/logo/719944.png',
  xcode = 'https://logodix.com/logo/1977827.png',
  word = 'https://logodix.com/logo/47195.png',
  intellij = 'https://logodix.com/logo/1773394.png',
  zed = 'https://zed.dev/_next/static/media/preview-app-logo.0nw_0ukesh~lr.png',
  sublimetext = 'https://www.sublimehq.com/images/sublime_text.png',
  cursor = 'https://i0.wp.com/kickiniteasy.com/wp-content/uploads/2023/08/cursor-ide-logo.jpeg?fit=150%2C150&ssl=1',
}

local editor_name_array = {}
local n = 0

for k, _ in pairs(editor_icon_table) do
  n = n + 1
  editor_name_array[n] = k
end

-- Pick a random editor name and icon
math.randomseed() -- required to generate an actually random number
local random_index = math.random(#editor_name_array)
local random_editor_name = editor_name_array[random_index]
local random_editor_icon = editor_icon_table[random_editor_name]

require('cord').setup {
  editor = { icon = random_editor_icon },
  display = { theme = 'catppuccin', flavor = 'light', swap_icons = true },
}
