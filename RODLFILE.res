        ??  ??                  ?g  0   ??
 R O D L F I L E                     <?xml version="1.0" encoding="utf-8"?>
<Library Name="VReportServiceLibrary" UID="{B1FD7926-900D-4411-8851-9C8975CD61D6}" Version="3.0">
<Services>
<Service Name="ReportService" UID="{39BDF332-F8D8-4A78-9402-2C289F0A9507}">
<Interfaces>
<Interface Name="Default" UID="{00B25D10-188F-4200-B503-46A1BE890994}">
<Operations>
<Operation Name="GetVersion" UID="{9F67186F-0E80-417B-A712-134421045DCC}">
<Parameters>
<Parameter Name="Result" DataType="WideString" Flag="Result">
</Parameter>
</Parameters>
</Operation>
<Operation Name="Login" UID="{A41CBA44-4196-4BEF-8455-3462A269E287}">
<Parameters>
<Parameter Name="Result" DataType="roReportLoginResult" Flag="Result">
</Parameter>
<Parameter Name="ID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="Password" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="LoginSSO" UID="{DB1DCD06-8B5D-424D-A067-16198AE45E79}">
<Parameters>
<Parameter Name="Result" DataType="roReportLoginResult" Flag="Result">
</Parameter>
<Parameter Name="ID" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Logout" UID="{BF986564-12A6-4A28-9C9E-B4AC1FC15151}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CheckSamlAuthentication" UID="{342CD66B-547A-48B4-AAF8-D9992D56A36D}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="UserCloudID" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetSamlIdpName" UID="{2ED4232A-3793-4CDC-8A2A-D5ADF967BAA8}">
<Parameters>
<Parameter Name="Result" DataType="WideString" Flag="Result">
</Parameter>
<Parameter Name="UserCloudId" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CheckCloudUserId" UID="{24E1D61C-2119-423C-84F3-302A5585023C}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="UserCloudId" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="Echo" UID="{7FA54ACE-46D4-4623-9B90-79BAFE848B27}">
<Parameters>
<Parameter Name="Result" DataType="WideString" Flag="Result">
</Parameter>
<Parameter Name="AValue" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="CheckSessionID" UID="{D17D70BD-4B70-4B61-AF1E-63D0B7E7A2F7}">
<Parameters>
<Parameter Name="Result" DataType="Boolean" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetReportFromListData" UID="{71AAF393-D397-475E-A015-AB51BE0CE06A}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ReportFromListData" DataType="Binary" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetReport" UID="{A7E0843D-93D7-4AFB-8B13-084DCCB56B8A}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="RfId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ReportData" DataType="Binary" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetNewInstallationVCloudReportManager" UID="{2E9D8CB0-0389-4BE4-9D66-33F4B0B80B98}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="AppData" DataType="Binary" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="GetNewInstallationVCloudReportManagerVersion" UID="{A291240C-72EE-4AED-99B7-756C620FB3F0}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="Version" DataType="WideString" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="SaveReport" UID="{243418C1-3305-4D2C-9843-2ACD9CE670D5}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ReportRecord" DataType="roReportRec" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="DeleteReport" UID="{DD9C0268-05A3-45AC-B7BC-9ADEAF967F26}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ReportRecord" DataType="roReportRec" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RefreshSession" UID="{F1454EB3-3E7C-4E88-A6D4-2C09292D8933}">
<Parameters>
<Parameter Name="Result" DataType="roReportResult" Flag="Result">
</Parameter>
<Parameter Name="SessionId" DataType="WideString" Flag="In" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportCompData" UID="{446F03AA-F5DA-409C-B491-50CB6B1F6136}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetSubReportDeptData" UID="{165FE806-6561-46C0-A11B-6D722E027FC1}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CompId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetSubReportUserData" UID="{900E3379-EA8B-4867-89DA-A74CAF820905}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CompId" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportIntFolderData" UID="{74101991-E76A-4579-8955-9935E9CDBD89}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportMessagesData" UID="{51668398-C355-4BC2-A221-E808F6032AA8}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportCitUpdatesData" UID="{B3F1CB85-8BA4-4A30-960D-A9D425CDDA28}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportReviewCitationsFlagData" UID="{69696343-46E8-46F6-B13E-5BB605961304}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportReviewInterviewsFlagData" UID="{F1EF5CAF-04FE-4D24-8468-634BB48531F0}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportReviewMessagesFlagData" UID="{49070866-DF6D-4B82-8BE6-6D581C9F42B7}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportReviewShedulesFlagData" UID="{56C6B144-C937-497F-BCA3-2A7F97A6CD6E}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportResearchCitationsData" UID="{CD09B8A6-FE2D-4B18-8CE0-64DEC57B3E8B}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportResearchCitationsMemosData" UID="{E9713D73-48B6-4425-9318-E07AF7C935A2}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CitIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportResearchCitationsBusactsData" UID="{D18E962D-011B-4C8D-809D-B4756D3782C0}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CitIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportResearchCitationsSchedulesData" UID="{7E22090A-537A-4EBD-A32E-A02F6D6728B5}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CitIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportInterviewsData" UID="{68694C9F-93DC-43B9-B565-76A5014127CC}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportCitationsData" UID="{5EA3B3AB-1D8C-410D-B95A-D04A33AF6288}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="IntAutoIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportDefinedFieldsData" UID="{E0B211B9-2910-4B40-A52A-2FB6B3771647}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="RecordIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleSchedulesData" UID="{AE807010-2921-4593-A653-3AEFAC34936F}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleCitationData" UID="{7FFD3015-B23E-4322-96B6-C8DEC0E67AD8}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleInterviewsData" UID="{A5152E3B-2078-446C-844F-55ABC85A92AB}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="IntSchedIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleDefinesFieldsData" UID="{8999D900-CF83-410F-A80B-C587969CCCB3}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="RecordIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleCountriesData" UID="{792C20F2-E536-42FC-AEF9-CD198843347A}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleCitTextData" UID="{CE8AA3E9-75B2-4467-A98B-6DAC1CDDC37E}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CitIndex" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleRelatedItemsData" UID="{8B1B826B-A076-4C27-8C51-B58E854BD927}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="RelatedSchedIndexPar" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsData" UID="{524C98B3-900A-4025-8C6D-A5F8B3B9F3E1}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="TopCount" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="MasterIndexesStrList" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsAuthorizersData" UID="{547C780E-5CB6-4F62-98A9-3DB63E45FE80}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CRIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsSchedulePendingData" UID="{D00912EA-4CB5-45A3-8A36-C092C5B9A317}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CRIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsRequestComments" UID="{DABD8520-BC66-4613-8374-7AFA54724990}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CRIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsScheduleCountriesData" UID="{903A6BB7-ACBE-401B-8541-945D39DAB3D2}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="CRIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsScheduleCitationsData" UID="{1BA6DD1C-450C-4C07-BD42-FB901B394E64}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsScheduleData" UID="{94CB0098-2B64-4840-8D2D-592507B41198}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsUDFsData" UID="{DE802279-84D6-4A18-BBC4-72530B2E1B0E}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SchedIndex" DataType="Integer" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportChangeRequestsRelatedItemsData" UID="{5361E5D6-A555-4488-9E21-68913D2CC68C}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="RelatedSchedIndexPar" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="SortOrder" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportInterviewUDFsData" UID="{5E297C9A-3EA2-40AE-B75F-779FE962B70F}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
<Operation Name="RDA_GetReportScheduleUDFsData" UID="{268F1A93-8865-4663-B07E-3115119FBE52}">
<Parameters>
<Parameter Name="Result" DataType="Binary" Flag="Result">
</Parameter>
<Parameter Name="SessionID" DataType="WideString" Flag="In" >
</Parameter>
<Parameter Name="ResultReport" DataType="roReportResult" Flag="Out" >
</Parameter>
</Parameters>
</Operation>
</Operations>
</Interface>
</Interfaces>
</Service>
</Services>
<Structs>
<Struct Name="roReportResult" UID="{C36E9C65-63EA-43D0-A5E5-0DB9DBDBED4D}" AutoCreateParams="1">
<Elements>
<Element Name="ResultCode" DataType="Integer">
</Element>
<Element Name="ResultMsg" DataType="WideString">
</Element>
<Element Name="PrimIndex" DataType="Int64">
</Element>
<Element Name="SecInt" DataType="Int64">
</Element>
<Element Name="SessionID" DataType="WideString">
</Element>
</Elements>
</Struct>
<Struct Name="roReportRec" UID="{5E4F35D3-C454-4FF5-9D9A-D2887C5AED79}" AutoCreateParams="1">
<Elements>
<Element Name="RepAutoIndex" DataType="Integer">
</Element>
<Element Name="RepRfId" DataType="WideString">
</Element>
<Element Name="RepName" DataType="WideString">
</Element>
<Element Name="RepDesc" DataType="WideString">
</Element>
<Element Name="RepTemplateData" DataType="Binary">
</Element>
<Element Name="RepOptionsData" DataType="Binary">
</Element>
<Element Name="RepUserIndex" DataType="Integer">
</Element>
</Elements>
</Struct>
<Struct Name="roReportSessionFunctionalityRecord" UID="{DFF59A56-38DC-48A5-9B0F-43B2A58E891D}" AutoCreateParams="1">
<Elements>
<Element Name="SgIndex" DataType="Integer">
</Element>
<Element Name="FullAccess" DataType="Boolean">
</Element>
<Element Name="IsAdmin" DataType="Boolean">
</Element>
<Element Name="FunctionList" DataType="roReportIndexList">
</Element>
</Elements>
</Struct>
<Struct Name="roReportLoginResult" UID="{20D65562-0F64-491B-9A1D-7F843D57A259}" AutoCreateParams="1" Ancestor="roReportResult">
<Elements>
<Element Name="ReportSessionFunctionality" DataType="roReportSessionFunctionalityRecord">
</Element>
</Elements>
</Struct>
</Structs>
<Enums>
</Enums>
<Arrays>
<Array Name="roReportIndexList" UID="{3E30960D-A001-4F7D-B145-937773DE2334}">
<ElementType DataType="Integer" />
</Array>
</Arrays>
</Library>
