C
C     Global 
C
      REAL*8 HIST(200,100),XHIS(200,100),HDEL(200),HMIN(200)
     &      ,HMAX(200),USCORE(200),OSCORE(200)
     &      ,HAVG(200),HINT(200),HSIG(200)
      INTEGER NBIN(200),IHIS(200,100),IUSCORE(200),IOSCORE(200)
     &       ,IENT(200),NHIST
      CHARACTER*3  BOOK(200)
      CHARACTER*20 TITLE(200)
c    
      COMMON/HISTO/HIST,XHIS,HDEL,HMIN,HMAX,USCORE,OSCORE
     &            ,HAVG,HINT,HSIG,NBIN,IHIS,IUSCORE,IOSCORE,IENT,NHIST
     &            ,BOOK,TITLE