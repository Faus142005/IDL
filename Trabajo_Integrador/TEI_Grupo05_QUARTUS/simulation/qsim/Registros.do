onerror {exit -code 1}
vlib work
vlog -work work Registros.vo
vlog -work work EstaAndaMejor.vwf.vt
vsim -novopt -c -t 1ps -L cycloneiv_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.PruebaPrincipal2_vlg_vec_tst -voptargs="+acc"
vcd file -direction Registros.msim.vcd
vcd add -internal PruebaPrincipal2_vlg_vec_tst/*
vcd add -internal PruebaPrincipal2_vlg_vec_tst/i1/*
run -all
quit -f
