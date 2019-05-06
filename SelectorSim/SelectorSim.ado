setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/SelectorSim/SelectorSim.adf"]} { 
	design create SelectorSim "A:/Documentos/Aruitectura Pasti"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/SelectorSim"
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
addfile "A:/Documentos/Aruitectura Pasti/Selector.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Main.vhd"
vlib "A:/Documentos/Aruitectura Pasti/SelectorSim/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/paquete.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/OperacionesLogicas.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Shifters.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Selector.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Main.vhd"
entity Selector
vsim  +access +r Selector   -PL pmi_work -L ovi_machxo2
add wave *
