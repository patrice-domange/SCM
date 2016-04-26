HA$PBExportHeader$w_constant_manager.srw
forward
global type w_constant_manager from window
end type
type cb_export from commandbutton within w_constant_manager
end type
type cb_about from commandbutton within w_constant_manager
end type
type cb_clear from commandbutton within w_constant_manager
end type
type cb_paste from commandbutton within w_constant_manager
end type
type cb_delete from commandbutton within w_constant_manager
end type
type cb_add from commandbutton within w_constant_manager
end type
type cb_filter from commandbutton within w_constant_manager
end type
type cb_sort from commandbutton within w_constant_manager
end type
type cb_exit from commandbutton within w_constant_manager
end type
type cb_copy from commandbutton within w_constant_manager
end type
type cb_save from commandbutton within w_constant_manager
end type
type cb_load from commandbutton within w_constant_manager
end type
type dw_1 from datawindow within w_constant_manager
end type
end forward

global type w_constant_manager from window
integer width = 2299
integer height = 1940
boolean titlebar = true
string title = "Symbolic Constants Manager"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_export cb_export
cb_about cb_about
cb_clear cb_clear
cb_paste cb_paste
cb_delete cb_delete
cb_add cb_add
cb_filter cb_filter
cb_sort cb_sort
cb_exit cb_exit
cb_copy cb_copy
cb_save cb_save
cb_load cb_load
dw_1 dw_1
end type
global w_constant_manager w_constant_manager

type variables
string is_null
end variables

on w_constant_manager.create
this.cb_export=create cb_export
this.cb_about=create cb_about
this.cb_clear=create cb_clear
this.cb_paste=create cb_paste
this.cb_delete=create cb_delete
this.cb_add=create cb_add
this.cb_filter=create cb_filter
this.cb_sort=create cb_sort
this.cb_exit=create cb_exit
this.cb_copy=create cb_copy
this.cb_save=create cb_save
this.cb_load=create cb_load
this.dw_1=create dw_1
this.Control[]={this.cb_export,&
this.cb_about,&
this.cb_clear,&
this.cb_paste,&
this.cb_delete,&
this.cb_add,&
this.cb_filter,&
this.cb_sort,&
this.cb_exit,&
this.cb_copy,&
this.cb_save,&
this.cb_load,&
this.dw_1}
end on

on w_constant_manager.destroy
destroy(this.cb_export)
destroy(this.cb_about)
destroy(this.cb_clear)
destroy(this.cb_paste)
destroy(this.cb_delete)
destroy(this.cb_add)
destroy(this.cb_filter)
destroy(this.cb_sort)
destroy(this.cb_exit)
destroy(this.cb_copy)
destroy(this.cb_save)
destroy(this.cb_load)
destroy(this.dw_1)
end on

event open;setnull(is_null)

end event

type cb_export from commandbutton within w_constant_manager
integer x = 1833
integer y = 800
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export..."
end type

event clicked;string ls_classname
string ls_constants
string	ls_filename
string ls_file
string ls_path
integer	li_file
long	ll_pos

if GetFileSaveName ( "Export To", ls_path, ls_filename, "SRU", "PB SRU(*.SRU),*.SRU" ) <> 1 then return  

ll_pos = pos( ls_filename, "." )
ls_classname = trim(left( ls_filename, ll_pos - 1 ))

cb_copy.event clicked()
ls_constants = clipboard()

ls_file = "$PBExportHeader$"+ls_classname+".sru~n"
ls_file += "forward~n"
ls_file += "global type "+ ls_classname+"  from nonvisualobject~n"
ls_file +="end type~n"
ls_file += "end forward~n"
ls_file += "~n"
ls_file += "global type "+ ls_classname + " from nonvisualobject~n"
ls_file += "end type~n"
ls_file += "global "+ls_classname+" " +ls_classname+"~n"
ls_file += "~n"
ls_file += "type variables~n"
ls_file += "Public:~n"
ls_file += ls_constants+"~n"
ls_file += "~n"
ls_file +="end variables~n"
ls_file += "on "+ls_classname+".create~n"
ls_file += "call super::create~n"
ls_file += 'TriggerEvent( this, "constructor" )~n'
ls_file += "end on~n"
ls_file += "~n"
ls_file += "on "+ ls_classname + ".destroy~n"
ls_file += 'TriggerEvent( this, "destructor" )~n'
ls_file += "call super::destroy~n"
ls_file += "end on~n"

li_file = fileopen( ls_path, StreamMode!, Write!, LockReadWrite!, Replace!, EncodingANSI! )
filewrite( li_file, ls_file )
fileclose( li_file )

end event

type cb_about from commandbutton within w_constant_manager
integer x = 1815
integer y = 1720
integer width = 402
integer height = 112
integer taborder = 130
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "About..."
end type

