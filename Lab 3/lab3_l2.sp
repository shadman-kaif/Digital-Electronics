* FILE: lab3_l2.sp

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

* SPICE netlist for "lab3_l2" generated by MMI_SUE5.6.29 on Thu Mar 16 
*+ 13:04:52 EDT 2023.

* start main CELL lab3_l2
* .SUBCKT lab3_l2 A B C Y 
VVDD net_3 GND DC 2.5V 
C_1 GND Y 1.5pF 
M_1 net_4 B net_3 vdd p W='15*1u' L=lp_min ad='areap(15,sdd)' 
+ as='areap(15,sdd)' pd='perip(15,sdd)' ps='perip(15,sdd)' 
M_2 net_4 C net_3 vdd p W='15*1u' L=lp_min ad='areap(15,sdd)' 
+ as='areap(15,sdd)' pd='perip(15,sdd)' ps='perip(15,sdd)' 
M_3 Y A net_4 vdd p W='15*1u' L=lp_min ad='areap(15,sdd)' 
+ as='areap(15,sdd)' pd='perip(15,sdd)' ps='perip(15,sdd)' 
M_4 Y A GND gnd n W='2.5*1u' L=ln_min ad='arean(2.5,sdd)' 
+ as='arean(2.5,sdd)' pd='perin(2.5,sdd)' ps='perin(2.5,sdd)' 
M_5 Y B net_1 gnd n W='5*1u' L=ln_min ad='arean(5,sdd)' 
+ as='arean(5,sdd)' pd='perin(5,sdd)' ps='perin(5,sdd)' 
M_6 net_1 C GND gnd n W='5*1u' L=ln_min ad='arean(5,sdd)' 
+ as='arean(5,sdd)' pd='perin(5,sdd)' ps='perin(5,sdd)' 
V_1 B GND DC 2.5V 
V_2 C GND pulse 0 0 0ns 200ps 200ps 3ns 6ns 
V_3 uc_net_2 GND pulse 0 2.5 0ns 200ps 200ps 5ns 15ns 
V_4 A GND pulse 0 2.5 0ns 200ps 200ps 5ns 15ns 
* .ENDS	$ lab3_l2

.GLOBAL gnd

.END

