* FILE: P4.sp

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

* SPICE netlist for "P4" generated by MMI_SUE5.6.29 on Thu Mar 30 
*+ 14:23:43 EDT 2023.

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

* start main CELL P4
* .SUBCKT P4  
Xinverter net_9 net_3 inverter 
Xinverter_1 net_4 net_11 inverter 
C_1 gnd net_1 1pF 
C_2 gnd net_5 1pF 
M_1 net_15 net_6 net_1 gnd n W='8*1u' L=ln_min ad='arean(8,sdd)' 
+ as='arean(8,sdd)' pd='perin(8,sdd)' ps='perin(8,sdd)' 
M_2 net_5 net_6 net_7 gnd n W='8*1u' L=ln_min ad='arean(8,sdd)' 
+ as='arean(8,sdd)' pd='perin(8,sdd)' ps='perin(8,sdd)' 
M_3 net_7 net_4 gnd gnd n W='8*1u' L=ln_min ad='arean(8,sdd)' 
+ as='arean(8,sdd)' pd='perin(8,sdd)' ps='perin(8,sdd)' 
M_4 gnd net_11 net_15 gnd n W='8*1u' L=ln_min ad='arean(8,sdd)' 
+ as='arean(8,sdd)' pd='perin(8,sdd)' ps='perin(8,sdd)' 
V_1 net_13 gnd DC 2.5V 
V_2 net_16 gnd DC 2.5V 
V_3 net_10 gnd DC 2.5V 
V_4 net_12 gnd DC 2.5V 
V_5 net_4 gnd DC 2.5V 
M_5 net_13 net_3 net_1 vdd p W='8*1u' L=lp_min ad='areap(8,sdd)' 
+ as='areap(8,sdd)' pd='perip(8,sdd)' ps='perip(8,sdd)' 
M_6 net_5 net_3 net_12 vdd p W='8*1u' L=lp_min ad='areap(8,sdd)' 
+ as='areap(8,sdd)' pd='perip(8,sdd)' ps='perip(8,sdd)' 
Vprecharge net_9 gnd pulse 0 2.5V 0ns 50ps 50ps 8ns 19ns 
M_7 net_8 net_14 net_1 gnd n W='0.6*1u' L=ln_min ad='arean(0.6,sdd)' 
+ as='arean(0.6,sdd)' pd='perin(0.6,sdd)' ps='perin(0.6,sdd)' 
M_8 net_5 net_14 net_2 gnd n W='0.6*1u' L=ln_min ad='arean(0.6,sdd)' 
+ as='arean(0.6,sdd)' pd='perin(0.6,sdd)' ps='perin(0.6,sdd)' 
M_9 net_2 net_8 net_10 vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' 
+ as='areap(4,sdd)' pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_10 net_16 net_2 net_8 vdd p W='4*1u' L=lp_min ad='areap(4,sdd)' 
+ as='areap(4,sdd)' pd='perip(4,sdd)' ps='perip(4,sdd)' 
M_11 net_2 net_8 gnd gnd n W='1.62*1u' L=ln_min ad='arean(1.62,sdd)' 
+ as='arean(1.62,sdd)' pd='perin(1.62,sdd)' ps='perin(1.62,sdd)' 
M_12 gnd net_2 net_8 gnd n W='1.62*1u' L=ln_min ad='arean(1.62,sdd)' 
+ as='arean(1.62,sdd)' pd='perin(1.62,sdd)' ps='perin(1.62,sdd)' 
Vwrite net_6 gnd pulse 0 2.5V 10ns 50ps 50ps 9ns 100ns 
Vword net_14 gnd pulse 0 2.5V 10ns 50ps 50ps 20ns 100ns 
.tran 10p 100n
* .ENDS	$ P4

.GLOBAL gnd vdd

.END
