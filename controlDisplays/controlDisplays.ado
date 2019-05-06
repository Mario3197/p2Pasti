setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays/controlDisplays.adf"]} { 
	design create controlDisplays "A:/Documentos/Aruitectura Pasti/Practica 1"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays"
cd "A:/Documentos/Aruitectura Pasti/Practica 1"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays.vhd"
vlib "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays.vhd"
entity controlDisplays
vsim  +access +r controlDisplays   -PL pmi_work -L ovi_machxo2
