;# 指定ディレクトリ配下のファイル探索
;# 第一引数：検索したいファイルの名、(例：*.txt)
;# 第二引数：ファイル探索したいディレクトリ、(例：./dirctory)
;# 戻り値：ファイルのパスのリスト
proc myfind {{pattern "*"} {dir ""}} { ;# 引数のデフォルト値は{}囲む
    set depth -1
    set retry -1
    while {$retry} {
        set wildcards [lrepeat [incr $depth] *]		;#変数wildcardsに*を数を増やしながら代入
        lappend found {*}[glob -nocomplain -directory $dir -type f -join {*}$wildcards $pattern]	;#変数foundにglobで*の数分の深さのディレクトリのファイルのパスを代入。globの同じ深さの異なるディレクトリそれぞれでファイル探索を行う特徴を利用、-join以下がファイルパターン(例：*/*/)
        set retry [llength [glob -nocomplain -directory $dir -type d -join {*}$wildcards *]]	;#変数retryにglobで*の数分の深さのディレクトリにディレクトリがあるかを確認、なければディレクトリの終端ということでllengthで空のリストを参照し0を返し、終了
	}
    return $found
}