event clicked;open(w_about)
end event

type cb_clear from commandbutton within w_constant_manager
integer x = 1833
integer y = 1184
integer width = 402
integer height = 112
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Clear"
end type

event clicked;dw_1.reset()

end event

type cb_paste from commandbutton within w_constant_manager
integer x = 1833
integer y = 288
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Paste"
end type

event clicked;string ls_tmp
string ls_tmp2
string ls_import
long	ll_pos
long	ll_pos2

ls_tmp = clipboard()

if isnull( ls_tmp ) or ls_tmp = ""  then return

ll_pos = pos( ls_tmp, "~t" )
do while ll_pos > 0
	ls_tmp = replace( ls_tmp, ll_pos, 1, " ")
	ll_pos = pos( ls_tmp, "~t" )
loop

ll_pos = pos( ls_tmp, "=" )
do while ll_pos > 0 
	ls_tmp2 = trim(left( ls_tmp, ll_pos - 1 ))
	ll_pos2 = pos( ls_tmp, "~n",  ll_pos + 1 )
	ls_tmp = mid( ls_tmp, ll_pos2 + 1)
	ll_pos2 = lastpos( ls_tmp2, " " )
	if ll_pos2 = 0 then
		ll_pos2 = lastpos( ls_tmp2, "~t" )
	end if
	ls_import += trim(mid( ls_tmp2, ll_pos2 + 1) + "~n")
	ll_pos = pos( ls_tmp, "=" )
loop

dw_1.importstring( ls_import )
end event

type cb_delete from commandbutton within w_constant_manager
integer x = 1833
integer y = 544
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete Entry"
end type

event clicked;dw_1.deleterow(0)

end event

type cb_add from commandbutton within w_constant_manager
integer x = 1833
integer y = 416
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Add Entry"
end type

event clicked;dw_1.scrolltorow( dw_1.insertrow(0) )
dw_1.setfocus()


end event

type cb_filter from commandbutton within w_constant_manager
integer x = 1833
integer y = 1056
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Filter..."
end type

event clicked;dw_1.setfilter( is_null )
dw_1.sort()
this.setfocus()
end event

type cb_sort from commandbutton within w_constant_manager
integer x = 1833
integer y = 928
integer width = 402
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Sort..."
end type

event clicked;dw_1.setsort( is_null )
dw_1.sort()
this.setfocus()

end event

type cb_exit from commandbutton within w_constant_manager
integer x = 1833
integer y = 1312
integer width = 402
integer height = 112
integer taborder = 120
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Exit"
end type

event clicked;close(parent)
end event

type cb_copy from commandbutton within w_constant_manager
integer x = 1833
integer y = 672
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Copy"
end type

event clicked;string ls_clipboard
string ls_tmp

long	ll_i
long	ll_limit
long  	ll_max
long	ll_len
long	ll_diff
real	ll_fill



ls_tmp = string(dw_1.object.datawindow.table.sort)

dw_1.SetSort( "compute_length D")
dw_1.sort()

ll_max = long( dw_1.object.compute_length[1])

dw_1.SetSort( ls_tmp )
dw_1.sort()

ll_limit = dw_1.rowcount()

for ll_i = 1 to ll_limit
	ls_tmp = string( dw_1.object.constant_name[ll_i] )
	ll_len = len( ls_tmp )
	if ll_len < ll_max then
		ll_diff = ll_max - ll_len
		ll_fill = round( ll_diff / 4, 0 ) + 1
		do while mod( ll_diff, 4) <> 0
			ll_diff++
		loop
		do while (ll_fill * 4) <= ll_diff
			ll_fill ++
		loop
	else
		ll_fill = 1
	end if
	ls_clipboard += "constant integer "+ls_tmp + fill("~t", ll_fill) +"= "+string(ll_i)+"~n"
next

clipboard( ls_clipboard )

end event

type cb_save from commandbutton within w_constant_manager
integer x = 1833
integer y = 160
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save..."
end type

event clicked;long ll_i
long ll_limit

dw_1.Accepttext()

ll_limit = dw_1.rowcount()
for ll_i = 1 to ll_limit
	dw_1.object.constant_index[ll_i] = long(dw_1.object.compute_index[ll_i])
next
dw_1.saveas()

end event

type cb_load from commandbutton within w_constant_manager
integer x = 1833
integer y = 32
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Load..."
end type

event clicked;dw_1.reset()
dw_1.importfile( is_null )
end event

type dw_1 from datawindow within w_constant_manager
integer x = 37
integer y = 28
integer width = 1755
integer height = 1804
integer taborder = 110
string title = "none"
string dataobject = "d_constant_manager"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

