# Seiichi Ariga <seiichi.ariga@gmail.com>

import raylib

const
  screenWidth = 800
  screenHeight = 450

proc main() =
  setConfigFlags(flags(ConfigFlags.Msaa4xHint)) # 4x MSAAを有効にする
  initWindow(screenWidth, screenHeight, "Naylib Multi-Stroke Paint")
  setTargetFPS(60)

  # 「線のリスト」のリスト
  var strokes: seq[seq[Vector2]] = @[]
  # 現在描いている最中の線
  var currentStroke: seq[Vector2] = @[]

  while not windowShouldClose():
    # --- 更新処理 ---
    
    # マウスが押された瞬間：新しい線を開始
    if isMouseButtonPressed(MouseButton.Left):
      currentStroke = @[getMousePosition()]
    
    # マウスが押されている間：現在の線に点を追加
    if isMouseButtonDown(MouseButton.Left):
      currentStroke.add(getMousePosition())
      
    # マウスを離した瞬間：完成した線をリストに保存
    if isMouseButtonReleased(MouseButton.Left):
      strokes.add(currentStroke)
      currentStroke = @[]

    # 'C' キーで全消去
    if isKeyPressed(KeyboardKey.C):
      strokes.setLen(0)

    # --- 描画処理 ---
    beginDrawing()
    clearBackground(Raywhite)

    # 1. 過去に描いた全ての線を描画
    for stroke in strokes:
      if stroke.len > 1:
        drawLineStrip(stroke, Blue)

    # 2. 現在描いている最中の線を描画
    if currentStroke.len > 1:
      drawLineStrip(currentStroke, Red)

    drawText("Drag to draw / 'C' to clear", 10, 10, 20, Darkgray)
    endDrawing()

  closeWindow()

main()
