# Package

version       = "0.1.0"
author        = "Seiichi Ariga <seiichi.ariga@gmail.com>"
description   = "A simple 2D graphics app using naylib"
license       = "MIT"
srcDir        = "src"
bin           = @["draw_2d"]


# Dependencies

requires "nim >= 2.2.8"
requires "naylib >= 26.0.0"

# Tasks
task run, "Build and run the app":
  exec "nim c -r src/draw_2d.nim"

task clean, "Clean the build artifacts":
  when defined(windows):
    exec "del /Q draw_2d.exe"
  else:
    exec "rm -f draw_2d"
  if dirExists("nimcache"): rmDir("nimcache")

task build, "Build the app":
  exec "nim c src/draw_2d.nim"
