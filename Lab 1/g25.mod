* taken from http://www.mosis.org/cgi-bin/cgiwrap/umosis/swp/params/tsmc-025/n94s-params.txt
* DATE: Jul  6/99
* LOT: n94s                  WAF: 08
* Temperature_parameters=Default
.MODEL n NMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 5.8E-9
+XJ      = 1E-7           NCH     = 2.3549E17      VTH0    = 0.4308936
+K1      = 0.3519429      K2      = 0.0298493      K3      = 1E-3
+K3B     = 0.0592323      W0      = 1E-5           NLX     = 1.465901E-7
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.0183405      DVT1    = 4.897584E-3    DVT2    = -0.0252658
+U0      = 455.3033362    UA      = 5.223592E-10   UB      = 1.104713E-18
+UC      = 3.287888E-11   VSAT    = 1.050993E5     A0      = 1.2318623
+AGS     = 0.3043334      B0      = 6.67749E-8     B1      = 5E-6
+KETA    = 8.518046E-4    A1      = 0              A2      = 1
+RDSW    = 509.5675851    PRWG    = 0.0227558      PRWB    = -1E-3
+WR      = 1              WINT    = 2.126497E-9    LINT    = 4.393474E-9
+XL      = 3E-8           XW      = 0              DWG     = -3.409033E-9
+DWB     = 2.794842E-9    VOFF    = -0.1026054     NFACTOR = 0.1344887
+CIT     = 0              CDSC    = 1.527511E-3    CDSCD   = 0
+CDSCB   = 0              ETA0    = 3.48737E-3     ETAB    = 4.557986E-4
+DSUB    = 3.045473E-3    PCLM    = 1.0446257      PDIBLC1 = 0.1441952
+PDIBLC2 = 4.513382E-4    PDIBLCB = -2.816756E-5   DROUT   = 0.4698725
+PSCBE1  = 1.761109E10    PSCBE2  = 3.772916E-9    PVAG    = 0.0361824
+DELTA   = 0.01           MOBMOD  = 1              PRT     = 0
+UTE     = -1.5           KT1     = -0.11          KT1L    = 0
+KT2     = 0.022          UA1     = 4.31E-9        UB1     = -7.61E-18
+UC1     = -5.6E-11       AT      = 3.3E4          WL      = 0
+WLN     = 1              WW      = 0              WWN     = 1
+WWL     = 0              LL      = 0              LLN     = 1
+LW      = 0              LWN     = 1              LWL     = 0
+CAPMOD  = 2              XPART   = 0.4            CGDO    = 6.27E-10
+CGSO    = 6.27E-10       CGBO    = 0              CJ      = 1.918655E-3
+PB      = 0.9784049      MJ      = 0.4721729      CJSW    = 4.441595E-10
+PBSW    = 0.9419636      MJSW    = 0.2871118      PVTH0   = 1.342985E-3
+PRDSW   = -61.8357222    PK2     = -3.140724E-3   WKETA   = 7.512693E-4
+LKETA   = -6.144062E-3    )
*
.MODEL p PMOS (                                LEVEL   = 49
+VERSION = 3.1            TNOM    = 27             TOX     = 5.8E-9
+XJ      = 1E-7           NCH     = 4.1589E17      VTH0    = -0.6158735
+K1      = 0.4598379      K2      = 0.0399415      K3      = 0
+K3B     = 8.7410723      W0      = 1E-6           NLX     = 1E-9
+DVT0W   = 0              DVT1W   = 0              DVT2W   = 0
+DVT0    = 0.6249485      DVT1    = 0.203296       DVT2    = -0.0513763
+U0      = 158.67524      UA      = 2.200024E-10   UB      = 4.457415E-18
+UC      = 1.02138E-10    VSAT    = 1.85064E5      A0      = 1.3826397
+AGS     = 0.4192977      B0      = 2.844099E-6    B1      = 5E-6
+KETA    = 0.0208695      A1      = 0              A2      = 1
+RDSW    = 968.5463       PRWG    = -0.1026483     PRWB    = -0.325
+WR      = 1              WINT    = 2.748811E-8    LINT    = 8.71907E-9
+XL      = 3E-8           XW      = 0              DWG     = -4.087585E-8
+DWB     = 2.032008E-8    VOFF    = -0.15          NFACTOR = 1.5460516
+CIT     = 0              CDSC    = 1.413317E-4    CDSCD   = 0
+CDSCB   = 0              ETA0    = 0.3241245      ETAB    = -0.1842
+DSUB    = 1.0287138      PCLM    = 5.2654567      PDIBLC1 = 4.228338E-3
+PDIBLC2 = 1.204519E-3    PDIBLCB = 2.37525E-3     DROUT   = 0
+PSCBE1  = 3.011456E10    PSCBE2  = 3.037042E-7    PVAG    = 8.9564294
+DELTA   = 0.01           MOBMOD  = 1              PRT     = 0
+UTE     = -1.5           KT1     = -0.11          KT1L    = 0
+KT2     = 0.022          UA1     = 4.31E-9        UB1     = -7.61E-18
+UC1     = -5.6E-11       AT      = 3.3E4          WL      = 0
+WLN     = 1              WW      = 0              WWN     = 1
+WWL     = 0              LL      = 0              LLN     = 1
+LW      = 0              LWN     = 1              LWL     = 0
+CAPMOD  = 2              XPART   = 0.4            CGDO    = 5.59E-10
+CGSO    = 5.59E-10       CGBO    = 0              CJ      = 1.882857E-3
+PB      = 0.9891317      MJ      = 0.4679789      CJSW    = 3.67186E-10
+PBSW    = 0.9884654      MJSW    = 0.3562128      PVTH0   = 3.923756E-3
+PRDSW   = 15.3953053     PK2     = 2.061759E-3    WKETA   = 4.10049E-3
+LKETA   = -0.0232426     LVSAT   = 1.257E5         )
*
