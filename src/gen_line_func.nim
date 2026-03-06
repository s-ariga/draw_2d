# Copyright 2026 Seiichi Ariga <seiichi.ariga@gmail.com>


import raylib
import std/math

# constの設定読み込み
import constants

func generateLissajous*(a: float, b: float, delta: float, numPoints: int): seq[Vector2] =
  var points: seq[Vector2] = @[]
  for i in 0 ..< numPoints:
    let t = i.float * 0.1
    let x = 200 * sin(a * t + delta)
    let y = 200 * sin(b * t + delta)
    points.add(Vector2(x: x, y: y))
  return points