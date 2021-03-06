*
* $Id: gjetfr.F,v 1.1.1.1 1996/03/08 16:58:51 mclareni Exp $
*
* $Log: gjetfr.F,v $
* Revision 1.1.1.1  1996/03/08 16:58:51  mclareni
* Eurodec
*
*
#include "eurodec/pilot.h"
      SUBROUTINE GJETFR(I1,ILAST,NTPNT)
C.----------------------------------------------------------------------
C.
C.    SUBROUTINE FRAGMENTS GLUON AT LOCATION I1 IN /HADGEN/ INTO
C.    QQBAR PAIR. THE QUARK WILL BE POSITIONED AT I1 WHEREASE THE
C.    ANTIQUARK WILL BE LOCATED AT ILAST+1 IN /HADGEN/ (E > EGLMIN !).
C.    THE FLAVOUR CONTENT OF THE GLUON IS DETERMINED BY ASSUMING A
C.    FLAVOUR INDEPENDENT COUPLING OF THE GLUON WITH THE QQBAR PAIR
C.    BUT THE PHASE SPACE SUPRESSION IS TAKEN INTO ACCOUNT USING
C.    THE ANALOGY OF A VIRTUAL PHOTON DECAY.
C.    LAST UPDATE: 15/04/89
C.
C.----------------------------------------------------------------------
#if defined(CERNLIB_DOUBLE)
      DOUBLE PRECISION YGLU
#endif
#include "eurodec/ptable.inc"
#include "eurodec/convrt.inc"
#include "eurodec/hadgen.inc"
#include "eurodec/result.inc"
#include "eurodec/glufix.inc"
#include "eurodec/picons.inc"
      DIMENSION RQQB(8)
      DATA RQQB/ 0.333, 0.667, 1.000, 5*1.000/
C--
C--   KEEP INFORMATION ON GLUON FOR LATER ROTATION
      EGLUON=PHA(4,I1)
      CT=PHA(3,I1)/EGLUON
      ST=1.-CT**2
      IF (ST.LE.0.) THEN
        ST=0.0
        CF=SIGN(1.,PHA(3,I1))
        SF=0.0
      ELSE
        ST=SQRT(ST)
        CF=PHA(1,I1)/EGLUON/ST
        SF=PHA(2,I1)/EGLUON/ST
      ENDIF
C--
C--   SELECT FLAVOUR IN GLUON SPLITTING
   10 IFLAV=0
      RRAN=EURRAN(IFLDUM)
   20 IFLAV=IFLAV+1
      IF (RRAN.GT.RQQB(IFLAV)) GOTO 20
      AHM(I1)=PM(ICONV(IFLAV))
      IF ((2.*AHM(I1)+OFFVAC).GE.PHA(4,I1)) GOTO 10
      ILAST=ILAST+1
      IF (ILAST.GT.NHMAX) CALL ERRORD(62,' ',FLOAT(NHMAX))
      IH(I1)=IFLAV
      AHM(ILAST)=AHM(I1)
      IH(ILAST)=-IFLAV
C--
C--   SPECIFY GLUON FRAGMENTATION
   30 CALL DFUNRN(YGLU,Z)
      IF ((AHM(I1).GE.(Z*EGLUON)).OR.(AHM(ILAST).GE.((1.-Z)*EGLUON)))
     &GOTO 30
C--
C--   DETERMINE THE RELATIVE PT OF THE QUARKS
   40 PTQ2=-2.*(Z*(1.-Z)/(1.-Z/2.))*LOG(MAX(EURRAN(IPTDUM),1.E-4))
      PTQ=SIGG*SQRT(PTQ2)*2.3
      Z0=SQRT(AHM(I1)**2+PTQ**2)/EGLUON
      IF (Z0.GE.0.5) GOTO 40
      PHI=TWOPI*EURRAN(IPHDUM)
      PHA(1,I1)=PTQ*SIN(PHI)
      PHA(2,I1)=PTQ*COS(PHI)
      PHA(1,ILAST)=-PHA(1,I1)
      PHA(2,ILAST)=-PHA(2,I1)
C--
C--   ADJUST Z IN ORDER TO MEET MINIMUM REQUIREMENTS...
      Z=Z0+(1.-2.*Z0)*Z
      PHA(4,I1)=Z*EGLUON
      PHA(4,ILAST)=EGLUON-PHA(4,I1)
      PHA(3,I1)=PHA(4,I1)**2-PHA(1,I1)**2-PHA(2,I1)**2-AHM(I1)**2
      PHA(3,ILAST)=PHA(4,ILAST)**2-PHA(1,ILAST)**2-PHA(2,ILAST)**2-
     &AHM(ILAST)**2
      IF ((PHA(3,I1).LE.0.).OR.(PHA(3,ILAST).LE.0.)) GOTO 30
      PHA(3,I1)=SQRT(PHA(3,I1))
      PHA(3,ILAST)=SQRT(PHA(3,ILAST))
C--
C--   ROTATE THE QUARK PAIR (Z ---> X)
      CALL ROTER(CT,ST,CF,SF,PHA(1,I1))
      CALL ROTER(CT,ST,CF,SF,PHA(1,ILAST))
C--
C--   CALCULATE ABSOLUTE MOMENTA
      PHA(5,I1)=SQRT(PHA(1,I1)**2+PHA(2,I1)**2+PHA(3,I1)**2)
      PHA(5,ILAST)=SQRT(PHA(1,ILAST)**2+PHA(2,ILAST)**2+PHA(3,ILAST)**2)
C--
C--   COPY GLUON SPLITTING PRODUCTS TO /RESULT/
      NTPNT=NTPNT+1
      DO 50 J=1,4
   50 PTEIL(J,NTPNT)=PHA(J,I1)
      PTEIL(5,NTPNT)=AHM(I1)
      INDEXT(NTPNT)=IH(I1)
      NTPNT=NTPNT+1
      DO 60 J=1,4
   60 PTEIL(J,NTPNT)=PHA(J,ILAST)
      PTEIL(5,NTPNT)=AHM(ILAST)
      INDEXT(NTPNT)=IH(ILAST)
      RETURN
      END
