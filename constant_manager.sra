HA$PBExportHeader$constant_manager.sra
$PBExportComments$Generated Application Object
forward
global type constant_manager from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type constant_manager from application
string appname = "constant_manager"
end type
global constant_manager constant_manager

on constant_manager.create
appname="constant_manager"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on constant_manager.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_constant_manager)
end event

