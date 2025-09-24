@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xsim tb_somador_behav -key {Behavioral:sim_1:Functional:tb_somador} -tclbatch tb_somador.tcl -view C:/Users/laboratorio/project_trabalho_02/tb_somador_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
