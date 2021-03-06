C-----------------------------------------------------------------------
C                           H E R W I G
C
C            a Monte Carlo event generator for simulating
C        +---------------------------------------------------+
C        | Hadron Emission Reactions With Interfering Gluons |
C        +---------------------------------------------------+
C      G. Marchesini, Dipartimento di Fisica, Universita di Milano
C          I.G. Knowles(*), M.H. Seymour(+) and  B.R. Webber,
C                   Cavendish Laboratory, Cambridge
C-----------------------------------------------------------------------
C with Deep Inelastic Scattering and Heavy Flavour Electroproduction by
C G.Abbiendi(@)and L.Stanco, Dipartimento di Fisica,Universita di Padova
C-----------------------------------------------------------------------
C        and Jet Photoproduction in Lepton-Hadron Collisions
C             by J. Chyla, Institute of Physics, Prague
C-----------------------------------------------------------------------
C(*)present address: Dept. of Physics & Astronomy, University of Glasgow
C-----------------------------------------------------------------------
C(+)present address: Theory Division, CERN
C-----------------------------------------------------------------------
C(@)present address: DESY, Hamburg
C-----------------------------------------------------------------------
C                  Version 5.9 - 22nd July 1996
C-----------------------------------------------------------------------
C Main reference:
C    G.Marchesini,  B.R.Webber,  G.Abbiendi,  I.G.Knowles,  M.H.Seymour,
C    and L.Stanco, Computer Physics Communications 67 (1992) 465.
C-----------------------------------------------------------------------
C Please send e-mail about  this program  to one of the  authors at the
C following addresses:
C       Decnet   : 19616::webber, vxdesy::abbiendi, 19800::knowles
C       Internet : webber@hep.phy.cam.ac.uk,
C                  seymour@surya11.cern.ch, knowles@v2.ph.gla.ac.uk
C-----------------------------------------------------------------------
CDECK  ID>, DECADD.
*CMZ :-        -28/01/92  12.34.44  by  Mike Seymour
*-- Author :    Luca Stanco
C-----------------------------------------------------------------------
      SUBROUTINE DECADD(LOGI)
C-----------------------------------------------------------------------
C     DUMMY SUBROUTINE: DELETE AND SET BDECAY='CLEO'
C     IN MAIN PROGRAM IF YOU USE CLEO DECAY PACKAGE
C-----------------------------------------------------------------------
      LOGICAL LOGI
      WRITE (6,10)
   10 FORMAT(/10X,'DECADD CALLED BUT NOT LINKED')
      STOP
      END
