$PBExportHeader$w_main.srw
$PBExportComments$Testing window for the array service object written by Lijun.Yang@worldnet.att.net
forward
global type w_main from window
end type
type cb_add from commandbutton within w_main
end type
type sle_s7 from singlelineedit within w_main
end type
type cb_insert from commandbutton within w_main
end type
type sle_s6 from singlelineedit within w_main
end type
type cb_remove from commandbutton within w_main
end type
type cb_sortd from commandbutton within w_main
end type
type sle_s5 from singlelineedit within w_main
end type
type sle_5 from singlelineedit within w_main
end type
type sle_4 from singlelineedit within w_main
end type
type sle_3 from singlelineedit within w_main
end type
type sle_2 from singlelineedit within w_main
end type
type sle_1 from singlelineedit within w_main
end type
type sle_s3 from singlelineedit within w_main
end type
type sle_s2 from singlelineedit within w_main
end type
type sle_s4 from singlelineedit within w_main
end type
type sle_s1 from singlelineedit within w_main
end type
type cb_sorta from commandbutton within w_main
end type
type gb_2 from groupbox within w_main
end type
type gb_1 from groupbox within w_main
end type
end forward

global type w_main from window
integer x = 1070
integer y = 480
integer width = 1426
integer height = 1660
boolean titlebar = true
string title = "Array Service Object Sample"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 79741120
cb_add cb_add
sle_s7 sle_s7
cb_insert cb_insert
sle_s6 sle_s6
cb_remove cb_remove
cb_sortd cb_sortd
sle_s5 sle_s5
sle_5 sle_5
sle_4 sle_4
sle_3 sle_3
sle_2 sle_2
sle_1 sle_1
sle_s3 sle_s3
sle_s2 sle_s2
sle_s4 sle_s4
sle_s1 sle_s1
cb_sorta cb_sorta
gb_2 gb_2
gb_1 gb_1
end type
global w_main w_main

type prototypes

end prototypes

type variables
singlelineedit sle_input[], sle_result[]
end variables

on w_main.create
this.cb_add=create cb_add
this.sle_s7=create sle_s7
this.cb_insert=create cb_insert
this.sle_s6=create sle_s6
this.cb_remove=create cb_remove
this.cb_sortd=create cb_sortd
this.sle_s5=create sle_s5
this.sle_5=create sle_5
this.sle_4=create sle_4
this.sle_3=create sle_3
this.sle_2=create sle_2
this.sle_1=create sle_1
this.sle_s3=create sle_s3
this.sle_s2=create sle_s2
this.sle_s4=create sle_s4
this.sle_s1=create sle_s1
this.cb_sorta=create cb_sorta
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.cb_add,&
this.sle_s7,&
this.cb_insert,&
this.sle_s6,&
this.cb_remove,&
this.cb_sortd,&
this.sle_s5,&
this.sle_5,&
this.sle_4,&
this.sle_3,&
this.sle_2,&
this.sle_1,&
this.sle_s3,&
this.sle_s2,&
this.sle_s4,&
this.sle_s1,&
this.cb_sorta,&
this.gb_2,&
this.gb_1}
end on

on w_main.destroy
destroy(this.cb_add)
destroy(this.sle_s7)
destroy(this.cb_insert)
destroy(this.sle_s6)
destroy(this.cb_remove)
destroy(this.cb_sortd)
destroy(this.sle_s5)
destroy(this.sle_5)
destroy(this.sle_4)
destroy(this.sle_3)
destroy(this.sle_2)
destroy(this.sle_1)
destroy(this.sle_s3)
destroy(this.sle_s2)
destroy(this.sle_s4)
destroy(this.sle_s1)
destroy(this.cb_sorta)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;sle_input[1] = sle_1
sle_input[2] = sle_2
sle_input[3] = sle_3
sle_input[4] = sle_4
sle_input[5] = sle_5

sle_result[1] = sle_s1
sle_result[2] = sle_s2
sle_result[3] = sle_s3
sle_result[4] = sle_s4
sle_result[5] = sle_s5
sle_result[6] = sle_s6
end event

type cb_add from commandbutton within w_main
integer x = 928
integer y = 1044
integer width = 379
integer height = 84
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Add"
end type

event clicked;long ll_i, ll_bound
any la_list[], la_element[1]
nvo_array lnv_array


//Get the list from the input
For ll_i = 1 to 5
	la_list[ll_i] = sle_input[ll_i].text
Next

la_element[1] = sle_s7.text

//insert an element into the list
lnv_array.of_add (la_list, la_element)

//clean up the previous results
For ll_i = 1 to 6
	sle_result[ll_i].text =	''
