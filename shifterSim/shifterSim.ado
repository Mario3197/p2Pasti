setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/shifterSim/shifterSim.adf"]} { 
	design create shifterSim "A:/Documentos/Aruitectura Pasti"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/shifterSim"
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
addfile "A:/Documentos/Aruitectura Pasti/Shifters.vhd"
vlib "A:/Documentos/Aruitectura Pasti/shifterSim/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/paquete.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/OperacionesLogicas.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Shifters.vhd"
entity Shifters
vsim  +access +r Shifters   -PL pmi_work -L ovi_machxo2
add wave *
