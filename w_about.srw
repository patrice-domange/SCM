HA$PBExportHeader$w_about.srw
forward
global type w_about from window
end type
type phl_1 from picturehyperlink within w_about
end type
type shl_1 from statichyperlink within w_about
end type
type st_4 from statictext within w_about
end type
type st_3 from statictext within w_about
end type
type st_2 from statictext within w_about
end type
type st_1 from statictext within w_about
end type
end forward

global type w_about from window
integer width = 2926
integer height = 632
boolean titlebar = true
string title = "About"
boolean controlmenu = true
windowtype windowtype = response!
string icon = "AppIcon!"
boolean center = true
windowanimationstyle openanimation = fadeanimation!
integer animationtime = 800
phl_1 phl_1
shl_1 shl_1
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_about w_about

on w_about.create
this.phl_1=create phl_1
this.shl_1=create shl_1
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.phl_1,&
this.shl_1,&
this.st_4,&
this.st_3,&
this.st_2,&
this.st_1}
end on

on w_about.destroy
destroy(this.phl_1)
destroy(this.shl_1)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

type phl_1 from picturehyperlink within w_about
integer x = 27
integer y = 20
integer width = 617
integer height = 400
string pointer = "HyperLink!"
boolean originalsize = true
string picturename = "D:\Users\patrice\Documents\TFS\PowerBuilderToolsandUtilities\ConstantManager\pbtu.png"
boolean focusrectangle = false
string url = "https://powerbuildertoolsandutilities.codeplex.com/"
end type

type shl_1 from statichyperlink within w_about
integer x = 1614
integer y = 428
integer width = 978
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
string text = "PowerBuilder Tools && Utilities"
boolean focusrectangle = false
string url = "https://powerbuildertoolsandutilities.codeplex.com/"
end type

type st_4 from statictext within w_about
integer x = 672
integer y = 428
integer width = 933
integer height = 92
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Home page && License information:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_about
integer x = 672
integer y = 316
integer width = 1915
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "$$HEX2$$a9002000$$ENDHEX$$2016 dP Software"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_about
integer x = 672
integer y = 204
integer width = 1915
integer height = 92
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "by Patrice Domange"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_about
integer x = 672
integer y = 32
integer width = 1915
integer height = 152
integer textsize = -18
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "Symbolic Constants Manager V 1.1"
alignment alignment = center!
boolean focusrectangle = false
end type

