# Copyright 2026  Seiichi Ariga

import raylib
import rlgl
import std/math # sinを使うために必要

import constants
import gen_line_func

proc main() =
  # アンチエイリアス有効化
  setConfigFlags(flags(ConfigFlags.Msaa4xHint))
  initWindow(ScreenWidth, ScreenHeight, "Naylib Math Drawing")
  setTargetFPS(60)

  while not windowShouldClose():
    let t = getTime()
    let a = 2.0
    let b = 1.5
    let points = generateLissajous(2.0, 1.5, t, 360)

    beginDrawing()
    clearBackground(BgColor)

    # X軸（中央線）の描画
    drawLine(0, ScreenHeight div 2, ScreenWidth, ScreenHeight div 2, Lightgray)

    pushMatrix()
    translatef((ScreenWidth / 2), (ScreenHeight / 2), 0)
    # 線として描画
    if points.len > 1:
        drawLineStrip(points, Blue)
    popMatrix()

    drawText("(" & $a & "," & $b & ")", 20, 20, 20, Darkgray)
    endDrawing()

  closeWindow()

main()