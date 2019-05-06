setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/simulacion/simulacion.adf"]} { 
	design create simulacion "A:/Documentos/Aruitectura Pasti"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/simulacion"
cd "A:/Documentos/Aruitectura Pasti"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "A:/Documentos/Aruitectura Pasti/paquete.vhd"
addfile "A:/Documentos/Aruitectura Pasti/OperacionesLogicas.vhd"
vlib "A:/Documentos/Aruitectura Pasti/simulacion/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/paquete.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/OperacionesLogicas.vhd"
entity OperacionesLogicas
vsim  +access +r OperacionesLogicas   -PL pmi_work -L ovi_machxo2
add wave *
