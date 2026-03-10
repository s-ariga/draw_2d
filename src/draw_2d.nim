# Copyright 2026  Seiichi Ariga

import raylib
import rlgl
import std/math # sinを使うために必要

import constants
#import gen_line_func

proc main() =
  # アンチエイリアス有効化
  # setConfigFlags(flags(ConfigFlags.Msaa4xHint))
  initWindow(ScreenWidth, ScreenHeight, "Naylib Math Drawing")
  setTargetFPS(60)

  # シェーダーを読み込む
  var shader = loadShader("", "src/GLSL/wave.fs")
  # シェーダー内の変数へのポインタを取得
  let secondsLoc = getShaderLocation(shader, "seconds")

  while not windowShouldClose():
    let t = getTime().float32
    setShaderValue(shader, secondsLoc, t)

    beginDrawing()
    beginShaderMode(shader)

    drawRectangle(0, 0, ScreenWidth, ScreenHeight, Red)

    endShaderMode()
    endDrawing()

  closeWindow()

main()