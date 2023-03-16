* FILE: gggggg.sp

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

* SPICE netlist for "gggggg" generated by MMI_SUE5.6.29 on Thu Mar 16 
*+ 14:00:11 EDT 2023.

.SUBCKT nor2 in0 in1 out WP=4 WN=1
M_1 out in1 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in1 net_1 vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_3 out in0 gnd gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_4 net_1 in0 vdd vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ nor2

.SUBCKT inverter in out WP=2 LP=lp_min WN=1 LN=ln_min
M_1 out in gnd gnd n W='WN*1u' L=LN ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
M_2 out in vdd vdd p W='WP*1u' L=LP ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
.ENDS	$ inverter

.SUBCKT xgate in in_L t1 t2 WP=2 WN=1
M_1 t2 in_L t1 vdd p W='WP*1u' L=lp_min ad='areap(WP,sdd)' 
+ as='areap(WP,sdd)' pd='perip(WP,sdd)' ps='perip(WP,sdd)' 
M_2 t2 in t1 gnd n W='WN*1u' L=ln_min ad='arean(WN,sdd)' 
+ as='arean(WN,sdd)' pd='perin(WN,sdd)' ps='perin(WN,sdd)' 
.ENDS	$ xgate

* start main CELL gggggg
* .SUBCKT gggggg Q Q_b 
Xnor2 net_8 net_6 Q nor2 WP=9 WN=3
Xnor2_1 net_1 net_3 net_12 nor2 WP=9 WN=3
Xnor2_2 net_12 net_6 net_10 nor2 WP=9 WN=3
Xinverter net_2 net_4 inverter WP=9 WN=3
Xinverter_1 net_2 net_13 inverter WP=9 WN=3
Xinverter_2 net_4 net_5 inverter WP=9 WN=3
Xinverter_3 net_4 net_11 inverter WP=9 WN=3
Xxgate net_4 net_11 net_12 net_8 xgate WP=9 WN=3
Xxgate_1 net_2 net_13 net_9 net_3 xgate WP=9 WN=3
Xnor2_3 net_1 Q Q_b nor2 WP=9 WN=3
Xxgate_2 net_2 net_7 net_8 Q_b xgate WP=9 WN=3
Xinverter_4 net_2 net_7 inverter WP=9 WN=3
Xxgate_3 net_4 net_5 net_3 net_10 xgate WP=9 WN=3
V_1 net_2 gnd pulse 0 vddp 0ns 0.5ns 0.5ns 10ns 20ns 
V_2 net_1 gnd pulse 0 vddp 55ns 0.5ns 0.5ns 40ns 1000ns 
V_3 net_6 gnd pulse 0 vddp 175ns 0.5ns 0.5ns 40ns 1000ns 
V_4 net_9 gnd pulse 0 vddp 5ns 0.5ns 0.5ns 20ns 40ns 
.tran 10p 250n
* .ENDS	$ gggggg

.GLOBAL gnd vdd

.END

