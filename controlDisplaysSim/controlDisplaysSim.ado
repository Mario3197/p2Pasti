setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplaysSim/controlDisplaysSim.adf"]} { 
	design create controlDisplaysSim "A:/Documentos/Aruitectura Pasti/Practica 1"
  set newDesign 1
}
design open "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplaysSim"
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
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesLogicas.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/paquete.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/Shifters.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/Main.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/Selector.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesAritmeticas.vhd"
addfile "A:/Documentos/Aruitectura Pasti/Practica 1/BCD10Bits.vhd"
vlib "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplaysSim/work"
set worklib work
adel -all
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesLogicas.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/paquete.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/Shifters.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/Main.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/Selector.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesAritmeticas.vhd"
vcom -dbg -work work "A:/Documentos/Aruitectura Pasti/Practica 1/BCD10Bits.vhd"
entity Selector
vsim  +access +r Selector   -PL pmi_work -L ovi_machxo2
