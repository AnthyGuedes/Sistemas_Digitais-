@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto 48b0e72042f641ad979a54a7e5b5ec87 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_semaforo_behav xil_defaultlib.tb_semaforo -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
