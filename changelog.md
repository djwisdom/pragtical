# Changes Log

## [3.6.0] - 2025-06-30

### New Features

* Add REPL and run commands to the CLI
  ([#280](https://github.com/pragtical/pragtical/pull/280))

### Fixes

* Fix crash on out of window mouse events
  ([#231](https://github.com/pragtical/pragtical/pull/231))

* Fix possible on doc close crash when highlighting
  ([#232](https://github.com/pragtical/pragtical/pull/232))

* Properly saves a cleared binding from settings ui
  ([#240](https://github.com/pragtical/pragtical/pull/240))

* Doc search fixes and types documentation.
  ([#243](https://github.com/pragtical/pragtical/pull/243))

* Fix regex find_offsets not substracting offset
  ([#245](https://github.com/pragtical/pragtical/pull/245))

* "Properly" handle whole line matches on doc search
  ([#246](https://github.com/pragtical/pragtical/pull/246))

* Return single value on command.prettify_name
  ([#247](https://github.com/pragtical/pragtical/pull/247))

* Node: skip hidden tab events
  ([#256](https://github.com/pragtical/pragtical/pull/256))

* Corrections to language_python
  ([#278](https://github.com/pragtical/pragtical/pull/278))

* Avoid process thread leak on LuaJIT and better solution to call
  process \__gc on LuaJIT
  ([7c4c1f2c](https://github.com/pragtical/pragtical/commit/7c4c1f2c8eb7bdaf33ee97b7df030bc26371ed50))

* language_xml: remove escape chars from strings (#286)
  ([#286](https://github.com/pragtical/pragtical/pull/286))

### Build System

* Bump CI ubuntu containers
  ([#233](https://github.com/pragtical/pragtical/pull/233))

* CI: Polyfill GLIBC for backward compatibility
  ([#234](https://github.com/pragtical/pragtical/pull/234))

* Include 'user' directory on portable installs
  ([#250](https://github.com/pragtical/pragtical/pull/250))

* CI: update Windows to more recent version
  ([#252](https://github.com/pragtical/pragtical/pull/252))

* Updates for latest plugin manager changes
  ([#255](https://github.com/pragtical/pragtical/pull/255))

* Silence thirdparty library compiler warnings
  ([#271](https://github.com/pragtical/pragtical/pull/271))

* Update SDL2 to latest fixes from master
  ([#282](https://github.com/pragtical/pragtical/pull/282))

### Enhancements

* Include additional glyphs on icons.ttf
  ([#236](https://github.com/pragtical/pragtical/pull/236))

* Capture replacements on regex/patterns search ui
  ([#244](https://github.com/pragtical/pragtical/pull/244))

* Make DATADIR and USERDIR fonts path portable
  ([#249](https://github.com/pragtical/pragtical/pull/249))

* Allow spaces in plugins mod-version
  ([#253](https://github.com/pragtical/pragtical/pull/253))

* projectsearch: add open tab command
  ([#258](https://github.com/pragtical/pragtical/pull/258))

* restore light lcd filter for slight hinting
  ([#265](https://github.com/pragtical/pragtical/pull/265))

* align soft indention to indention size
  ([#267](https://github.com/pragtical/pragtical/pull/267))

* rework dirmonitors to be able to support multiple backends
  ([#266](https://github.com/pragtical/pragtical/pull/266))

* projectsearch: find current doc selection
  ([#268](https://github.com/pragtical/pragtical/pull/268))

* projectsearch: on hide focus previous docview
  ([#275](https://github.com/pragtical/pragtical/pull/275))

* Do not sort fuzzy results on empty needle
  ([#276](https://github.com/pragtical/pragtical/pull/276))

* Lua doc comment improvements for better API reference generation
  ([#185](https://github.com/pragtical/pragtical/pull/185))

* cli: always display commands sorted by name
  ([#279](https://github.com/pragtical/pragtical/pull/279))

* autocomplete: keep previous items on re-trigger
  ([#283](https://github.com/pragtical/pragtical/pull/283))

* highlight_current_line "no_selection" now default
  ([#284](https://github.com/pragtical/pragtical/pull/284))

### GUI and Widgets

* Updated default color scheme.
  ([#237](https://github.com/pragtical/pragtical/pull/237))

* Settings: allow filtering colors
  ([#238](https://github.com/pragtical/pragtical/pull/238))

* Search UI fixes and usage of new icons
  ([#239](https://github.com/pragtical/pragtical/pull/239))

* Enabled word wrap on settings ui labels
  ([#241](https://github.com/pragtical/pragtical/pull/241))

* Allow always hiding tabs, great for zen mode!
  ([#242](https://github.com/pragtical/pragtical/pull/242))

* Show bindings on search ui and empty view tooltips
  ([#248](https://github.com/pragtical/pragtical/pull/248))

* projectsearch: added built-in controls
  ([#257](https://github.com/pragtical/pragtical/pull/257))

* settings gui: option to select dirmonitor backend
  ([#270](https://github.com/pragtical/pragtical/pull/270))

* search_ui: hide replace by default, add toggle
  ([#285](https://github.com/pragtical/pragtical/pull/285))

* foldingbook: keep tabs updated

* textbox: added customized highlighter without coroutine

* colorpicker: update sliders color on every update

* Fix show animation on strange Node size changes

* Set textview name same as parent

* SearchReplaceList: add regex replacing support

* Allow showing a command binding on tooltip

* Improved FoldingBook expand calculations

* Add word wrap support to Label widget

* Fix on draw_styled_text elements checking

* Added ToggleButton widget

* Use new pragtical icons on various widgets

* Allow customization of line widget color

* Fix possible endless loop on animations

### Performance

* Wait thread avg time when it exceeds max time
  ([#264](https://github.com/pragtical/pragtical/pull/264))

### Lite XL Inherited Changes

* add a \__tostring method to every object
  ([#1534](https://github.com/lite-xl/lite-xl/pull/1534))

* Better wasm support again
  ([#1779](https://github.com/lite-xl/lite-xl/pull/1779))

* renderer: defer bitmap rendering when possible
  ([#1856](https://github.com/lite-xl/lite-xl/pull/1856))

* renderer: pass errors via SDL_SetError
  ([#1919](https://github.com/lite-xl/lite-xl/pull/1919))

* fix: use current char to determine col in DocView:get_x_offset_col
  ([#1946](https://github.com/lite-xl/lite-xl/pull/1946))

* common: allow / and \ as PATHSEP on Windows when fuzzy matching files
  ([#1992](https://github.com/lite-xl/lite-xl/pull/1992))

* fix: use correct charmap and glyphmap sizes
  ([#1999](https://github.com/lite-xl/lite-xl/pull/1999))

* language_cpp: add back digit separators
  ([#2026](https://github.com/lite-xl/lite-xl/pull/2026))

* syntax: warn against malformed patterns and disable them
  ([#2029](https://github.com/lite-xl/lite-xl/pull/2029))

* balance computed directory list, remove recursive function invocation
  ([#1991](https://github.com/lite-xl/lite-xl/pull/1991))

* language_lua: add files with rockspec extenstion
  ([#2083](https://github.com/lite-xl/lite-xl/pull/2083))

* Coroutine Process Fix
  ([#2099](https://github.com/lite-xl/lite-xl/pull/2099))

## [3.5.2] - 2025-03-14

### Fixes

* Respect multi-byte sequences on SHIFT_JIS ¥ handling
  ([#202](https://github.com/pragtical/pragtical/pull/202))

* Explicitly include limits.h on utf8 lib
  ([#207](https://github.com/pragtical/pragtical/pull/207))

* Fix treeview new dir/folder path suggestions
  ([#208](https://github.com/pragtical/pragtical/pull/208))

* Explicitly added missing headers
  ([#209](https://github.com/pragtical/pragtical/pull/209))

* Also redirect stdin to console on windows
  ([#206](https://github.com/pragtical/pragtical/pull/206))

* Fix handling of documents Bytes Order Mark (BOM)
  ([#218](https://github.com/pragtical/pragtical/pull/218))

* Silence shmem API compiler warnings
  ([#223](https://github.com/pragtical/pragtical/pull/223))

* Fix invalid size given to \_wgetcwd
  ([#227](https://github.com/pragtical/pragtical/pull/227))

* Disable a compatibility io overwrite on LuaJIT
  ([#229](https://github.com/pragtical/pragtical/pull/229))

### Build System

* Bump minimum required meson version
  ([#217](https://github.com/pragtical/pragtical/pull/217))

* Disabled addition of open_ext plugin on CI
  ([#219](https://github.com/pragtical/pragtical/pull/219))

* Fix msys CI build
  ([#221](https://github.com/pragtical/pragtical/pull/221))

* Perform Lua unicode patching directly on Meson
  ([#225](https://github.com/pragtical/pragtical/pull/225))

### Enhancements

* Added more annotation subtypes
  ([#220](https://github.com/pragtical/pragtical/pull/220))

* Sync lua-compat-5.3 with upstream
  ([#224](https://github.com/pragtical/pragtical/pull/224))

### Performance

* Perform collectgarbage step instead of collect
  ([#226](https://github.com/pragtical/pragtical/pull/226))

### Lite XL Inherited Changes

* Implement logic for tracking target window
  ([#1891](https://github.com/lite-xl/lite-xl/pull/1891))

* allocator: add arena_allocator

* utfconv: add functions that use arena_allocator

* process: migrate arg validation and checking to Lua

* Additional small fixes for windows as part of the process API move to lua.

* Add support for relative requires
  ([#1634](https://github.com/lite-xl/lite-xl/pull/1634))

* Fix multi-type usage in delimited patterns
  ([#1740](https://github.com/lite-xl/lite-xl/pull/1740))

* Add inclusive parameter to Doc:get_text
  ([#1586](https://github.com/lite-xl/lite-xl/pull/1586))

* Add minimum_thumb_size and {contracted,expanded}_scrollbar_margin to `Scrollbar`
  ([#1589](https://github.com/lite-xl/lite-xl/pull/1589))

* Format renderer font scale code to be actually readable

* check item type before creating input text
  ([#1904](https://github.com/lite-xl/lite-xl/pull/1904))

* docview: prevent overscroll when DocView size is less than lh * 2
  ([#1971](https://github.com/lite-xl/lite-xl/pull/1971))

* process: do not return nil until process exited
  ([#1973](https://github.com/lite-xl/lite-xl/pull/1973))

* process: call poll_process when getting returncode

* feat: add support for tab stops
  ([#1945](https://github.com/lite-xl/lite-xl/pull/1945))

* Update CSS plugin to support more units
  ([#2010](https://github.com/lite-xl/lite-xl/pull/2010))

* Added in stdlib
  ([#2017](https://github.com/lite-xl/lite-xl/pull/2017))

## [3.5.1] - 2024-10-09

### Fixes

* Check valid line state on retokenization check
  ([#186](https://github.com/pragtical/pragtical/pull/186))

* Fix language_js embedded html matching
  ([#187](https://github.com/pragtical/pragtical/pull/187))

* Fix DirWatch check duplication on multiple mode
  ([#197](https://github.com/pragtical/pragtical/pull/197))

### Enhancements

* Make the input latency reduction toggleable
  ([#188](https://github.com/pragtical/pragtical/pull/188))

* Always keep default scale updated on scale changes
  ([#190](https://github.com/pragtical/pragtical/pull/190))

* Use wayland by default if possible on linux
  ([#191](https://github.com/pragtical/pragtical/pull/191))

* CLI subcommands: allow skipping invalid arguments
  ([#192](https://github.com/pragtical/pragtical/pull/192))

* Restore DirWatch unwatch/watch behavior
  ([#193](https://github.com/pragtical/pragtical/pull/193))

* Fully move autoreload cleanup from co to Doc:on_close
  ([#194](https://github.com/pragtical/pragtical/pull/194))

* Add a .exe to .com console wrapper on windows
  ([#199](https://github.com/pragtical/pragtical/pull/199))

### Lite XL Merged Changes

* api/system: make stat() call consistent across platforms
  ([#195](https://github.com/pragtical/pragtical/pull/195))

* treeview: remove unused code
  ([#1895](https://github.com/lite-xl/lite-xl/pull/1895))

## [3.5.0] - 2024-09-15

### Performance Improvements

* Lower input latency improving co-routine scheduling and tokenizer
  ([#174](https://github.com/pragtical/pragtical/pull/174))

* Reduce the amount of co-routines needed on startup
  ([#176](https://github.com/pragtical/pragtical/pull/176))

* Document lax param and use on tokenizer ulen calls
  ([#183](https://github.com/pragtical/pragtical/pull/183))

### Enhancements

* Added PerMonitor dpi awareness to windows manifest
  ([#158](https://github.com/pragtical/pragtical/pull/158))

* Don't trust weak table keys to clean cached items
  ([#164](https://github.com/pragtical/pragtical/pull/164))

### API

* Introduce new ignore files handling functions
  ([#177](https://github.com/pragtical/pragtical/pull/177))

* Use project version as mods version
  ([#184](https://github.com/pragtical/pragtical/pull/184))

### Fixes

* Fix issues with window size restoration (spotted on Windows)
  ([#162](https://github.com/pragtical/pragtical/pull/162))

* IPC Plugin: restore current project working dir
  ([#167](https://github.com/pragtical/pragtical/pull/167))

* If all documents are closed chdir to root project
  ([#168](https://github.com/pragtical/pragtical/pull/168))

* findfile: use project when resolving file path
  ([#169](https://github.com/pragtical/pragtical/pull/169))

* Fix regex api wrong value set to regex.ENDANCHORED
  ([#170](https://github.com/pragtical/pragtical/pull/170))

* regex api: use proper type for options parameter
  ([#171](https://github.com/pragtical/pragtical/pull/171))

* Do not maximize window on macOS at startup
  ([#175](https://github.com/pragtical/pragtical/pull/175))

* Process TitleView button actions on mouse release
  ([#178](https://github.com/pragtical/pragtical/pull/178))

### Build System

* Add Linux AArch64 build target to CI
  ([#157](https://github.com/pragtical/pragtical/pull/157))

* CI: Properly enable ccache for linux builds
  ([#161](https://github.com/pragtical/pragtical/pull/161))

### Widgets

* Allow scheduling core updates and redraws
  ([a2637c37](https://github.com/pragtical/widget/commit/a2637c377da8a92eb4bd966d12ab6a45e71c4e43))

### Lite XL Inherited Changes

* DocView: check token_count not 0
  ([#1879](https://github.com/lite-xl/lite-xl/pull/1879))

* Added in keyboard shortcut tooltips.
  ([#1880](https://github.com/lite-xl/lite-xl/pull/1880))

* Add primary selection support
  ([#1729](https://github.com/lite-xl/lite-xl/pull/1729))

## [3.4.4] - 2024-08-27

### Fixes

* Adjust scale retrieveal on startup
  ([#152](https://github.com/pragtical/pragtical/pull/152))

* When scale changes rescale item sizes on LogView
  ([#154](https://github.com/pragtical/pragtical/pull/154))

* Updated widgets to latest with smaller rescale fix
  ([#155](https://github.com/pragtical/pragtical/pull/155))

* Rescale the EmptyView icons font on instantiation
  ([#156](https://github.com/pragtical/pragtical/pull/156))

## [3.4.3] - 2024-08-26

### New Features

* Add cli flag to allow forking editor to background
  ([#132](https://github.com/pragtical/pragtical/pull/132))

* Scale plugin: added commands and bindings to allow zooming/scaling the code
  independently of the user interface.
  ([#150](https://github.com/pragtical/pragtical/pull/150))

### Performance Improvements

* Widgets: moved most calculations out of `update` to specialized
  `update_size_position` function that gets called mostly only when neccesary.
  Also improved widgets size/position calculations for better scaling.
  ([#9](https://github.com/pragtical/widget/pull/9))

### Enhancements

* Patched some luajit functions to support unicode file names
  and strings on windows
  ([#138](https://github.com/pragtical/pragtical/pull/138))

* Always select first result on findfile plugin
  ([#141](https://github.com/pragtical/pragtical/pull/141))

### Fixes

* Use PRAGTICAL_USERDIR instead of HOME on `scripts/run-local` because
  XDG_CONFIG_HOME been set has priority over HOME.
  ([#133](https://github.com/pragtical/pragtical/pull/133))

* Fix scaling logic regressions, now macOS builds are configure by default
  with the software renderer since current display scale is detected at startup
  and applied on the whole interface, also the plain software renderer is faster.
  ([#134](https://github.com/pragtical/pragtical/pull/134))

* Return actual scale on `system.get_scale()` for macOS too
  ([#143](https://github.com/pragtical/pragtical/pull/143))

* Minor correction on search_ui replace button position
  ([#149](https://github.com/pragtical/pragtical/pull/149))

### Build System

* Fix rolling builds staying as draft
  ([a0d062f5](https://github.com/pragtical/pragtical/commit/a0d062f5e9017f2f1878daf42dd197a007ff45b6))

* Remove widget submodule in favor of subproject
  ([#148](https://github.com/pragtical/pragtical/pull/148))

## [3.4.2] - 2024-08-11

### Performance Improvements

* Revert previous optimized glyphset loading lite-xl/lite-xl#1543
  and rebased/merged new implementation which is even faster
  ([lite-xl/lite-xl#1845](https://github.com/lite-xl/lite-xl/pull/1845))

* Port rest of regex functions from Lua to C
  ([#120](https://github.com/pragtical/pragtical/pull/120))

### Enhancements

* Enable utf8 module for Lua < 5.3 using utf8extra
  ([#119](https://github.com/pragtical/pragtical/pull/119))

* Use core.warn on autocomplete plugin
  ([89d24eb4](https://github.com/pragtical/pragtical/commit/89d24eb45e82a2bd49ce0a8ed56e313169c17693))

* Improvements to c/c++ language plugins
  ([#128](https://github.com/pragtical/pragtical/pull/128))

### Fixes

* Fix thread initialization on non macOS bundle
  ([#118](https://github.com/pragtical/pragtical/pull/118))

* Fix use of no longer valid core.add_project_directory
  ([#121](https://github.com/pragtical/pragtical/pull/121))

* Fix for IPC plugin to properly open a relative path
  ([#125](https://github.com/pragtical/pragtical/pull/125))

### Build System

* Fix PPM build on msys
  ([#126](https://github.com/pragtical/pragtical/pull/126))

* Update sdl2 wrap to v2.30.6 which fixes an initialization
  issue on hyprland and other wrap components.
  ([#127](https://github.com/pragtical/pragtical/pull/127))

## [3.4.1] - 2024-06-28

### Fixes

* If no surface return on font_render_glyph
  ([#114](https://github.com/pragtical/pragtical/pull/114))

* Restore support for tokenizer empty matches with subsyntax
  ([#111](https://github.com/pragtical/pragtical/pull/112))

* If encoding detect fails check if UTF-16/32 LE/BE
  ([#115](https://github.com/pragtical/pragtical/pull/115))

### Enhancements

* Better matching of placeholder chars (_) on lua
  ([#112](https://github.com/pragtical/pragtical/pull/112))

* Better restore of window mode/size on startup
  ([#113](https://github.com/pragtical/pragtical/pull/113))

* Added custom symbols pattern to language c and cpp
  ([#116](https://github.com/pragtical/pragtical/pull/116))

* autocomplete: strip punctuations from partials
  ([#117](https://github.com/pragtical/pragtical/pull/117))

## [3.4.0] - 2024-06-25

### New Features

* Add ui config to toggle the treeview toolbar
  ([#84](https://github.com/pragtical/pragtical/pull/84))

* Support multiple projects on the findfile plugin
  ([#100](https://github.com/pragtical/pragtical/pull/100))

* Multiproject handling for statusview doc:file
  ([#101](https://github.com/pragtical/pragtical/pull/101))

* Introductory window creation and management using Lua
  ([#108](https://github.com/pragtical/pragtical/pull/108))

### Performance Improvements

* Basic doc/docview cache for better performance
  ([#105](https://github.com/pragtical/pragtical/pull/105))

### Fixes

* CLI: lowercase the appname on usage description
  ([#92](https://github.com/pragtical/pragtical/pull/92))

* Mark common.serializeoptions fields as optional
  ([#95](https://github.com/pragtical/pragtical/pull/95))

* Render the statusview message on demand
  ([#103](https://github.com/pragtical/pragtical/pull/103))

* Check doc is still in view before autoreloading it
  ([#104](https://github.com/pragtical/pragtical/pull/104))

* Handle conversion of \ to ¥ as reported on #94
  ([#106](https://github.com/pragtical/pragtical/pull/106))

* Support for utf-8 text reduction on node title
  ([#107](https://github.com/pragtical/pragtical/pull/107))

### Enhancements

* Add /usr/local/bin, /usr/local/sbin to PATH on Mac OS X
  ([#87](https://github.com/pragtical/pragtical/pull/87))

* Assign `ctrl+,` binding to open user module command
  ([#88](https://github.com/pragtical/pragtical/pull/88))

* Update JetBrains Mono font to latest version 2.304
  ([#91](https://github.com/pragtical/pragtical/pull/91))

* Auto chdir to project depending on active document
  ([#93](https://github.com/pragtical/pragtical/pull/93))

* Improvements to core.visited_files handling
  ([#96](https://github.com/pragtical/pragtical/pull/96))

### Workarounds

* Disable assert on font resizing to allow fonts scanning.
  ([#89](https://github.com/pragtical/pragtical/pull/89))

### Build System

* Changes to msys build on rolling release workflow
  ([d5811328](https://github.com/pragtical/pragtical/commit/d581132858e9427717fa853e7fd21f0963a90ad0))

* Various maintainance changes to github workflows

### Widgets

* Use correct path separator on FilePicker widget
  ([1347e8c3](https://github.com/pragtical/widget/commit/1347e8c337fd4715702e3347f2277f93c1379570))

* Update for lua window management
  ([#7](https://github.com/pragtical/widget/pull/7))

### Lite XL Inherited Changes

* build: fix dirmonitor backend selection
  ([#1790](https://github.com/lite-xl/lite-xl/pull/1790))

* api/system: fix newlines returned by get_clipboard
  ([#1788](https://github.com/lite-xl/lite-xl/pull/1788))

* Change co_wait to co_await in language_cpp
  ([#1800](https://github.com/lite-xl/lite-xl/pull/1800))

* build: fix dirmonitor backend selection
  ([#1790](https://github.com/lite-xl/lite-xl/pull/1790))

* Handle static constexpr in language_cpp
  ([#1806](https://github.com/lite-xl/lite-xl/pull/1806))

* improve number highlighting for c
  ([#1752](https://github.com/lite-xl/lite-xl/pull/1752))

* language_cpp: backport number highlighting from c
  ([#1818](https://github.com/lite-xl/lite-xl/pull/1818))

* Add support for binary integer literals.
  ([#1819](https://github.com/lite-xl/lite-xl/pull/1819))

* Update language_python.lua
  ([#1723](https://github.com/lite-xl/lite-xl/pull/1723))

* rootview: workaround macos weird dnd event timing

* Expand Process API
  ([#1757](https://github.com/lite-xl/lite-xl/pull/1757))

* fix(dirmonitor): avoid calling the change callback multiple times
  in the same notification
  ([#1824](https://github.com/lite-xl/lite-xl/pull/1824))

* core/rootview: fix dnd multiple folders into dock
  ([#1828](https://github.com/lite-xl/lite-xl/pull/1828))

*  fix(doc): convert Doc:merge_cursors parameter from "selection index"
   to table index

* core/doc: fix wrong table index in Doc:merge_cursors

* Keep font scale updated for RENDERER backend

## [3.3.1] - 2024-04-18

### New Features

* settings ui: added max_visible_commands config
  ([#79](https://github.com/pragtical/pragtical/pull/79))

### Fixes

* Fixes to autocomplete re-sizing code
  ([#76](https://github.com/pragtical/pragtical/pull/76))

* Fix conflicting goto jump on tokenizer which was introduced by the skipping
  of patterns matching nothing code.
  ([b2d03264](https://github.com/pragtical/pragtical/commit/b2d03264046e4f1afa7360c1cd738b44bc824af3))

### Enhancements

* Renamed numpad insert key from 'ins' to 'insert' and empty 5 to 'clear'
  ([#73](https://github.com/pragtical/pragtical/pull/73))

* Added TextEditor category on linux
  ([#77](https://github.com/pragtical/pragtical/pull/77))

* plugin language_lua: added unescaped \[\=string\=\] support
  ([#78](https://github.com/pragtical/pragtical/pull/78))

* Alert by default of file changes in autoreload plugin
  ([#82](https://github.com/pragtical/pragtical/pull/82))

### Build System

* Build the plugin manager statically for msys
  ([#80](https://github.com/pragtical/pragtical/pull/80))

* Fix for mbedtls2 detection on ppm subproject
  ([abc2d93f](https://github.com/pragtical/pragtical/commit/abc2d93f880633aa966a6c762ede2e3b3d86a9d0))

* Meson subproject updates
  ([6f5ab121](https://github.com/pragtical/pragtical/commit/6f5ab1212f02e10219723a72df6abe54acb54cac))

### Lite XL Inherited Changes

* Improve autocomplete scroll behavior
  ([#1732](https://github.com/lite-xl/lite-xl/pull/1732))

* Fix language_js regex/comment distinction
  ([#1731](https://github.com/lite-xl/lite-xl/pull/1731))

* scripts: not hardcode MSYSTEM
  ([#1739](https://github.com/lite-xl/lite-xl/pull/1739))

* Add SerenityOS platform support
  ([#1745](https://github.com/lite-xl/lite-xl/pull/1745))

* Limit language_js regex avoidance to numbers, and fix starting /\* comments
  ([#1744](https://github.com/lite-xl/lite-xl/pull/1744))

* Fixed some typos in core.init
  ([#1755](https://github.com/lite-xl/lite-xl/pull/1755))

* Added Arduino syntax highlighting support alongside C++.
  ([#1767](https://github.com/lite-xl/lite-xl/pull/1767))

* Fix BufferSize in g_read for Windows
  ([#1722](https://github.com/lite-xl/lite-xl/pull/1722))

* Skip patterns matching nothing in tokenizer
  ([#1743](https://github.com/lite-xl/lite-xl/pull/1743))

## [3.3.0] - 2024-02-26

### API

* Expose renderer.font.get_metadata() as a method, documented it, etc...
  ([#64](https://github.com/pragtical/pragtical/pull/64))

* Expose get_partial_symbol on autocomplete plugin (for LSP)
  ([#66](https://github.com/pragtical/pragtical/pull/66))

* Increase mod version from 3.3.1 to 3.4.0 (also because of new system.setenv)
  ([#68](https://github.com/pragtical/pragtical/pull/68))

### Fixes

* Fix modversion matching to align with semver
  ([#71](https://github.com/pragtical/pragtical/pull/71))

### Enhancements

* Enable horizontal scrollbar on treeview plugin
  ([#63](https://github.com/pragtical/pragtical/pull/63))

* Added adaptive sizing to autocomplete plugin
  ([#67](https://github.com/pragtical/pragtical/pull/67))

### Build System

* Removed no longer needed microtar subproject
  ([#70](https://github.com/pragtical/pragtical/pull/70))

### Widgets

* Optimize SearchReplaceList collapse/uncollapse
  ([#4](https://github.com/pragtical/widget/pull/4))

* FontDialog: use the font metadata preview text if available
  ([#5](https://github.com/pragtical/widget/pull/5))

* Added new TreeList widget
  ([#6](https://github.com/pragtical/widget/pull/6))

### Performance Improvements

* Merged: glyphset loading optimization for faster font loading
  ([#1543](https://github.com/lite-xl/lite-xl/pull/1543))

### Lite XL Inherited Changes

* process: fix unitialized variables
  ([#1719](https://github.com/lite-xl/lite-xl/pull/1719))

* Added .pyi extension to python.
  ([#1728](https://github.com/lite-xl/lite-xl/pull/1728))

## [3.2.2] - 2024-01-30

### Fixes

* Fix project module sometimes not loading.
  ([#54](https://github.com/pragtical/pragtical/pull/54))

* Correct the runtime environment variable
  ([#55](https://github.com/pragtical/pragtical/pull/55))

* Use unique GUID for the inno setup installer
  ([#58](https://github.com/pragtical/pragtical/pull/58))

* Null check file_info on core.open_doc
  ([4418bb6c](https://github.com/pragtical/pragtical/commit/4418bb6cae81e30f53ed54e97138c48dd7ee81d5))

### Enhancements

* Merge findfileimproved into findfile plugin
  and made the loading text update smoother.
  ([#53](https://github.com/pragtical/pragtical/pull/53))

* Update thread initialization code to match main
  ([#56](https://github.com/pragtical/pragtical/pull/56))

* Update macOS icons to be more close to apple guidelines
  ([#57](https://github.com/pragtical/pragtical/pull/57))

* Limit max bytes read when detecting file encoding
  ([#59](https://github.com/pragtical/pragtical/pull/59))

* Respect config.file_size_limit on some components
  ([#60](https://github.com/pragtical/pragtical/pull/60))

### Lite XL Inherited Changes

* Fix doc:create-cursor-previous/next-line with tabs
  ([#1697](https://github.com/lite-xl/lite-xl/pull/1697))

* Memory fixes
  ([#1705](https://github.com/lite-xl/lite-xl/pull/1705))

* Improve number highlighting for python syntax highlighting
  ([#1704](https://github.com/lite-xl/lite-xl/pull/1704))

* reorder nagview options on doc:save error to be more consistent with other
  nagview confirmations
  ([#1696](https://github.com/lite-xl/lite-xl/pull/1696))

* autoreload docs only if their filename matches an actual file
  ([#1698](https://github.com/lite-xl/lite-xl/pull/1698))

* language_js: support binary and octal representation
  ([#1710](https://github.com/lite-xl/lite-xl/pull/1710))

* process: style changes
  ([#1709](https://github.com/lite-xl/lite-xl/pull/1709))

* Add system.setenv
  ([#1706](https://github.com/lite-xl/lite-xl/pull/1706))

## [3.2.1] - 2023-12-19

### New Features

* Added project wide search and replace support
  ([#48](https://github.com/pragtical/pragtical/pull/48))

* Added config.line_endings support to settings gui
  ([c487a19f](https://github.com/pragtical/pragtical/commit/c487a19f732c3074a88dc3c005fc79501a8af7a7))

### Fixes

* Obtain symbols pattern/nonword-chars for subsyntax
  ([#45](https://github.com/pragtical/pragtical/pull/45))

* Build: system_iconv is needed on windows fixes #46
  ([#47](https://github.com/pragtical/pragtical/pull/47))

* search_ui: set filepicker path on project-search:find
  ([d8e51e54](https://github.com/pragtical/pragtical/commit/d8e51e54f0ebe644587f16c28443814eb6a00211))

* search_ui: do not set filepicker if path nil
  ([6a5c9547](https://github.com/pragtical/pragtical/commit/6a5c954759bd7eb6747273765dcc4e3c745ad067))

* Use cmalloc instead of malloc on render init
  ([#51](https://github.com/pragtical/pragtical/pull/51))

* Check tokenizer state to prevent issues with evergreen
  ([#52](https://github.com/pragtical/pragtical/pull/52))

### Enhancements

* Remove recent projects that no longer exists
  ([#49](https://github.com/pragtical/pragtical/pull/49))

* Prettify the session file output for easy reading
  ([#50](https://github.com/pragtical/pragtical/pull/50))

* Reload applicable opened docs on project search/replace
  ([bf471672](https://github.com/pragtical/pragtical/commit/bf4716725f127db4bb88b01b4d9ce70ae6603f46))

### Widgets

* Added SearchReplaceList widget
  ([#3](https://github.com/pragtical/widget/pull/3))

* SearchReplaceList: truncate long results
  ([e54e8766](https://github.com/pragtical/widget/commit/e54e8766390effa72c2217a6c68619c59507509b))

### Lite XL Inherited Changes

* Fix editing after undo not clearing the change id
  ([#1574](https://github.com/lite-xl/lite-xl/pull/1574))

* Fix patterns starting with ^ in tokenizer
  ([#1645](https://github.com/lite-xl/lite-xl/pull/1645))

* Fix dirmonitor sorting issues
  ([#1599](https://github.com/lite-xl/lite-xl/pull/1599))

* Fix language_js regex constant detection
  ([#1581](https://github.com/lite-xl/lite-xl/pull/1581))

* Use x offset to define render command rect in rencache_draw_text
  ([#1618](https://github.com/lite-xl/lite-xl/pull/1618))

* feat(process): allow commands and envs on proces_start
  ([#1477](https://github.com/lite-xl/lite-xl/pull/1477))

* Use \r\n for new files on Windows
  ([#1596](https://github.com/lite-xl/lite-xl/pull/1596))

* fix nagbar failed save message
  ([#1678](https://github.com/lite-xl/lite-xl/pull/1678))

* Fixed a minor bug, should close issue
  ([#1680](https://github.com/lite-xl/lite-xl/pull/1680))

* turn window_renderer into managed pointer
  ([#1683](https://github.com/lite-xl/lite-xl/pull/1683))

## [3.2.0] - 2023-11-21

### New Features

* CLI parser API
  ([#28](https://github.com/pragtical/pragtical/pull/28))

* Bundle the plugin manager as a meson subproject and new
  plugins button as part of the welcome screen
  ([#33](https://github.com/pragtical/pragtical/pull/33))

* Allow console output on windows
  ([#37](https://github.com/pragtical/pragtical/pull/37))

### Fixes

* Some overwrite mode fixes:
  - Overwrite mode only on single character input
    ([32f23027](https://github.com/pragtical/pragtical/commit/32f23027f41dd4c0cd80215b629f7073de2b6369))
  - Overwrite mode only when no text selected
    ([ae0d3502](https://github.com/pragtical/pragtical/commit/ae0d35024c408d0f7876763d296e79b0fd1567b7))

* Fixed IPC plugin shmem not detected on MacOS
  ([3cb3bf08](https://github.com/pragtical/pragtical/commit/3cb3bf08bed98c00a961ecc0b80c772d93a64d1a))

* Fix node resizing on touch events
  ([lite-xl/lite-xl#1657](https://github.com/lite-xl/lite-xl/pull/1657))

* Call process.__gc() when restarting on LuaJIT
  ([3066f278](https://github.com/pragtical/pragtical/commit/3066f278bc889aec1ce0223cf1786bb8053183de))

* Set a minimum window size to prevent sizing issues
  ([c87ae559](https://github.com/pragtical/pragtical/commit/c87ae5598dde30300a63fbdd16586503a14cdf42))

* Fix an shmem segfault triggered on macOS
  ([#44](https://github.com/pragtical/pragtical/pull/44))

* Check in autocomplete plugin if doc cached on symbols iterator
  ([6546ee8c](https://github.com/pragtical/pragtical/commit/6546ee8c66ee9df79852a8e2f12089a1706d657e))

* Fix editor crash on invalid UTF-8
  ([#38](https://github.com/pragtical/pragtical/pull/38))

### Enhancements

* Improve toggle fullscreen using previous win state
  ([c108b2d0](https://github.com/pragtical/pragtical/commit/c108b2d09896a8503d6b66b0c94e843d9cfd7b54))

* Added document types and app category to Mac bundle
  ([418e92f8](https://github.com/pragtical/pragtical/commit/418e92f893c8b5ad2aac926e4efc5c76d6c4be7f))

* Added defaults for the 'tag' highlight group (better evergreen support)
  ([cfc96634](https://github.com/pragtical/pragtical/commit/cfc96634c474568ed5457e86bd5a810b25607bec))

### Build System

* Switch luajit wrap to git branch v2.1
  ([05e778d1](https://github.com/pragtical/pragtical/commit/05e778d15af350a40c34149948b0bca4b220bac3))

* Do no check for X11 presence on macOS
  ([5e518511](https://github.com/pragtical/pragtical/commit/5e518511fa4ac1b2a26b0f5cbd3a7a7de2360334))

* Added luajit meson support for msvc
  ([#43](https://github.com/pragtical/pragtical/pull/43))

### Other Changes

* Expose lua_setglobal/getglobal implementations for LuaJIT
  ([82d61cca](https://github.com/pragtical/pragtical/commit/82d61cca4cfdea4702470924b97456ee0aa0c54c))

* Some work to better support different lua runtimes
  ([#40](https://github.com/pragtical/pragtical/pull/40))

* StatusView: micro optimization that skips counting of tabs on current line
  if tab type is not set to "hard".
  ([a359b947](https://github.com/pragtical/pragtical/commit/a359b947713716fef81da30c33097c7364e1a79e))

* Merge: Update luautf8 to latest
  ([lite-xl/lite-xl#1613](https://github.com/lite-xl/lite-xl/pull/1613))

* Merge: Improve font/color change detection in language_md
  ([lite-xl/lite-xl#1614](https://github.com/lite-xl/lite-xl/pull/1614))

* Merge: Fix deleting indentation with multiple cursors
  ([lite-xl/lite-xl#1670](https://github.com/lite-xl/lite-xl/pull/1670))

* Merge: Fix running core.step when receiving an event while not waiting
  ([lite-xl/lite-xl#1667](https://github.com/lite-xl/lite-xl/pull/1667))

* Merge: Limit system.{sleep,wait_event} to timeouts >= 0
  ([lite-xl/lite-xl#1666](https://github.com/lite-xl/lite-xl/pull/1666))

* Merge: Allow writing to hidden files on Windows
  ([lite-xl/lite-xl#1653](https://github.com/lite-xl/lite-xl/pull/1653))

* Merge: Expose plaintext syntax
  ([lite-xl/lite-xl#1652](https://github.com/lite-xl/lite-xl/pull/1652))

* Merge: Configurable statusview icon
  ([lite-xl/lite-xl#1617](https://github.com/lite-xl/lite-xl/pull/1617))

* Merge: Fix selecting newlines with find-replace:select-add-{next,all}
  ([lite-xl/lite-xl#1608](https://github.com/lite-xl/lite-xl/pull/1608))

* Merge: wasm cross file improvements
  ([lite-xl/lite-xl#1660](https://github.com/lite-xl/lite-xl/pull/1660))

### Lite XL Inherited Changes

* fix: dim rendering when antialiasing is turned off
  ([#1641](https://github.com/lite-xl/lite-xl/pull/1641))

* Mark unsaved named files as dirty
  ([#1598](https://github.com/lite-xl/lite-xl/pull/1598))

* Improve common.serialize
  ([#1640](https://github.com/lite-xl/lite-xl/pull/1640))

* Ignore keypresses during IME composition
  ([#1573](https://github.com/lite-xl/lite-xl/pull/1573))

* Save in the workspace unsaved named files and crlf status
  ([#1597](https://github.com/lite-xl/lite-xl/pull/1597))

* ci: fix diff files having "wrong" path separator
  ([#1648](https://github.com/lite-xl/lite-xl/pull/1648))

* Set SDL hint to prefer software render driver
  ([#1646](https://github.com/lite-xl/lite-xl/pull/1646))

* fix(dirmonitor): deadlock if error handler jumps somewhere else
  ([#1647](https://github.com/lite-xl/lite-xl/pull/1647))

* Sanitize tab index in Node:add_view
  ([#1651](https://github.com/lite-xl/lite-xl/pull/1651))

* ease transparency of nagbar dim
  ([#1658](https://github.com/lite-xl/lite-xl/pull/1658))

## [3.1.2] - 2023-09-24

### New Features

* Syntax files symbol_pattern, non_word_chars props
  ([#12](https://github.com/pragtical/pragtical/pull/12))

* New Welcome Screen - Converted emptyview to widget with additions
  ([e08f1b18](https://github.com/pragtical/pragtical/commit/e08f1b18b28e26351a27dd9a5aeeb2bcc4c2d48f))

### Fixes

* Fixes #10 by using the scrollbar expanded size
  ([#11](https://github.com/pragtical/pragtical/pull/11))

* Fix core:open-file to not be dependant on chdir
  ([47bfcb07](https://github.com/pragtical/pragtical/commit/47bfcb07bb1db489f97d2fa4a6c0432905eb87c0))

* Respect coroutines redraw requests while on focus
  ([f450b612](https://github.com/pragtical/pragtical/commit/f450b6124e53b83c5bf41d6261e79ecac555d0ce))

* Do not process clicks on contextmenu divider
  ([#22](https://github.com/pragtical/pragtical/pull/22))

* Fixed issue with open file command
  ([d8906c21](https://github.com/pragtical/pragtical/commit/d8906c2111b056438c142622c16c338fef61a70d))

* MacOS: allow combining cmd+ctrl and replace alt with option
  ([0674f1f5](https://github.com/pragtical/pragtical/commit/0674f1f5a5ebc0866b7e826eeacaadc355325e69))

### Enhancements

* Improvements to language_css
  ([f2a0790d](https://github.com/pragtical/pragtical/commit/f2a0790d2c6b0ace73b66b31a5ea59ac60e7c3c4))

* Better compat math.{tointeger|type|ult} for luajit
  ([80bce6c0](https://github.com/pragtical/pragtical/commit/80bce6c0b1275050a779eac85e79dc472e309d91))

* Added Mike Pall bitops library to non jit lua for consistency
  ([5efc02a8](https://github.com/pragtical/pragtical/commit/5efc02a84350c544a6475255e04e5110eff083b7))

* Use native bit operators on Lua >= 5.3
  ([10cecbec](https://github.com/pragtical/pragtical/commit/10cecbec61015d1b3a01837f082b205d00da87b5))

* Highlight CUDA source code the same as C++
  ([#15](https://github.com/pragtical/pragtical/pull/15))

### UI Enhancements

* statusview: separate item for doc position percent
  [lite-xl/lite-xl#1579](https://github.com/lite-xl/lite-xl/pull/1579)

* Highlight default theme on settings ui, fixes #23
  ([cd7181df](https://github.com/pragtical/pragtical/commit/cd7181dfa5f0d2d2a95081cf3096460b271beec6))

* treeview: do not show hidden files by default
  ([ecda0a0a](https://github.com/pragtical/pragtical/commit/ecda0a0ab7ff1c4f4795bb7af745ab728b5a6798))

### Colors

* Added new Yaru dark and light theme
  ([5fa3cc13](https://github.com/pragtical/colors/commit/5fa3cc13fdf33f4ae7dc0d79c2b377f21761ec3c))

* Improvements to tokyo-night
  ([551c351d](https://github.com/pragtical/colors/commit/551c351d8c57818bcd350a4dae9d10e7c9506384))

* Added solarized_dark theme
  ([b9791efa](https://github.com/pragtical/colors/commit/b9791efad6d7c726b2485cb4126681067c2e3a1c))

* Improvements to Monokai themes
  ([79264c47](https://github.com/pragtical/colors/commit/79264c47449aa5d7f86c2f03558d2205931644eb))

### Build System

* Switch to an older ubuntu builder, fixes #13
  ([#16](https://github.com/pragtical/pragtical/pull/16))

* Fixes for msvc ci run
  ([39caabc0](https://github.com/pragtical/pragtical/commit/39caabc0ac7775141c8cfaff0e53b12abe66d4d8))

* Applied msvc fixes from [lite-xl/lite-xl#1572](https://github.com/lite-xl/lite-xl/pull/1577)

* Rename latest builds to rolling
  ([51754f33](https://github.com/pragtical/pragtical/commit/51754f3375d2cb3d0daae04e6014fa75fa8d45cd))

### Widgets

* Widget: delay RootView require
* ListBox: rendering fixes
* Skip ctrl+wheel by default, better tooltip remove
* Fix floating ListBox rows offset
* ListBox: horizontal scroll support
* SelectBox: hide list when clicking outside
* Better handle ctrl modkey state
* Make widgets inherit name from parent ([#2](https://github.com/pragtical/widget/pull/2))
* Give selectbox container same name as the selectbox ([#1](https://github.com/pragtical/widget/pull/1))

### Lite XL Inherited Changes

* Normalize strokes in fixed order
  ([#1572](https://github.com/lite-xl/lite-xl/pull/1572))

* fix(core): defer core:open-log until everything is loaded
  ([#1585](https://github.com/lite-xl/lite-xl/pull/1585))

* Fix scrollbar misinterpreting percent
  ([#1587](https://github.com/lite-xl/lite-xl/pull/1587))

* Fix returned percent when clicking the Scrollbar track
  ([e07ea0fe](https://github.com/pragtical/pragtical/commit/e07ea0fe11b6dc02a9ed1edd4d2333db0846340a))

* Adds super as a modkey. ([#1590](https://github.com/lite-xl/lite-xl/pull/1590))

* Add NaN guard to View:update_scrollbar
  ([aa0d6f6c](https://github.com/pragtical/pragtical/commit/aa0d6f6c71d4f02bbdbc09ef7f5984f50a21c87c))

* Fixed C++14 digit separators ([#1593](https://github.com/lite-xl/lite-xl/pull/1593))

* Fix Scrollbar.{expanded,contracted}_size documentation
  ([70245ba0](https://github.com/pragtical/pragtical/commit/70245ba0862761237e6aabbc7f7a1f259402a4ee))

## [3.1.1] - 2023-08-06

### New Features

* Merged Windows dark title bar theme support from
  [lite-xl/lite-xl#514](https://github.com/lite-xl/lite-xl/pull/514)
  with some changes to make it less invasive
  ([7ca48a83](https://github.com/pragtical/pragtical/commit/7ca48a8342496fe153edaada2f0f04002d52fb78))

### Build System

* CI Latest Builds: switched from debug to debugoptimized
  ([cf880c5a](https://github.com/pragtical/pragtical/commit/cf880c5ad6a99523a1ff1ac1259e2b5f0dccbb1a))

* Added widget as a meson subproject
  ([bdddc4c6](https://github.com/pragtical/pragtical/commit/bdddc4c6385bf6a2be9e3684e0bdfc6cb807dd99))

* Added colors and languages as meson subproject
  ([111ca76f](https://github.com/pragtical/pragtical/commit/111ca76f925bafdd88f15f874caf8c84037fcf02))

### Documentation

* Fixed common.relative_path() doc comments
  ([f44f10fa](https://github.com/pragtical/pragtical/commit/f44f10fa3aa08573b0e0d9866c97f84a9559717d))

### UI Enhancements

* Added GUI for treeview show hidden/ignored
  ([64eee3d3](https://github.com/pragtical/pragtical/commit/64eee3d38d766aa28ecc5c60b01bb6cb85cdffb0))

### Fixes

* Do not append cwd to absolute files on startup
  ([853e6b76](https://github.com/pragtical/pragtical/commit/853e6b7600b06c2560c67f94832921762650d8aa))

### Other Changes

* Added compat for lua 5.4 userdata (uv) functions
  ([e048a9c8](https://github.com/pragtical/pragtical/commit/e048a9c839ce8c0646d4ee6e435149c63a176a2b))

* Refactored core.project into a core.object
  ([a5df5be8](https://github.com/pragtical/pragtical/commit/a5df5be84ff31af8125fdf4bd1ce4fab2162e280))
  - Added doc comments
  - Exposed compile_ignore_files() as a method

* Recompile ignore patterns when changed from gui
  ([c3edcafc](https://github.com/pragtical/pragtical/commit/c3edcafc595db7787c98e2260502b5d40a231121))

### Lite XL Inherited Changes

* Normalize stroke before adding keybind ([#1334](https://github.com/lite-xl/lite-xl/pull/1334))
* Make DocView aware of scrollbars sizes ([#1177](https://github.com/lite-xl/lite-xl/pull/1177))

## [3.1.0] - 2023-07-31

### New Features

* Merged project rework with fixes and performance improvements
  ([ce5e8db4](https://github.com/pragtical/pragtical/commit/ce5e8db41712612bc232f4bfe4d0113f36df1dc8))

### Documentation

* Merged documentation for core.dirwatch
  ([#1565](https://github.com/lite-xl/lite-xl/pull/1565))

* Merged documentation for core.contextmenu
  ([#1567](https://github.com/lite-xl/lite-xl/pull/1567))

### Backward Incompatible Changes

* Project handling functions have been completely replaced as explained on
  ([#1455](https://github.com/lite-xl/lite-xl/pull/1455))

### Fixes

* settings: respect disabled plugins on lua modules
  ([c2ffe3e2](https://github.com/pragtical/pragtical/commit/c2ffe3e22201553bde3811cbf2ca2eef0e7a5c6b))

* plugin workspace: delay workspace loading
  ([41e5caa0](https://github.com/pragtical/pragtical/commit/41e5caa0dfd30c7c0b868ebf8c51c1e832459c2c))

* Fix autoreload plugin bugs and performance issues
  ([ec0ae57f](https://github.com/pragtical/pragtical/commit/ec0ae57fab18edf14ef0b50adf286e78cfb72145))

### Other Changes

* Merged feat(src/renderer): unify fontgroup baseline
  ([#1560](https://github.com/lite-xl/lite-xl/pull/1560))

* Merged and customized use Lua wrap by default
  ([#1481](https://github.com/lite-xl/lite-xl/pull/1481))

* Updated all meson wraps to latest versions

* comment typo in data/core/init.lua
  ([#1549](https://github.com/lite-xl/lite-xl/pull/1549))

### Lite XL Inherited Changes

* Fix #1538 log scrolls automatically (the real PR)
  ([#1546](https://github.com/lite-xl/lite-xl/pull/1546))

* Skip checking files if no filename was provided to syntax.get
  ([8a8bd2f9](https://github.com/pragtical/pragtical/commit/8a8bd2f94330f5ca2eaf05b5557b4f20ce6a305a))

* Changed log view settings
  ([#266](https://github.com/lite-xl/lite-xl-plugins/pull/266))

* Allow setting custom glyphset size
  ([#1542](https://github.com/lite-xl/lite-xl/pull/1542))

* style(src/renderer): use FreeType header names
  ([#1554](https://github.com/lite-xl/lite-xl/pull/1554))

* Return state when tokenizing plaintext syntaxes
  ([b6ac4f1e](https://github.com/pragtical/pragtical/commit/b6ac4f1ebe532b5c4ea88c732cb6b43fd4f26659))

* feat(src/renderer): stream fonts with SDL_RWops on all platforms
  ([#1555](https://github.com/lite-xl/lite-xl/pull/1555))

* Updated extension for mac.
  ([#1563](https://github.com/lite-xl/lite-xl/pull/1563))

* Documentation for core.command
  ([#1564](https://github.com/lite-xl/lite-xl/pull/1564))

## [3.0.0] - 2023-06-22

### New Features

* Add more syntax symbols
  ([00a0e9ca](https://github.com/pragtical/pragtical/commit/00a0e9cac9f55e7fe5877ecc271bf2114ee88ddf))
  - Added core functions to lighten or darken colors using pixel blending.

* Support custom symbol types on language plugins
  ([c348be99](https://github.com/pragtical/pragtical/commit/c348be9966c1b1ab1f97af0ee869b118afbfd2cf))

* Added font metadata support
  [lite-xl/lite-xl#1028](https://github.com/lite-xl/lite-xl/pull/1028)

* Added encoding support
  [lite-xl/lite-xl#1161](https://github.com/lite-xl/lite-xl/pull/1161)

* Added shared memory support
  [lite-xl/lite-xl#1486](https://github.com/lite-xl/lite-xl/pull/1486)
  * Added IPC plugin with shared memory backend
    ([87fc7105](https://github.com/pragtical/pragtical/commit/87fc71057ab702cf9c1d64dc1512e1f444ea9624))
    - force draw on core.tab_drag_received
      ([e5709850](https://github.com/pragtical/pragtical/commit/e5709850334e4e568ec60ed683ca1648adf40f97))

* Added widgets as a git submodule
  ([a4681a62](https://github.com/pragtical/pragtical/commit/a4681a62d006852ef1750c245572caf73bba5abb))

* language_lua: doc comments highlighting
  [lite-xl/lite-xl#1019](https://github.com/lite-xl/lite-xl/pull/1019)

* language_js: support for embedded html syntax (like the one used on ReactJS)
  ([#4](https://github.com/pragtical/pragtical/pull/4))

* Added support for background threads (co-routines) that keep running even when
  the window has no focus ([#5](https://github.com/pragtical/pragtical/pull/5))
  - `core.add_background_thread(...)`

* Merged text overwriting
  [lite-xl/lite-xl#1495](https://github.com/lite-xl/lite-xl/pull/1495)

### Performance Improvements

* Added LuaJIT support
  [lite-xl/lite-xl#880](https://github.com/lite-xl/lite-xl/pull/880)
  - Enable LuaJIT by default
    ([8d84ab29](https://github.com/pragtical/pragtical/commit/8d84ab29d5932af2c10f03a1a855d2757820f6bb))

* Added multi-threading support
  [lite-xl/lite-xl#830](https://github.com/lite-xl/lite-xl/pull/830)
  * Added multi-threaded project search
    ([f8591176](https://github.com/pragtical/pragtical/commit/f85911761a2b22f2e8b92cfadf92c8d9eb26f182))
  * Added multi-threaded find files
    ([f8591176](https://github.com/pragtical/pragtical/commit/f85911761a2b22f2e8b92cfadf92c8d9eb26f182))

* Reduce default coroutine timeout
  [lite-xl/lite-xl#1468](https://github.com/lite-xl/lite-xl/pull/1468)

* Use less cpu when only running background coroutines
  ([f230c38f](https://github.com/pragtical/pragtical/commit/f230c38f566c5f1b00d32dcf5541655500966adf))

* Change LuaJIT optimization defaults
  ([8733c5fb](https://github.com/pragtical/pragtical/commit/8733c5fb87ba4571895aebf85e4d5fe71b0a50f0))

* Disable the compat fix_pattern
  ([85f7a077](https://github.com/pragtical/pragtical/commit/85f7a077f95191e07d0b9f829b655bb0bfee7914))

### Documentation

*  Merge documentation for config options
  [lite-xl/lite-xl#1512](https://github.com/lite-xl/lite-xl/pull/1512)

*  Merged documentation for core.common
  [lite-xl/lite-xl#1510](https://github.com/lite-xl/lite-xl/pull/1510)

### Backward Incompatible Changes

* Language plugins file match pattern will no longer support using the `^`
  pattern to match the beginning of a file, `PATHSEP` should be used instead

### UI Enhancements

* Add icons support to autocomplete plugin
  ([0559cd7a](https://github.com/pragtical/pragtical/commit/0559cd7a0459b67a25402b2e59d9487fcdb7fec2))

* Added initial commandview suggestions mouse support
  ([276d92a6](https://github.com/pragtical/pragtical/commit/276d92a6d93b1a8745890835e5b2d163699d5358))

* Added improved scaling support from
  [lite-xl/lite-xl#1347](https://github.com/lite-xl/lite-xl/pull/1347)

* Added settings plugin
  ([d5327a8d](https://github.com/pragtical/pragtical/commit/d5327a8d58de6672343a344287f0649846f173f0))
  * added config for tabs top margin
    ([90150bf6](https://github.com/pragtical/pragtical/commit/90150bf6fdd476413d13e30405a1656317965362))

* Scale the entire UI by default on scale plugin
  ([a5096b47](https://github.com/pragtical/pragtical/commit/a5096b47763a3ec0b540cd0b58b64be9a6122738))

* Added friendlier search/replace user interface
  ([518226eb](https://github.com/pragtical/pragtical/commit/518226eb2ce8b7bdd1d53c9521f290f640d42c8f))

* Add missing config spec settings to treeview
  ([d71175d1](https://github.com/pragtical/pragtical/commit/d71175d1c7f676044ac538eb35fdda47d09d521c))

* Better coroutine handling on no focus
  ([456b8b25](https://github.com/pragtical/pragtical/commit/456b8b25da4f66485c2cdbb0f0a572d4c023e3b5))

### Fixes

* Fix node resizing on mouse drag
  ([c2733928](https://github.com/pragtical/pragtical/commit/c2733928d93208b0ff6f233f50c2ef0e972bc13b))

### Other Changes

* Autocomplete plugin improvements
  ([81b45706](https://github.com/pragtical/pragtical/commit/81b457066befcfd5ee91caa51ddf63affec34681))
  * Support suggestion symbols scoping
    - global: all open documents
    - local: current document
    - related: all open documents with same syntax
    - none: language syntax symbols only
  * Register style.syntax[] entries as icons
  * Other related fixes

* Attach command buffer to Renderer Window
  ([#3](https://github.com/pragtical/pragtical/pull/3))

* Unified non-addons and addons releases
  ([35d01f5f](https://github.com/pragtical/pragtical/commit/35d01f5fc5391bb74141253375762125a7491520))

* Removed lhelper as a build option
  ([56b3a6c0](https://github.com/pragtical/pragtical/commit/56b3a6c0a4d5552cd71683fb588b3e307404a4a7))

* Single pattern for common.utf8_chars
  ([9ccfade6](https://github.com/pragtical/pragtical/commit/9ccfade6498de7037c7a878b1f4b316440856877))

* innosetup: installation path to environment task (allows command line access)
  ([ce995eb2](https://github.com/pragtical/pragtical/commit/ce995eb28211e40fff9fb95e9f8a45b53b6c3ddc))

* LuaJIT compat: allow nil msg on debug.traceback
  ([ca0791a8](https://github.com/pragtical/pragtical/commit/ca0791a8ec3023892759190b5bcb6275435c0cb1))

* Fix LuaJIT build on MacOS crosscompile
  ([7d8340c4](https://github.com/pragtical/pragtical/commit/7d8340c4517a96b1d0cf5a2d9289f20454be1ec9))

* Updated MOD_VERSION_MINOR
  ([4ea0da57](https://github.com/pragtical/pragtical/commit/4ea0da572470e3034074ec8e590c398ab1c6bd82))

* Added workflow to produce setup and portable builds on every commit.

* Rebranding of project name and assets.

### Lite XL Inherited Changes

* Allow command buffer to be expanded ([#1297](https://github.com/lite-xl/lite-xl/pull/1297))
* do not allow users to create an empty font group ([#1303](https://github.com/lite-xl/lite-xl/pull/1303))
* Make api_require's nodes const ([#1296](https://github.com/lite-xl/lite-xl/pull/1296))
* Fix a memory leak ([#1305](https://github.com/lite-xl/lite-xl/pull/1305))
* Don't set a value twice ([#1306](https://github.com/lite-xl/lite-xl/pull/1306))
* Make dirwatch sorting compatible with what file_bisect expects ([#1300](https://github.com/lite-xl/lite-xl/pull/1300))
* Handle readlink errors ([#1292](https://github.com/lite-xl/lite-xl/pull/1292))
* linewrapping: Disable horizontal scrolling when enabled ([#1309](https://github.com/lite-xl/lite-xl/pull/1309))
* plugin api: added missing luaL_typeerror ([#1313](https://github.com/lite-xl/lite-xl/pull/1313))
* defer lua error until after cleanup ([#1310](https://github.com/lite-xl/lite-xl/pull/1310))
* fix: center title and version in emptyview ([#1311](https://github.com/lite-xl/lite-xl/pull/1310))
* Reorganize resources/ + wasm target ([#1244](https://github.com/lite-xl/lite-xl/pull/1244))
* replace uses of SDL_Window with RenWindow ([#1319](https://github.com/lite-xl/lite-xl/pull/1319))
* Create Renderer Only When It Doesn't Exist ([#1315](https://github.com/lite-xl/lite-xl/pull/1315))
* language_md: add nix code block highlighting ([#1323](https://github.com/lite-xl/lite-xl/pull/1323))
* Use table.move to implement common.splice ([#1324](https://github.com/lite-xl/lite-xl/pull/1324))
* Make empty groups in regex.gmatch return their offset ([#1325](https://github.com/lite-xl/lite-xl/pull/1325))
* remove static libgcc from meson ([#1290](https://github.com/lite-xl/lite-xl/pull/1290))
* Avoid drawing hidden text in DocView:draw_line_text ([#1298](https://github.com/lite-xl/lite-xl/pull/1298))
* Added in Config Postload ([#1336](https://github.com/lite-xl/lite-xl/pull/1336))
* plugin api: allow usage on multiple source files ([#1335](https://github.com/lite-xl/lite-xl/pull/1335))
* Add "Open with Lite XL" to windows' context menu ([#1333](https://github.com/lite-xl/lite-xl/pull/1333))
* pass RenWindow by argument ([#1321](https://github.com/lite-xl/lite-xl/pull/1321))
* ci: fix msys build now requiring ca-certificates ([#1348](https://github.com/lite-xl/lite-xl/pull/1348))
* Getting rid of annoying forward slash on windows. ([#1345](https://github.com/lite-xl/lite-xl/pull/1345))
* Abstracted open_doc out to allow for more easy overriding. ([#1344](https://github.com/lite-xl/lite-xl/pull/1344))
* feat: add option to only draw whitespace if it is within selection ([#1321](https://github.com/lite-xl/lite-xl/pull/1321))
* Replace globally when replacing from selection ([#1331](https://github.com/lite-xl/lite-xl/pull/1331))
* Context menu fixes and keyboard navigation ([#1338](https://github.com/lite-xl/lite-xl/pull/1338))
* fix: exec() error not returned to parent ([#1363](https://github.com/lite-xl/lite-xl/pull/1363))
* Make mod-version follow semver ([#1036](https://github.com/lite-xl/lite-xl/pull/1036))
* Improved plugins config table handling ([#1356](https://github.com/lite-xl/lite-xl/pull/1356))
* Restore in-selection replace as discussed in #1331 ([#1368](https://github.com/lite-xl/lite-xl/pull/1368))
* NagView: properly rescale on scale change ([#1379](https://github.com/lite-xl/lite-xl/pull/1379))
* plugins scale: also rescale style.expanded_scrollbar_size ([#1380](https://github.com/lite-xl/lite-xl/pull/1380))
* Improve DocView:get_visible_line_range precision ([#1382](https://github.com/lite-xl/lite-xl/pull/1382))
* Allow groups to be used in end delimiter patterns in tokenizer ([#1317](https://github.com/lite-xl/lite-xl/pull/1317))
* Make mouse scrollwheel hovering tabs scroll the tab bar ([#1314](https://github.com/lite-xl/lite-xl/pull/1314))
* Correct the inverted tabs scrolling ([02a99b17](https://github.com/lite-xl/lite-xl/commit/02a99b17fe9ef11ea18aeb5cb0799c8999a4d2e9))
* Make tab scrolling more flexible ([#1384](https://github.com/lite-xl/lite-xl/pull/1384))
* fix incorrect x_offset if opened docs have different tab sizes ([#1383](https://github.com/lite-xl/lite-xl/pull/1383))
* Added in ability to specify prefix via env variable. ([#1388](https://github.com/lite-xl/lite-xl/pull/1388))
* Use correct view for scrolling to find-replace:repeat-find results ([#1400](https://github.com/lite-xl/lite-xl/pull/1400))
* Add manifest on Windows ([#1405](https://github.com/lite-xl/lite-xl/pull/1405))
* Split Command struct into different structs for each command type ([#1407](https://github.com/lite-xl/lite-xl/pull/1407))
* refactor(main): move SetProcessDPIAware to manifests ([#1413](https://github.com/lite-xl/lite-xl/pull/1413))
* Improve text width calculation precision ([#1408](https://github.com/lite-xl/lite-xl/pull/1408))
* Use clipping functions provided by SDL ([#1426](https://github.com/lite-xl/lite-xl/pull/1426))
* Make TreeView follow the current tab ([#1411](https://github.com/lite-xl/lite-xl/pull/1411))
* Asynchronous process reaping ([#1412](https://github.com/lite-xl/lite-xl/pull/1412))
* Made coroutines make more sense, and fixed a bug. ([#1381](https://github.com/lite-xl/lite-xl/pull/1381))
* Disable trimwhitespace and drawwhitespace via their configs ([#1446](https://github.com/lite-xl/lite-xl/pull/1446))
* Allow tokenizer to pause and resume in the middle of a line ([#1444](https://github.com/lite-xl/lite-xl/pull/1444))
* Added in explicit touchscreen keyboard support. ([#1389](https://github.com/lite-xl/lite-xl/pull/1389))
* fix cursors positions when deleting multiple selections ([#1393](https://github.com/lite-xl/lite-xl/pull/1393))
* add autocompletion to multicursor ([#1394](https://github.com/lite-xl/lite-xl/pull/1394))
* Added in support for foreground and background events. ([#1395](https://github.com/lite-xl/lite-xl/pull/1395))
* Fix invalid EXEFILE and EXEDIR on Windows ([#1396](https://github.com/lite-xl/lite-xl/pull/1396))
* fix(windows-utf8-patch): fix os.getenv() not supporting UTF-8 output ([#1397](https://github.com/lite-xl/lite-xl/pull/1397))
* Add View dragging ([#1402](https://github.com/lite-xl/lite-xl/pull/1402))
* fix: fix differing stacktrace on stdout and file ([#1404](https://github.com/lite-xl/lite-xl/pull/1404))
* fix(CI): bump dependency versions ([#1434](https://github.com/lite-xl/lite-xl/pull/1434))
* Optimizing MSYS2 CI ([#1435](https://github.com/lite-xl/lite-xl/pull/1435))
* Update api_require to expose more symbols ([#1437](https://github.com/lite-xl/lite-xl/pull/1437))
* Make system.path_compare more case-aware ([#1457](https://github.com/lite-xl/lite-xl/pull/1457))
* feat: add statusview item to show selections ([#1445](https://github.com/lite-xl/lite-xl/pull/1445))
* Fix for api_require wrong macro && conditions ([#1465](https://github.com/lite-xl/lite-xl/pull/1465))
* upgrade header files to Lua 5.4 ([#1436](https://github.com/lite-xl/lite-xl/pull/1436))
* Cross compiling improvements + macOS universal binary ([#1458](https://github.com/lite-xl/lite-xl/pull/1458))
* Show error message in crash message box ([#1461](https://github.com/lite-xl/lite-xl/pull/1461))
* refactor(plugin_api): move the header into include/ ([#1440](https://github.com/lite-xl/lite-xl/pull/1440))
* Merge carets after doc:move-to-{previous,next}-char ([#1462](https://github.com/lite-xl/lite-xl/pull/1462))
* StatusView compat fix with older Lua runtimes ([8cb84254](https://github.com/lite-xl/lite-xl/commit/8cb842549c955290d950642ae7c1f66f4bd2bd2d))
* Make system.path_compare more digit-aware ([#1474](https://github.com/lite-xl/lite-xl/pull/1474))
* fix(process): check for HANDLE_INVALID ([#1475](https://github.com/lite-xl/lite-xl/pull/1475))
* Added in double-clicking on emptyview and tab bar. ([#1478](https://github.com/lite-xl/lite-xl/pull/1478))
* Restore horizontal scroll position after scale change ([#494](https://github.com/lite-xl/lite-xl/pull/494))
* Allowed for overrides of toolbar items ([#1157](https://github.com/lite-xl/lite-xl/pull/1157))
* detectindent: fix wrong detection reported by Adam ([#1500](https://github.com/lite-xl/lite-xl/pull/1500))
* Move lineguide below blinking cursor, fixes #1488 ([#1511](https://github.com/lite-xl/lite-xl/pull/1511))
* Close lua state when exiting on a runtime error ([#1487](https://github.com/lite-xl/lite-xl/pull/1487))
* Add mouse grab ([#1501](https://github.com/lite-xl/lite-xl/pull/1501))
* Add top tab margins ([#1479](https://github.com/lite-xl/lite-xl/pull/1479))
* Increase number of loadable glyphsets ([#1524](https://github.com/lite-xl/lite-xl/pull/1524))

## [2.1.1] - 2022-12-29

### New Features

* Add config.keep_newline_whitespace option
  ([#1184](https://github.com/lite-xl/lite-xl/pull/1184))

* Add regex.find_offsets, regex.find, improve regex.match
  ([#1232](https://github.com/lite-xl/lite-xl/pull/1232))

* Added regex.gmatch ([#1233](https://github.com/lite-xl/lite-xl/pull/1233))

* add touch events ([#1245](https://github.com/lite-xl/lite-xl/pull/1245))

### Performance Improvements

* highlighter: autostop co-routine when not needed
  ([#881](https://github.com/lite-xl/lite-xl/pull/881))

* core: ported regex.gsub to faster native version
  ([#1233](https://github.com/lite-xl/lite-xl/pull/1233))

### Backward Incompatible Changes

* For correctness, the behaviour of `regex.match` was changed to more closely
  behave like `string.match`.

* `regex.find_offsets` now provides the previous functionality of `regex.match`
  with a more appropriate function name.

* `regex.gsub` doesn't provides the indexes of matches and replacements anymore,
  now it behaves more similar to `string.gsub` (the only known affected plugin
  was `regexreplacepreview` which has already been adapted)

### UI Enhancements

* statusview: respect right padding of item tooltip
  ([0373d29f](https://github.com/lite-xl/lite-xl/commit/0373d29f99f286b2fbdda5a6837ef3797c988b88))

* feat: encode home in statusview file path
  ([#1224](https://github.com/lite-xl/lite-xl/pull/1224))

* autocomplete: wrap the autocomplete results around
  ([#1223](https://github.com/lite-xl/lite-xl/pull/1223))

* feat: alert user via nagview if file cannot be saved
  ([#1230](https://github.com/lite-xl/lite-xl/pull/1230))

* contextmenu: make divider less aggressive
  ([#1228](https://github.com/lite-xl/lite-xl/pull/1228))

* Improve IME location updates
  ([#1170](https://github.com/lite-xl/lite-xl/pull/1170))

* fix: move tab scroll buttons to remove spacing before 1st tab
  ([#1231](https://github.com/lite-xl/lite-xl/pull/1231))

* Allow TreeView file operation commands when focused
  ([#1256](https://github.com/lite-xl/lite-xl/pull/1256))

* contextmenu: adjust y positioning if less than zero
  ([#1268](https://github.com/lite-xl/lite-xl/pull/1268))

### Fixes

* Don't sort in Doc:get_selection_idx with an invalid index
  ([b029f599](https://github.com/lite-xl/lite-xl/commit/b029f5993edb7dee5ccd2ba55faac1ec22e24609))

* tokenizer: remove the limit of 3 subsyntaxes depth
  ([#1186](https://github.com/lite-xl/lite-xl/pull/1186))

* dirmonitor: give kevent a timeout so it doesn't lock forever
  ([#1180](https://github.com/lite-xl/lite-xl/pull/1180))

* dirmonitor: fix win32 implementation name length to prevent ub
  ([5ab8dc0](https://github.com/lite-xl/lite-xl/commit/5ab8dc027502146dd947b3d2c7544ba096a3881b))

* Make linewrapping plugin recompute breaks before scrolling
  ([#1190](https://github.com/lite-xl/lite-xl/pull/1190))

* Add missing get_exe_filename() implementation for FreeBSD
  ([#1198](https://github.com/lite-xl/lite-xl/pull/1198))

* (Windows) Load fonts with UTF-8 filenames
  ([#1201](https://github.com/lite-xl/lite-xl/pull/1201))

* Use subsyntax info to toggle comments
  ([#1202](https://github.com/lite-xl/lite-xl/pull/1202))

* Pass the currently selected item to CommandView validation
  ([#1203](https://github.com/lite-xl/lite-xl/pull/1203))

* Windows font loading hotfix
  ([#1205](https://github.com/lite-xl/lite-xl/pull/1205))

* better error messages for checkcolor
  ([#1211](https://github.com/lite-xl/lite-xl/pull/1211))

* Fix native plugins not reloading upon core:restart
  ([#1219](https://github.com/lite-xl/lite-xl/pull/1219))

* Converted from bytes to characters, as this is what windows is expecting
  ([5ab8dc02](https://github.com/lite-xl/lite-xl/commit/5ab8dc027502146dd947b3d2c7544ba096a3881b))

* Fix some syntax errors ([#1243](https://github.com/lite-xl/lite-xl/pull/1243))

* toolbarview: Remove tooltip when hidden
  ([#1251](https://github.com/lite-xl/lite-xl/pull/1251))

* detectindent: Limit subsyntax depth
  ([#1253](https://github.com/lite-xl/lite-xl/pull/1253))

* Use Lua string length instead of relying on strlen (#1262)
  ([#1262](https://github.com/lite-xl/lite-xl/pull/1262))

* dirmonitor: fix high cpu usage
  ([#1271](https://github.com/lite-xl/lite-xl/pull/1271)),
  ([#1274](https://github.com/lite-xl/lite-xl/pull/1274))

* Fix popping subsyntaxes that end consecutively
  ([#1246](https://github.com/lite-xl/lite-xl/pull/1246))

* Fix userdata APIs for Lua 5.4 in native plugin interface
  ([#1188](https://github.com/lite-xl/lite-xl/pull/1188))

* Fix horizontal scroll with touchpad on MacOS
  ([74349f8e](https://github.com/lite-xl/lite-xl/commit/74349f8e566ec31acd9a831a060b677d706ae4e8))

### Other Changes

* (Windows) MSVC Support ([#1199](https://github.com/lite-xl/lite-xl/pull/1199))

* meson: updated all subproject wraps
  ([#1214](https://github.com/lite-xl/lite-xl/pull/1214))

* set arch tuple in meson ([#1254](https://github.com/lite-xl/lite-xl/pull/1254))

* update documentation for system
  ([#1210](https://github.com/lite-xl/lite-xl/pull/1210))

* docs api: added dirmonitor
  ([7bb86e16](https://github.com/lite-xl/lite-xl/commit/7bb86e16f291256a99d2e87beb77de890cfaf0fe))

* trimwhitespace: expose functionality and extra features
  ([#1238](https://github.com/lite-xl/lite-xl/pull/1238))

* plugins projectsearch: expose its functionality
  ([#1235](https://github.com/lite-xl/lite-xl/pull/1235))

* Simplify SDL message boxes
  ([#1249](https://github.com/lite-xl/lite-xl/pull/1249))

* Add example settings to _overwrite_ an existing key binding
  ([#1270](https://github.com/lite-xl/lite-xl/pull/1270))

* Fix two typos in data/init.lua
  ([#1272](https://github.com/lite-xl/lite-xl/pull/1272))

* Updated meson wraps to latest (SDL v2.26, PCRE2 v10.42)

## [2.1.0] - 2022-11-01

### New Features
* Make distinction between
  [line and block comments](https://github.com/lite-xl/lite-xl/pull/771),
  and added all appropriate functionality to the commenting/uncommenting lines.

* [Added in line paste mode](https://github.com/lite-xl/lite-xl/pull/713),
  if you copy without a selection.

* Many [improvements to treeview](https://github.com/lite-xl/lite-xl/pull/732),
  including keyboard navigation of treeview, and ability to specify single vs.
  double-click behavior.

* Added in [soft line wrapping](https://github.com/lite-xl/lite-xl/pull/636)
  as core plugin, under `linewrapping.lua`, use `F10` to activate.

* Revamped [StatusView](https://github.com/lite-xl/lite-xl/pull/852) API with
  new features that include:

  * Support for predicates, click actions, tooltips on item hover
    and custom drawing of added items.
  * Hide items that are too huge by rendering with clip_rect.
  * Ability to drag or scroll the left or right if too many items to display.
  * New status bar commands accessible from the command palette that
    include: toggling status bar visibility, toggling specific item visibility,
    enable/disable status messages, etc...

* Added `renderer.font.group` interface to set up
  [font fallback groups](https://github.com/lite-xl/lite-xl/pull/616) in
  the font renderer, if a token doesn't have a corresponding glyph.

  **Example:**
  ```lua
  local emoji_font = renderer.font.load(USERDIR .. "/fonts/NotoEmoji-Regular.ttf", 15 * SCALE)
  local nonicons = renderer.font.load(USERDIR .. "/fonts/nonicons.ttf", 15 * SCALE)
  style.code_font = renderer.font.group({style.code_font, nonicons, emoji_font})
  ```

* Added in the ability to specify
  [mouse clicks](https://github.com/lite-xl/lite-xl/pull/589) in the
  keymap, allowing for easy binds of `ctrl+lclick`, and the like.

  **Example:**
  ```lua
  keymap.add { ["ctrl+shift+3lclick"] = "core:open-log" }
  ```

* Improved ability for plugins to be loaded at a given time, by making the
  convention of defining a config for the plugin using `common.merge` to merge
  existing hashes together, rather than overwriting.

* Releases will now include all language plugins and the
  [settings gui](https://github.com/lite-xl/lite-xl-plugins/pull/65) plugin.

* New [core.warn](https://github.com/lite-xl/lite-xl/pull/1005) was introduced.

* Added [suggestions warping](https://github.com/lite-xl/lite-xl/pull/1003)
  for `CommandView`.

* Allow regexes in tokenizer to
  [split tokens with group](https://github.com/lite-xl/lite-xl/pull/999).

* Added [settings gui support](https://github.com/lite-xl/lite-xl/pull/995)
  to core plugins.

* Support for [stricter predicates](https://github.com/lite-xl/lite-xl/pull/990)
  by appending a `!`, eg: `"core.docview!"`.

* [UTF8 support in tokenizer](https://github.com/lite-xl/lite-xl/pull/945)
  and new utf8 counter parts of string functions,
  eg: `string.ulen`, `string.ulower`, etc...

* Added [utf8 support](https://github.com/lite-xl/lite-xl/pull/986) on doc
  lower and upper commands.

* Allow syntax patterns to match with the
  [beginning of the line](https://github.com/lite-xl/lite-xl/pull/860).

  **Example:**
  ```lua
  { pattern = "^my_pattern_starting_at_beginning", type="symbol" }
  ```

* [Add View:on_file_dropped](https://github.com/lite-xl/lite-xl/pull/845).

* Implemented new function to retrieve current process id of lite-xl
  [system.get_process_id()](https://github.com/lite-xl/lite-xl/pull/833).

* [Allow functions in keymap](https://github.com/lite-xl/lite-xl/pull/948).

* [Add type ahead to CommandView](https://github.com/lite-xl/lite-xl/pull/963).

* Add syntax symbols to
  [auto-complete](https://github.com/lite-xl/lite-xl/pull/913).

* Add [animation categories](https://github.com/lite-xl/lite-xl/pull/941)
  to enable finer transitions control.

* Added in a [native plugin](https://github.com/lite-xl/lite-xl/pull/527)
  interface that allows for C-level interfacing with a statically-linked
  lite-xl. The implementation of this may change in future.

* Config: added new development option to prevent plugin version checking at
  startup named [skip_plugins_version](https://github.com/lite-xl/lite-xl/pull/879)

* Added a smoothing and strikethrough option to font loading
  ([#1087](https://github.com/lite-xl/lite-xl/pull/1087))

* Allow command predicates to manage parameters, allow overwriting commands
  ([#1098](https://github.com/lite-xl/lite-xl/pull/1098))

* Added in simple directory search to treeview.
  ([#1110](https://github.com/lite-xl/lite-xl/pull/1110))

* Added in native modules suffixes.
  ([#1111](https://github.com/lite-xl/lite-xl/pull/1111))

* plugin scale: added option to set default scale
  ([#1115](https://github.com/lite-xl/lite-xl/pull/1115))

* Added in ability to have init.so as a require for cpath.
  ([#1126](https://github.com/lite-xl/lite-xl/pull/1126))

* Added system.raise_window() ([#1131](https://github.com/lite-xl/lite-xl/pull/1131))

* Initial horizontal scrollbar support ([#1124](https://github.com/lite-xl/lite-xl/pull/1124))

* IME support ([#991](https://github.com/lite-xl/lite-xl/pull/991))

### Performance Improvements

* [Load space metrics only when creating font](https://github.com/lite-xl/lite-xl/pull/1032)

* [Performance improvement](https://github.com/lite-xl/lite-xl/pull/883)
  of detect indent plugin.

* Improve performance of
  [ren_draw_rect](https://github.com/lite-xl/lite-xl/pull/935).

* Improved [tokenizer performance](https://github.com/lite-xl/lite-xl/pull/896).

* drawwhitespace: [Cache whitespace location](https://github.com/lite-xl/lite-xl/pull/1030)

* CommandView: improve performance by
  [only drawing visible](https://github.com/lite-xl/lite-xl/pull/1047)

### Backward Incompatible Changes
* [Upgraded Lua to 5.4](https://github.com/lite-xl/lite-xl/pull/781), which
  should improve performance, and provide useful extra functionality. It should
  also be more available out of the box with most modern
  linux/unix-based package managers.

* Bumped plugin mod-version number as various interfaces like: `DocView`,
  `StatusView` and `CommandView` have changed which should require a revision
  from plugin developers to make sure their plugins work with this new release.

* Changed interface for key handling; now, all components should return true if
  they've handled the event.

* For plugin developers, declaring config options by directly assigning
  to the plugin table (eg: `config.plugins.plugin_name.myvalue = 10`) was
  deprecated in favor of using `common.merge`.

  **Example:**
  ```lua
  config.plugins.autowrap = common.merge({
    enabled = false,
    files = { "%.md$", "%.txt$" }
  }, config.plugins.autowrap)
  ```

* `DocView:draw_text_line` and related functions been used by plugin developers
  require a revision, since some of this interfaces were updated to support
  line wrapping.

* Removed `cp_replace`, and replaced this with a core plugin,
  [drawwhitespace.lua](https://github.com/lite-xl/lite-xl/pull/908).

### Deprecated Features
* For plugins the usage of the `--lite-xl` version tag was dropped
  in favor of `--mod-version`.

* Overriding `StatusView:get_items()` has been deprecated in favor of
  the new dedicated interface to insert status bar items:

  **New Interface:**
  ```lua
  ------@return StatusView.Item
  function StatusView:add_item(
    { predicate, name, alignment, get_item, command, position, tooltip, separator }
  ) end
  ```

  **Example:**
  ```lua
  core.status_view:add_item({
    predicate = nil,
    name = "status:memory-usage",
    alignment = StatusView.Item.RIGHT,
    get_item = function()
      return {
        style.text,
        string.format(
          "%.2f MB",
          (math.floor(collectgarbage("count") / 10.24) / 100)
        )
      }
    end,
    command = nil,
    position = 1,
    tooltip = "lua memory usage",
    separator = core.status_view.separator2
  })
  ```

* [CommandView:enter](https://github.com/lite-xl/lite-xl/pull/1004) now accepts
  a single options table as a parameter, meaning that the old way of calling
  this function will now show a deprecation message. Also `CommandView:set_text`
  and `CommandView:set_hidden_suggestions` has been
  [deprecated](https://github.com/lite-xl/lite-xl/pull/1014).

  **Example:**
  ```lua
  core.command_view:enter("Title", {
    submit = function() end,
    suggest = function() return end,
    cancel = function() end,
    validate = function() return true end,
    text = "",
    select_text = false,
    show_suggestions = true,
    typeahead = true,
    wrap = true
  })
  ```

### Other Changes
* Removed `dmon`, and implemented independent backends for dirmonitoring. Also
  more cleanly split out dirmonitoring into its own class in lua, from core.init.
  We should now support FreeBSD; and any other system that uses `kqueue` as
  their dir monitoring library. We also have a dummy-backend, which reverts
  transparently to scanning if there is some issue with applying OS-level
  watches (such as system limits).

* Removed `libagg` and the font renderer; compacted all font rendering into a
  single renderer.c file which uses `libfreetype` directly. Now allows for ad-hoc
  bolding, italics, and underlining of fonts.

* Removed `reproc` and replaced this with a simple POSIX/Windows implementation
  in `process.c`. This allows for greater tweakability (i.e. we can now `break`
  for debugging purposes), performance (startup time of subprocesses is
  noticeably shorter), and simplicity (we no longer have to link reproc, or
  winsock, on windows).

* [Split out `Node` and `EmptyView`](https://github.com/lite-xl/lite-xl/pull/715)
  into their own lua files, for plugin extensibility reasons.

* Improved fuzzy_matching to probably give you something closer to what you're
  looking for.

* Improved handling of alternate keyboard layouts.

* Added in a default keymap for `core:restart`, `ctrl+shift+r`.

* Improvements to the [C and C++](https://github.com/lite-xl/lite-xl/pull/875)
  syntax files.

* Improvements to [markdown](https://github.com/lite-xl/lite-xl/pull/862)
  syntax file.

* [Improvements to borderless](https://github.com/lite-xl/lite-xl/pull/994)
  mode on Windows.

* Fixed a bunch of problems relating to
  [multi-cursor](https://github.com/lite-xl/lite-xl/pull/886).

* NagView: [support vscroll](https://github.com/lite-xl/lite-xl/pull/876) when
  message is too long.

* Meson improvements which include:
  * Added in meson wraps for freetype, pcre2, and SDL2 which target public,
    rather than lite-xl maintained repos.
  * [Seperate dirmonitor logic](https://github.com/lite-xl/lite-xl/pull/866),
    add build time detection of features.
  * Add [fallbacks](https://github.com/lite-xl/lite-xl/pull/798) to all
    common dependencies.
  * [Update SDL to 2.0.20](https://github.com/lite-xl/lite-xl/pull/884).
  * install [docs/api](https://github.com/lite-xl/lite-xl/pull/979) to datadir
    for lsp support.

* Always check if the beginning of the
  [text needs to be clipped](https://github.com/lite-xl/lite-xl/pull/871).

* Added [git commit](https://github.com/lite-xl/lite-xl/pull/859)
  on development builds.

* Update [autocomplete](https://github.com/lite-xl/lite-xl/pull/832)
  with changes needed for latest LSP plugin.

* Use SDL to manage color format mapping in
  [ren_draw_rect](https://github.com/lite-xl/lite-xl/pull/829).

* Various code [clean ups](https://github.com/lite-xl/lite-xl/pull/826).

* [Autoreload Nagview](https://github.com/lite-xl/lite-xl/pull/942).

* [Enhancements to scrollbar](https://github.com/lite-xl/lite-xl/pull/916).

* Set the correct working directory for the
  [AppImage version](https://github.com/lite-xl/lite-xl/pull/937).

* Core: fixes and changes to
  [temp file](https://github.com/lite-xl/lite-xl/pull/906) functions.

* [Added plugin load-time log](https://github.com/lite-xl/lite-xl/pull/966).

* TreeView improvements for
  [multi-project](https://github.com/lite-xl/lite-xl/pull/1010).

* Open LogView on user/project
  [module reload error](https://github.com/lite-xl/lite-xl/pull/1022).

* Check if ["open" pattern is escaped](https://github.com/lite-xl/lite-xl/pull/1034)

* Support [UTF-8 on Windows](https://github.com/lite-xl/lite-xl/pull/1041) (Lua)

* Make system.* functions support
  [UTF8 filenames on windows](https://github.com/lite-xl/lite-xl/pull/1042)

* [Fix memory leak](https://github.com/lite-xl/lite-xl/pull/1039) and wrong
  check in font_retrieve

* CommandView: do not change caret size with config.line_height
  ([#1080](https://github.com/lite-xl/lite-xl/pull/1080))

* Fixed process layer argument quoting; allows for strings with spaces
  ([#1132](https://github.com/lite-xl/lite-xl/pull/1132))

* Draw lite-xl icon in TitleView ([#1143](https://github.com/lite-xl/lite-xl/pull/1143))

* Add parameter validation to checkcolor and f_font_group
  ([#1145](https://github.com/lite-xl/lite-xl/pull/1145))

* Many, many, many more changes that are too numerous to list.

## [2.0.5] - 2022-01-29

Revamp the project's user module so that modifications are immediately applied.

Add a mechanism to ignore files or directory based on their project's path.
The new mechanism is backward compatible.*

Essentially there are two mechanisms:

- if a '/' or a '/$' appear at the end of the pattern it will match only
  directories
- if a '/' appears anywhere in the pattern except at the end the pattern will
  be applied to the path

In the first case, when the pattern corresponds to a directory, a '/' will be
appended to the name of each directory before checking the pattern.

In the second case, when the pattern corresponds to a path, the complete path of
the file or directory will be used with an initial '/' added to the path.

Fix several problems with the directory monitoring library.
Now the application should no longer assert when some related system call fails
and we fallback to rescan when an error happens.
On linux no longer use the recursive monitoring which was a source of problem.

Directory monitoring is now aware of symlinks and treat them appropriately.

Fix problem when encountering special files type on linux.

Improve directory monitoring so that the related thread actually waits without
using any CPU time when there are no events.

Improve the suggestion when changing project folder or opening a new one.
Now the previously used directory are suggested but if the path is changed the
actual existing directories that match the pattern are suggested.
In addition always use the text entered in the command view even if a suggested
entry is highlighted.

The NagView warning window now no longer moves the document content.

## [2.0.4] - 2021-12-20

Fix some bugs related to newly introduced directory monitoring using the
dmon library.

Fix a problem with plain text search using Lua patterns by error.

Fix a problem with visualization of UTF-8 characters that caused garbage
characters visualization.

Other fixes and improvements contributed by @Guldoman.

## [2.0.3] - 2021-10-23

Replace periodic rescan of project folder with a notification based system
using the [dmon library](https://github.com/septag/dmon). Improves performance
especially for large project folders since the application no longer needs to
rescan. The application also reports immediately any change in the project
directory even when the application is unfocused.

Improved find-replace reverse and forward search.

Fixed a bug in incremental syntax highlighting affecting documents with
multiple-lines comments or strings.

The application now always shows the tabs in the documents' view even when
a single document is opened. Can be changed with the option
`config.always_show_tabs`.

Fix problem with numeric keypad function keys not properly working.

Fix problem with pixel not correctly drawn at the window's right edge.

Treat correctly and open network paths on Windows.

Add some improvements for very slow network file systems.

Fix problem with python syntax highlighting, contributed by @dflock.

## [2.0.2] - 2021-09-10

Fix problem project directory when starting the application from Launcher on
macOS.

Improved LogView. Entries can now be expanded and there is a context menu to
copy the item's content.

Change the behavior of `ctrl+d` to add a multi-cursor selection to the next
occurrence. The old behavior to move the selection to the next occurrence is
now done using the shortcut `ctrl+f3`.

Added a command to create a multi-cursor with all the occurrences of the
current selection. Activated with the shortcut `ctrl+shift+l`.

Fix problem when trying to close an unsaved new document.

No longer shows an error for the `-psn` argument passed to the application on
macOS.

Fix `treeview:open-in-system` command on Windows.

Fix rename command to update name of document if opened.

Improve the find and replace dialog so that previously used expressions can be
recalled using "up" and "down" keys.

Build package script rewrite with many improvements.

Use bigger fonts by default.

Other minor improvements and fixes.

With many thanks to the contributors: @adamharrison, @takase1121, @Guldoman,
@redtide, @Timofffee, @boppyt, @Jan200101.

## [2.0.1] - 2021-08-28

Fix a few bugs and we mandate the mod-version 2 for plugins.
This means that users should ensure they have up-to-date plugins for Lite XL 2.0.

Here some details about the bug fixes:

- fix a bug that created a fatal error when using the command to change project
  folder or when closing all the active documents
- add a limit to avoid scaling fonts too much and fix a related invalid memory
  access for very small fonts
- fix focus problem with NagView when switching project directory
- fix error that prevented the verification of plugins versions
- fix error on X11 that caused a bug window event on exit

## [2.0] - 2021-08-16

The 2.0 version of lite contains *breaking changes* to lite, in terms of how
plugin settings are structured; any custom plugins may need to be adjusted
accordingly (see note below about plugin namespacing).

Contains the following new features:

Full PCRE (regex) support for find and replace, as well as in language syntax
definitions. Can be accessed programatically via the lua `regex` module.

A full, finalized subprocess API, using libreproc. Subprocess can be started
and interacted with using `Process.new`.

Support for multi-cursor editing. Cursors can be created by either ctrl+clicking
on the screen, or by using the keyboard shortcuts ctrl+shift+up/down to create
an additional cursor on the previous/next line.

All build systems other than meson removed.

A more organized directory structure has been implemented; in particular a docs
folder which contains C api documentation, and a resource folder which houses
all build resources.

Plugin config namespacing has been implemented. This means that instead of
using `config.myplugin.a`, to read settings, and `config.myplugin = false` to
disable plugins, this has been changed to `config.plugins.myplugin.a`, and
`config.plugins.myplugin = false` respectively. This may require changes to
your user plugin, or to any custom plugins you have.

A context menu on right click has been added.

Changes to how we deal with indentation have been implemented; in particular,
hitting home no longer brings you to the start of a line, it'll bring you to
the start of indentation, which is more in line with other editors.

Lineguide, and scale plugins moved into the core, and removed from
`lite-plugins`. This may also require you to adjust your personal plugin
folder to remove these if they're present.

In addition, there have been many other small fixes and improvements, too
numerous to list here.

## [1.16.11] - 2021-05-28

When opening directories with too many files lite-xl now keep displaying files
and directories in the treeview. The application remains functional and the
directories can be explored without using too much memory. In this operating
mode the files of the project are not indexed so the command "Core: Find File"
will act as the "Core: Open File" command.The "Project Search: Find" will work
by searching all the files present in the project directory even if they are
not indexed.

Implemented changing fonts per syntax group by @liquidev.

Example user module snippet that makes all comments italic:

```lua
local style = require "core.style"

-- italic.ttf must be provided by the user
local italic = renderer.font.load("italic.ttf", 14)
style.syntax_fonts["comment"] = italic
```

Improved indentation behavior by @adamharrison.

Fix bug with close button not working in borderless window mode.

Fix problem with normalization of filename for opened documents.

## [1.16.10] - 2021-05-22

Improved syntax highlight system thanks to @liquidev and @adamharrison.
Thanks to the new system we provide more a accurate syntax highlighting for
Lua, C and C++. Other syntax improvements contributed by @vincens2005.

Move to JetBrains Mono and Fira Sans fonts for code and UI respectively.
They are provided under the SIL Open Font License, Version 1.1.
See `doc/licenses.md` for license details.

Fixed bug with fonts and rencache module. Under very specific situations the
application was crashing due to invalid memory access.

Add documentation for keymap binding, thanks to @Janis-Leuenberger.

Added a contributors page in `doc/contributors.md`.

## [1.16.9] - 2021-05-06

Fix a bug related to nested panes resizing.

Fix problem preventing creating a new file.

## [1.16.8] - 2021-05-06

Fix application crash when using the command `core:restart`.

Improve application startup to reduce "flashing".

Move to new plugins versioning using tag `mod-version:1`.
The mod-version is a single digit version that tracks the
plugins compatibility version independently from the lite-xl
version.

For backward compatibility the tag `-- lite-xl 1.16` is considered equivalent to
`mod-version:1` so users don't need to update their plugins.

Both kind of tags can appear in new plugins in the form:

```lua
-- mod-version:1 -- lite-xl 1.16
```

where the old tag needs to appear at the end for compatibility.

## [1.16.7] - 2021-05-01

Add support for retina displays on Mac OS X.

Fix a few problems related to file paths.

## [1.16.6] - 2021-04-21

Implement a system to check the compatibility of plugins by checking a release
tag. Plugins that don't have the release tag will not be loaded.

Improve and extend the NagView with keyboard commands.
Special thanks to @takase1121 for the implementation and @liquidev for proposing
and discussing the enhancements.

Add support to build on Mac OS X and create an application bundle.
Special thanks to @mathewmariani for his lite-macos fork, the Mac OS specific
resources and his support.

Add hook function `DocView.on_text_change` so that plugin can accurately react
on document changes. Thanks to @vincens2005 for the suggestion and testing the
implementation.

Enable borderless window mode using the `config.borderless` variable.
If enable the system window's bar will be replaced by a title bar provided
by lite-xl itself.

Fix a drawing engine bug that caused increased CPU usage for drawing operations.

Add `system.set_window_opacity` function.

Add codepoint replacement API to support natively the "draw whitespaces" option.
It supersedes the `drawwhitespace` plugin. If can be configured using the
`config.draw_whitespace` boolean variable and enabled and disables using the
commands `draw-whitespace:toggle`, `draw-whitespace:enable`,
`draw-whitespace:disable`.

Improve the NagView to accept keyboard commands and introduce dialog commands.

Add hook function `Doc:on_text_change` called on document changes, to be
used by plugins.

## [1.16.5] - 2021-03-20

Hotfix for Github's issue https://github.com/franko/lite-xl/issues/122

## [1.16.4] - 2021-03-20

Add tooltips to show full file names from the tree-view.

Introduce NagView to show warning dialog about unsaved files.

Detect High-DPI displays on Linux using Xft.dpi entry from xrdb's output.

Made animations independent of framerate, and added a config setting
`config.animation_rate` for customizing the speed of animations.

Made borders between tabs look cleaner.

Fix problem with files using hard tabs.

## [1.16.2] - 2021-03-05

Implement close button for tabs.

Make the command view list of suggestion scrollable to see all the items.

Improve update/resize behavior of treeview and toolbar.

## [1.16.1] - 2021-02-25

Improve behavior of commands to move, delete and duplicate multiple lines:
no longer include the last line if it does not contain any selection.

Fix graphical artifacts when rendering some fonts like FiraSans.

Introduce the `config.transitions` boolean variable.
When false the transitions will be disabled and changes will be done immediately.
Very useful for remote sessions where visual transitions doesn't work well.

Fix many small problems related to the new toolbar and the tooptips.
Fix problem with spacing in treeview when using monospace fonts.

## [1.16] - 2021-02-19

Implement a toolbar shown in the bottom part of the tree-view.
The toolbar is especially meant for new users to give an easy, visual, access
to the more important commands.

Make the treeview actually resizable and shows the resize cursor only when panes
are actually resizable.

Add config mechanism to disable a plugin by setting
`config.<plugin-name> = false`.

Improve the "detect indent" plugin to take into account the syntax and exclude
comments for much accurate results.

Add command `root:close-all` to close all the documents currently opened.

Show the full path filename of the active document in the window's title.

Fix problem with user's module reload not always enabled.

## [1.15] - 2021-01-04

**Project directories**

Extend your project by adding more directories using the command
`core:add-directory`. To remove them use the corresponding command
`core:remove-directory`.

**Workspaces**

The workspace plugin from rxi/lite-plugins is now part of Lite XL.
In addition to the functionalities of the original plugin the extended version
will also remember the window size and position and the additional project
directories.

To not interfere with the project's files the workspace file is saved in the
personal Lite's configuration folder. On unix-like systems it will be in:
`$HOME/.config/lite-xl/ws`.

**Scrolling the Tree View**

It is now possible to scroll the tree view when there are too many visible items.

**Recognize `~` for the home directory**

As in the unix shell `~` is now used to identify the home directory.

**Files and Directories**

Add command to create a new empty directory within the project using the
command `files:create-directory`.

In addition a control-click on a project directory will prompt the user to
create a new directory inside the directory pointed.

**New welcome screen**

Show 'Lite XL' instead of 'lite' and the version number.

**Various fixes and improvements**

A few quirks previously with some of the new features have been fixed for a
better user experience.

## [1.14] - 2020-12-13

**Project Management**

Add a new command, Core: Change Project Folder, to change project directory by
staying on the same window. All the current opened documents will be closed.
The new command is associated with the keyboard combination ctrl+shit+c.

A similar command is also added, Core: Open Project Folder, with key binding
ctrl+shift+o. It will open the chosen folder in a new window.

In addition Lite XL will now remember the recently used projects across
different sessions. When invoked without arguments it will now open the project
more recently used. If a directory is specified it will behave like before and
open the directory indicated as an argument.

**Restart command**

A Core: Restart command is added to restart the editor without leaving the
current window. Very convenient when modifying the Lua code for the editor
itself.

**User's setting auto-reload**

When saving the user configuration, the user's module, the changes will be
automatically applied to the current instance.

**Bundle community provided colors schemes**

Included now in the release files the colors schemes from
github.com/rxi/lite-colors.

**Usability improvements**

Improve left and right scrolling of text to behave like other editors and
improves text selection with mouse.

**Fixes**

Correct font's rendering for full hinting mode when using subpixel antialiasing.

## [1.13] - 2020-12-06

**Rendering options for fonts**

When loading fonts with the function renderer.font.load some rendering options
can be optionally specified:

- antialiasing: grayscale or subpixel
- hinting: none, slight or full

See data/core/style.lua for the details about its utilisation.

The default remains antialiasing subpixel and hinting slight to reproduce the
behavior of previous versions.
The option grayscale with full hinting is specially interesting for crisp font
rendering without color artifacts.

**Unix-like install directories**

Use unix-like install directories for the executable and for the data directory.
The executable will be placed under $prefix/bin and the data folder will be
$prefix/share/lite-xl.

The folder $prefix is not hard-coded in the binary but is determined at runtime
as the directory such as the executable is inside $prefix/bin.

If no such $prefix exist it will fall back to the old behavior and use the
"data" folder from the executable directory.

In addtion to the `EXEDIR` global variable an additional variable is exposed,
`DATADIR`, to point to the data directory.

The old behavior using the "data" directory can be still selected at compile
time using the "portable" option. The released Windows package will use the
"data" directory as before.

**Configuration stored into the user's home directory**

Now the Lite XL user's configuration will be stored in the user's home directory
under .config/lite-xl".

The home directory is determined using the "HOME" environment variable except
on Windows wher "USERPROFILE" is used instead.

A new global variable `USERDIR` is exposed to point to the user's directory.

## [1.11] - 2020-07-05

- include changes from rxi's Lite 1.11
- fix behavior of tab to indent multiple lines
- disable auto-complete on very big files to limit memory usage
- limit project scan to a maximum number of files to limit memory usage
- list recently visited files when using "Find File" command

## [1.08] - 2020-06-14

- Subpixel font rendering, removed gamma correction
- Avoid using CPU when the editor is idle

## [1.06] - 2020-05-31

- subpixel font rendering with gamma correction

[3.6.0]: https://github.com/pragtical/pragtical/releases/tag/v3.6.0
[3.5.2]: https://github.com/pragtical/pragtical/releases/tag/v3.5.2
[3.5.1]: https://github.com/pragtical/pragtical/releases/tag/v3.5.1
[3.5.0]: https://github.com/pragtical/pragtical/releases/tag/v3.5.0
[3.4.4]: https://github.com/pragtical/pragtical/releases/tag/v3.4.4
[3.4.3]: https://github.com/pragtical/pragtical/releases/tag/v3.4.3
[3.4.2]: https://github.com/pragtical/pragtical/releases/tag/v3.4.2
[3.4.1]: https://github.com/pragtical/pragtical/releases/tag/v3.4.1
[3.4.0]: https://github.com/pragtical/pragtical/releases/tag/v3.4.0
[3.3.1]: https://github.com/pragtical/pragtical/releases/tag/v3.3.1
[3.3.0]: https://github.com/pragtical/pragtical/releases/tag/v3.3.0
[3.2.2]: https://github.com/pragtical/pragtical/releases/tag/v3.2.2
[3.2.1]: https://github.com/pragtical/pragtical/releases/tag/v3.2.1
[3.2.0]: https://github.com/pragtical/pragtical/releases/tag/v3.2.0
[3.1.2]: https://github.com/pragtical/pragtical/releases/tag/v3.1.2
[3.1.1]: https://github.com/pragtical/pragtical/releases/tag/v3.1.1
[3.1.0]: https://github.com/pragtical/pragtical/releases/tag/v3.1.0
[3.0.0]: https://github.com/pragtical/pragtical/releases/tag/v3.0.0
[2.1.1]: https://github.com/lite-xl/lite-xl/releases/tag/v2.1.1
[2.1.0]: https://github.com/lite-xl/lite-xl/releases/tag/v2.1.0
[2.0.5]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.5
[2.0.4]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.4
[2.0.3]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.3
[2.0.2]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.2
[2.0.1]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.1
[2.0]: https://github.com/lite-xl/lite-xl/releases/tag/v2.0.0
[1.16.11]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.11
[1.16.10]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.10
[1.16.9]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.9
[1.16.8]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.8
[1.16.7]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.7
[1.16.6]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.6
[1.16.5]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.5
[1.16.4]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.4
[1.16.2]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.2-lite-xl
[1.16.1]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.1-lite-xl
[1.16]: https://github.com/lite-xl/lite-xl/releases/tag/v1.16.0-lite-xl
[1.15]: https://github.com/lite-xl/lite-xl/releases/tag/v1.15-lite-xl
[1.14]: https://github.com/lite-xl/lite-xl/releases/tag/v1.14-lite-xl
[1.13]: https://github.com/lite-xl/lite-xl/releases/tag/v1.13-lite-xl
[1.11]: https://github.com/lite-xl/lite-xl/releases/tag/v1.11-lite-xl
[1.08]: https://github.com/lite-xl/lite-xl/releases/tag/v1.08-subpixel
[1.06]: https://github.com/lite-xl/lite-xl/releases/tag/1.06-subpixel-rc1