Next

//display the results
ll_bound = Upperbound (la_list[])

For ll_i = 1 to ll_bound
	sle_result[ll_i].text =	la_list[ll_i]
Next
end event

type sle_s7 from singlelineedit within w_main
integer x = 928
integer y = 840
integer width = 375
integer height = 84
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Test Array"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_insert from commandbutton within w_main
integer x = 928
integer y = 952
integer width = 379
integer height = 84
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Insert (3)"
end type

event clicked;long ll_i, ll_bound
any la_list[], la_element[]
nvo_array lnv_array


//Get the list from the input
For ll_i = 1 to 5
	la_list[ll_i] = sle_input[ll_i].text
Next

la_element[1] = sle_s7.text

//insert an element into the list
lnv_array.of_insert(la_list, la_element, 3)

//clean up the previous results
For ll_i = 1 to 6
	sle_result[ll_i].text =	''
Next

//display the results
ll_bound = Upperbound (la_list[])

For ll_i = 1 to ll_bound
	sle_result[ll_i].text =	la_list[ll_i]
Next
end event

type sle_s6 from singlelineedit within w_main
integer x = 110
integer y = 1356
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_remove from commandbutton within w_main
integer x = 928
integer y = 340
integer width = 379
integer height = 84
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "&Remove (3, 2)"
end type

event clicked;long ll_i, ll_bound
any la_list[], la_element
nvo_array lnv_array


//Get the list from the input
For ll_i = 1 to 5
	la_list[ll_i] = sle_input[ll_i].text
Next

//insert an element into the list
lnv_array.of_remove(la_list, 3, 2)

//clean up the previous results
For ll_i = 1 to 6
	sle_result[ll_i].text =	''
Next

//display the results
ll_bound = Upperbound (la_list[])

For ll_i = 1 to ll_bound
	sle_result[ll_i].text =	la_list[ll_i]
Next
end event

type cb_sortd from commandbutton within w_main
integer x = 928
integer y = 240
integer width = 379
integer height = 84
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort (&D)"
end type

event clicked;long ll_i, ll_bound
any la_list[]
nvo_array lnv_array


//Get the list from the input
For ll_i = 1 to 5
	la_list[ll_i] = sle_input[ll_i].text
Next

//sort the list
lnv_array.of_sort(la_list, 1)

//clean up the previous results
For ll_i = 1 to 6
	sle_result[ll_i].text =	''
Next

//display the results
ll_bound = Upperbound (la_list[])

For ll_i = 1 to ll_bound
	sle_result[ll_i].text =	la_list[ll_i]
Next
end event

type sle_s5 from singlelineedit within w_main
integer x = 110
integer y = 1252
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_5 from singlelineedit within w_main
integer x = 110
integer y = 540
integer width = 667
integer height = 84
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "com"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_main
integer x = 110
integer y = 436
integer width = 667
integer height = 84
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "IT"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_3 from singlelineedit within w_main
integer x = 110
integer y = 332
integer width = 667
integer height = 84
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Method"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_2 from singlelineedit within w_main
integer x = 110
integer y = 224
integer width = 667
integer height = 84
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "Programming"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_main
integer x = 110
integer y = 124
integer width = 667
integer height = 84
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
string text = "PowerBuilder"
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_s3 from singlelineedit within w_main
integer x = 110
integer y = 1044
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_s2 from singlelineedit within w_main
integer x = 110
integer y = 940
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_s4 from singlelineedit within w_main
integer x = 110
integer y = 1148
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type sle_s1 from singlelineedit within w_main
integer x = 110
integer y = 836
integer width = 667
integer height = 84
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
end type

type cb_sorta from commandbutton within w_main
integer x = 928
integer y = 148
integer width = 379
integer height = 84
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
string text = "Sort (&A)"
end type

event clicked;long ll_i, ll_bound
any la_list[]
nvo_array lnv_array


//Get the list from the input
For ll_i = 1 to 5
	la_list[ll_i] = sle_input[ll_i].text
Next

//sort the list
lnv_array.of_sort(la_list)

//clean up the previous results
For ll_i = 1 to 6
	sle_result[ll_i].text =	''
Next

//display the results
ll_bound = Upperbound (la_list[])

For ll_i = 1 to ll_bound
	sle_result[ll_i].text =	la_list[ll_i]
Next
end event

type gb_2 from groupbox within w_main
integer x = 18
integer y = 732
integer width = 850
integer height = 772
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Results"
end type

type gb_1 from groupbox within w_main
integer x = 18
integer y = 20
integer width = 850
integer height = 652
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 79741120
string text = "Input"
end type

