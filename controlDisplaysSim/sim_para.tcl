lappend auto_path "A:/Archivos de programa/lscc/diamond/3.10_x64/data/script"
package require simulation_generation
set ::bali::simulation::Para(PROJECT) {controlDisplaysSim}
set ::bali::simulation::Para(PROJECTPATH) {A:/Documentos/Aruitectura Pasti/Practica 1}
set ::bali::simulation::Para(FILELIST) {"A:/Documentos/Aruitectura Pasti/Practica 1/controlDisplays.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesLogicas.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/paquete.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/Shifters.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/Main.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/Selector.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/OperacionesAritmeticas.vhd" "A:/Documentos/Aruitectura Pasti/Practica 1/BCD10Bits.vhd" }
set ::bali::simulation::Para(GLBINCLIST) {}
set ::bali::simulation::Para(INCLIST) {"none" "none" "none" "none" "none" "none" "none" "none"}
set ::bali::simulation::Para(WORKLIBLIST) {"work" "work" "work" "work" "work" "work" "work" "work" }
set ::bali::simulation::Para(COMPLIST) {"VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" "VHDL" }
set ::bali::simulation::Para(SIMLIBLIST) {pmi_work ovi_machxo2}
set ::bali::simulation::Para(MACROLIST) {}
set ::bali::simulation::Para(SIMULATIONTOPMODULE) {Selector}
set ::bali::simulation::Para(SIMULATIONINSTANCE) {}
set ::bali::simulation::Para(LANGUAGE) {VHDL}
set ::bali::simulation::Para(SDFPATH)  {}
set ::bali::simulation::Para(ADDTOPLEVELSIGNALSTOWAVEFORM)  {0}
set ::bali::simulation::Para(RUNSIMULATION)  {0}
set ::bali::simulation::Para(HDLPARAMETERS) {}
set ::bali::simulation::Para(POJO2LIBREFRESH)    {}
set ::bali::simulation::Para(POJO2MODELSIMLIB)   {}
::bali::simulation::ActiveHDL_Run
