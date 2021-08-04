###############################################################
#  Define type of binary, used packages, project defines and  #
#  include paths if needed                                    #
###############################################################

ISPACKAGE=FALSE
VCLPACKAGES=
DEFINES=$(DBVER)
INCLUDEPATH=$(RO)\Source;$(DA)\Source
UNITINCLUDEPATH=..\Common;..\VersatileDataServer;..\VersatileCloudService;$(LOCALCOMP)\ZeiCommon;$(LOCALCOMP)\ZeiCommon\Dec2009;$(LOCALCOMP)\ZeiCommon\Cipher;$(LOCALCOMP)\ZeiCommon\DCPcrypt;$(LOCALCOMP)\ZeiCommon\DCPcrypt\Ciphers;$(LOCALCOMP)\ZeiCommon\DCPcrypt\Hashes;$(SvCom)\RunTime;$(SvCom)\Experts;$(SvCom)\DesignTime;$(RO)\Source;$(RO)\Source\RODEC;$(RO)\Source\CodeGen;$(RO)\Source\ZLib;$(DA)\Source;$(DA)\Source\Server;$(DA)\Source\Drivers;$(SDAC)\source;$(ODAC)\source;$(SDACLIB);$(ODACLib)

###############################################################
!include ..\local_rules.inc
!include ..\make_settings.inc
###############################################################

PROJECTS=ZasioVReportService.res ZasioVReportService.exe
default:: $(PROJECTS)

###############################################################

!if $(ARCHITECTURE)==X32
ZasioVReportService.res:: res\ZasioVReportService.rc
   $(INCBLD)
   $(RCC) -foZasioVReportService.res
!endif

!if $(ARCHITECTURE)==X64
ZasioVReportService.res:: res\ZasioVReportServicex64.rc
   $(INCBLD)
   $(RCC) -foZasioVReportService.res
!endif


ZasioVReportService.exe:: ZasioVReportService.dpr
   $(BACKUPDOF)
   $(BACKUPCFG)
   $(MESSAGE)
   $(DCC)
   $(CHECKIN)
   $(RESTOREDOF)
   $(RESTORECFG)

###############################################################

