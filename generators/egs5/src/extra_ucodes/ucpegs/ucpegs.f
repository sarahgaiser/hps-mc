!***********************************************************************
!**************************                                            *
!***** u c p e g s ********             EGS5.0 USER CODE - 050719-1130 *
!**************************                                            *
!***********************************************************************
!                                                                      *
!***********************************************************************
!23456789|123456789|123456789|123456789|123456789|123456789|123456789|12
!-----------------------------------------------------------------------
!------------------------------- main code -----------------------------
!-----------------------------------------------------------------------

      implicit none

!     ------------
!     EGS5 COMMONs
!     ------------
      include 'include/egs5_h.f'                ! Main EGS "header" file
      include 'include/egs5_media.f'

      integer i,j                               ! local variables
      character*24 medarr(1)

!     ----------
!     Open files
!     ----------
      open(UNIT= 6,FILE='egs5job.out',STATUS='unknown')

!     ==============
      call block_set                 ! Initialize some general variables
!     ==============

!-----------------------------------------------------------------------
! Pre-pegs-call-initialization
!-----------------------------------------------------------------------

      nmed=1
      medarr(1)='AL                      '

      do j=1,nmed
        do i=1,24
          media(i,j)=medarr(j)(i:i)
        end do
      end do

!     ==========
      call pegs5
!     ==========

      stop
      end
!-------------------------last line of main code------------------------