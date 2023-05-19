;# パスからファイル名のみを抜き出す
;# 第一引数：ファイルのパスのリスト
;# 戻り値：ファイル名のリスト
proc  mybasename {PathList} {
	set lnum [llength $PathList]
	set count 0

	while {$count < $lnum} {
		set npath [lindex $PathList $count]	;#ファイルパスのリストPathListから要素をnpathに代入
		set dlist [split $npath /]		;#ファイルパスの要素npathをディレクトリで分割しリスト化し、dlistに代入
		set fname [lindex $dlist end]	;#ファイルパスの要素npathからファイル名を抽出、fnameに代入
		lappend flist $fname	;#リストの作成
		incr count
	}
	return $flist
}