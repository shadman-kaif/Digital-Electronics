* FILE: pulsegen.sp

********************** begin header *****************************

* Sample Header file for Generic 2.5V 0.25 um process (g25)

.OPTIONS post ACCT OPTS lvltim=2
.OPTIONS post_version=9007

**################################################
* Only Typical/Typical models included
* NEED TO CHANGE ${MMI_TOOLS} TO BE PHYSICAL PATH
.include '/cad2/mmi_local/sue/g25.mod'
* NOTE: these are contrived spice models
**################################################

.param  arean(w,sdd) = '(w*sdd*1p)'
.param  areap(w,sdd) = '(w*sdd*1p)'
* Setup either one or the other of the following
* For ACM=0,2,10,12 fet models
.param  perin(w,sdd) = '(2u*(w+sdd))'
.param  perip(w,sdd) = '(2u*(w+sdd))'
* For ACM=3,13 fet models
*.param  perin(w,sdd) = '(1u*(w+2*sdd))'
*.param  perip(w,sdd) = '(1u*(w+2*sdd))'

.param ln_min   =  0.25u
.param lp_min   =  0.25u

* used in source/drain area/perimeter calculation
.param sdd        =  0.95

.PARAM vddp=2.5		$ VDD voltage

VDD vdd 0 DC vddp 

.TEMP 105
.TRAN 10p 16n
*********************** end header ******************************

* SPICE netlist for "pulsegen" generated by MMI_SUE5.6.29 on Thu Jan 26 
*+ 13:17:40 EST 2023.

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

.SUBCKT nand2 in0 in1 out WP=2 WN=2
M_1 out in0 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_2 out in0 net_1 gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_3 out in1 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_4 net_1 in1 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
.ENDS	$ nand2

* start main CELL pulsegen
* .SUBCKT pulsegen in out0_H out1_H my_name=Bikram
Xinverter net_2 net_1 inverter 
Xinverter_1 in net_2 inverter 
Xinverter_2 net_1 out0_H inverter 
Xnand2 out0_H in out1_H nand2 
V_1 in gnd pulse 0 vddp 0ns 200ps 200ps 3ns 6ns 
* .ENDS	$ pulsegen

.GLOBAL gnd vdd

.END
