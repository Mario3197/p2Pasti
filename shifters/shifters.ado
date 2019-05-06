setenv SIM_WORKING_FOLDER .
set newDesign 0
if {![file exists "C:/Users/Mario/Desktop/p2Pasti/shifters/shifters.adf"]} { 
	design create shifters "C:/Users/Mario/Desktop/p2Pasti"
  set newDesign 1
}
design open "C:/Users/Mario/Desktop/p2Pasti/shifters"
cd "C:/Users/Mario/Desktop/p2Pasti"
designverincludedir -clear
designverlibrarysim -PL -clear
designverlibrarysim -L -clear
designverlibrarysim -PL pmi_work
designverlibrarysim ovi_machxo2
designverdefinemacro -clear
if {$newDesign == 0} { 
  removefile -Y -D *
}
addfile "C:/Users/Mario/Desktop/p2Pasti/Shifters.vhd"
vlib "C:/Users/Mario/Desktop/p2Pasti/shifters/work"
set worklib work
adel -all
vcom -dbg -work work "C:/Users/Mario/Desktop/p2Pasti/Shifters.vhd"
entity Shifters
vsim  +access +r Shifters   -PL pmi_work -L ovi_machxo2
add wave *
