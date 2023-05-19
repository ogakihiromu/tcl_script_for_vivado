source ./find.tcl
source ./basename.tcl

set prjname [myfind *.xpr]
open_project $prjname

set pre [mybasename [get_files]]
set pos [mybasename [myfind * [glob *.srcs]]]

set rmfile ""
set addfile ""

set prelnum [llength $pre]
puts $prelnum
set count 0

;#
;# pre(vivadoに登録されているファイル)、pos(リポジトリ内のファイル)
;#  pre
while {$count < $prelnum} {
	set nfile [lindex $pre $count]
	set posidx [lsearch -exact $pos $nfile]
	incr count
	if {$posidx < 0} {
		lappend rmfile $nfile
	}
}

puts $pos
puts $pre

set poslnum [llength $pos]
puts $poslnum
set count 0

while {$count < $poslnum} {
	set nfile [lindex $pos $count]
	set preidx [lsearch -exact $pre $nfile]
	incr count
	if {$preidx < 0} {
		lappend addfile $nfile
	}
}

puts $rmfile
puts $addfile

close_project

