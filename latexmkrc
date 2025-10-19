#!/usr/bin/perl
# ============================================================
#  LaTeXmk configuration for LuaLaTeX + TikZ + Biber
#  （名刺などのTikZ付き文書を安定コンパイル）
# ============================================================

# --- コンパイラ設定 ---
$latex      = 'lualatex -interaction=nonstopmode -shell-escape %O %S';
$pdflatex   = 'lualatex -interaction=nonstopmode -shell-escape %O %S';

# --- BibLaTeX/Biber 設定 ---
$bibtex     = 'biber --bibencoding=utf8 %B';
$bibtex_use = 2;   # use biber instead of bibtex

# --- 出力形式 ---
$pdf_mode   = 1;   # PDF 直出力 (no DVI)
$postscript_mode = 0;

# --- ビューワ設定 ---
$pdf_previewer = 'zathura';   # プレビューはZathuraで開く

# --- クリーニング拡張子 ---
$clean_ext .= ' %R.run.xml %R.bbl %R.bcf %R.log %R.blg %R.nav %R.snm %R.vrb %R.out %R.fls %R.fdb_latexmk';

# --- リピート回数 ---
$max_repeat = 5;

# --- PDF更新方法 ---
$pdf_update_method = 2;

# --- PDFを削除しない（常に残す） ---
$pvc_view_file_via_temporary = 0;

# ============================================================
#  end of .latexmkrc
# ============================================================
