setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/p2Pasti/Operaciones/Operaciones.adf"]} { 
	design create Operaciones "A:/Documentos/Aruitectura Pasti/p2Pasti"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/p2Pasti/Operaciones"
cd "A:/Documentos/Aruitectura Pasti/p2Pasti"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "A:/Documentos/Aruitectura Pasti/p2Pasti/OperacionesAritmeticas.vhd"
vlib "A:/Documentos/Aruitectura Pasti/p2Pasti/Operaciones/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/p2Pasti/OperacionesAritmeticas.vhd"
entity OperacionesAritmeticas
vsim  +access +r OperacionesAritmeticas   -PL pmi_work -L ovi_machxo2
add wave *
