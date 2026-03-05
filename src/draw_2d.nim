# Seiichi Ariga <seiichi.ariga@gmail.com>

import naylib

# --- 設定 ---
const
  screenWidth = 800
  screenHeight = 450

proc main() =
  # ウィンドウの初期化
  initWindow(screenWidth, screenHeight, "Naylib 2D Boilerplate")
  setTargetFPS(60) # フレームレートを60に固定

  # メインループ
  while not windowShouldClose():
    # --- 1. 更新処理 (Update) ---
    let mousePos = getMousePosition()

    # --- 2. 描画処理 (Draw) ---
    beginDrawing()
    clearBackground(Raywhite) # 背景をクリア

    # グリッドの描画 (補助線)
    drawGrid(10, 1.0)

    # 図形の描画例
    drawText("Naylibでお絵かき！", 190, 200, 20, Lightgray)
    drawCircle(screenWidth div 2, screenHeight div 2, 50, Red)
    drawRectangle(10, 10, 150, 60, Skyblue)
    
    # マウス位置に追従する円
    drawCircleV(mousePos, 15, Orange)

    drawFPS(10, 10) # FPSを表示
    endDrawing()

  # 終了処理
  closeWindow()

# プログラムの実行
main()