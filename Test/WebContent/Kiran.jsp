<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://myfaces.apache.org/trinidad" prefix="tr"%>
<%@ taglib uri="http://myfaces.apache.org/trinidad/html" prefix="trh"%>
<f:view>
 <trh:html id="h1">
  <trh:head title="home" id="h2">
  <!--UI Build and Deployment Label : DEL_WPX0311_QP2_UI_02_14032013_00 Updated on 13/03/2013-->
   <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
   <link type="text/css" rel="stylesheet"
         href="<%=request.getContextPath()%>/css/style.css"></link>
    <script language="JavaScript" type="text/javascript"
           src="<%=request.getContextPath()%>/javascript/dialog_box.js">
   </script>
   <script language="JavaScript" type="text/javascript"
           src="<%=request.getContextPath()%>/javascript/showCrnDialog.js">
   </script>
   <script language="JavaScript" type="text/javascript"
           src="<%=request.getContextPath()%>/javascript/popupLauncher.js"> 
      </script> 
    <script>
    function popupwindow(FileName)
    {
        var w = screen.width;
        var h = screen.height;
        var left = (screen.width/2)-(w/2);
        var top = (screen.height/2)-(h/2);
        window.open(FileName,'QSystem_new','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left) 
    }
    
    function availabilityFunction(){
    if(null != document.getElementById("contact_management_frm:availability:_0") && 
        null != document.getElementById("contact_management_frm:availability:_1")){
            if(document.getElementById("contact_management_frm:availability:_0").checked){
                document.getElementById("contact_management_frm:availability:_0").disabled = true;
                document.getElementById("contact_management_frm:availability:_1").disabled = false;
            }
            if(document.getElementById("contact_management_frm:availability:_1").checked){
                document.getElementById("contact_management_frm:availability:_1").disabled = true;
                document.getElementById("contact_management_frm:availability:_0").disabled = false;
            }
        }
    }
    </script>
<script language="JavaScript" type="text/javascript">
            function EnableSubmit(){
                    document.getElementById('contact_management_frm:cqbtn').disabled = false; 
            }
               
            function DisableSubmit() {
                    document.getElementById('contact_management_frm:cqbtn').disabled = true;
            }
   </script> 
  </trh:head>
   <trh:body id="b1" 
            onload="availabilityFunction();initializeInvoiceButtonId('contact_management_frm:btn_Invid');showPopupForCE('#{contactsmenuxoserve.showPopup}' ,'#{contactsmenuxoserve.titleMessageforPopup}','#{contactsmenuxoserve.noOfBusinessDaysLeft}','#{contactsmenuxoserve.ceType}','#{searchcontact.search.errorMessage}','#{contactsmenuxoserve.svOverdue}');EnableSubmit();">
   <h:form id="contact_management_frm"  onkeypress="if (event.keyCode == 13) { document.getElementById('contact_management_frm:search').click(); return false;}">
   <h:inputHidden id="txt_Initialize" value="#{contactsmenuxoserve.initialize}"/>
    <div id="content">
     <f:subview id="qsystem_header">
      <jsp:include page="/common/qsystem_header.jsp"/>
     </f:subview>
     <div id="body">
      <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                       borderWidth="0">
       <trh:rowLayout valign="top">
        <trh:cellFormat inlineStyle="padding-bottom:5px; padding-top:5px">
         <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0">
          <trh:rowLayout>
           <trh:cellFormat width="35%" inlineStyle="padding-right:5px;">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0" inlineStyle="border:1px solid #999">
          <trh:rowLayout valign="top">
           <trh:cellFormat width="100%" height="298" inlineStyle="background-color:#d6ecee" valign="top">
           <trh:tableLayout cellPadding="0" cellSpacing="0" borderWidth="0"
                             width="100%">
             <trh:rowLayout>
              <trh:cellFormat styleClass="table_heading"
                              inlineStyle="text-align:center !important">Contact
                                                                         Generator</trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout>
              <trh:cellFormat inlineStyle="padding:10px;">
               <trh:tableLayout width="100%" borderWidth="0" cellSpacing="0"
                                cellPadding="0" inlineStyle="background:#fff">
                <trh:rowLayout>
                 <trh:cellFormat inlineStyle="padding-left:10px"
                                 valign="middle">
                  <img src="<%=request.getContextPath()%>/images/DataAmendService.jpg" width="30"
                       height="31" align="absmiddle" alt=""/>
                  &nbsp;&nbsp;Data Amend Service
                 </trh:cellFormat>
                 <trh:cellFormat height="40">
                <h:selectOneMenu style="width:100px;margin-left:5px" 
                                 value="#{contactManagement.contactType}" 
                                 valueChangeListener="#{contactManagement.navigate}" 
                                 onchange="submit()">
                    <f:selectItems value="#{contactsmenuxoserve.dataAmendServiceSelectItemList}" />
                </h:selectOneMenu>
                 </trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout rendered="#{contactsmenuxoserve.renderInvoicingServices}">
                 <trh:cellFormat inlineStyle="padding-left:10px" valign="middle">
                  <img src="<%=request.getContextPath()%>/images/InvoicingService.jpg" width="30"
                       height="31" align="absmiddle" alt=""/>
                  &nbsp;&nbsp;Invoicing Service
                 </trh:cellFormat>
                 <trh:cellFormat height="40">
                <h:selectOneMenu style="width:100px;margin-left:5px"  
                                 value="#{contactManagement.contactTypeInvoice}" 
                                 valueChangeListener="#{contactManagement.navigateGic}" 
                                 onchange="submit()">
                <f:selectItems value="#{contactsmenuxoserve.invoicingServiceSelectItemList}" />
                </h:selectOneMenu>
                 </trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                </trh:rowLayout>
                
                <trh:rowLayout rendered="#{contactsmenuxoserve.renderFileUploadOption}">
                 <trh:cellFormat inlineStyle="padding-left:10px" valign="middle">
                  <img src="<%=request.getContextPath()%>/images/BulkContactCreation.jpg" width="30"
                       height="31" align="absmiddle" alt=""/>
                  &nbsp;&nbsp;File Upload
                 </trh:cellFormat>
                 <trh:cellFormat height="40" inlineStyle="padding-top:6px" valign="middle">
                 <tr:commandButton text="#{str['button.uploadfile']}" styleClass= "intbtn" 
                    inlineStyle="width:110px;padding-top:2px; border-collapse:collapse; border:1px solid #000; height:22px; background:#f9f9f9; cursor:pointer" 
                    action="fileUploadPage" immediate="true">
                    <f:setPropertyActionListener target="#{xoserveSessionBean.fileAction}" value="File Upload"/>                
                </tr:commandButton>
                 </trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                 <trh:cellFormat inlineStyle="background:#d6ecee;">&nbsp;</trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout binding="#{contactsmenuxoserve.rowBulkUploadBlock}">
                 <trh:cellFormat inlineStyle="padding-left:10px" valign="middle">
                  <img src="<%=request.getContextPath()%>/images/DownloadReports.jpg" width="30"
                       height="31" align="absmiddle" alt=""/>
                  &nbsp;&nbsp;File Download
                 </trh:cellFormat>
                 <trh:cellFormat height="40" inlineStyle="padding-top:6px" valign="middle">
                 <tr:commandButton text="#{str['button.downloadfile']}" styleClass= "intbtn" 
                    inlineStyle="width:110px;padding-top:2px; border-collapse:collapse; border:1px solid #000; height:22px; background:#f9f9f9; cursor:pointer" 
                    action="fileDownloadPage" immediate="true" rendered="#{!contactsmenuxoserve.userShipper}">
                    <f:setPropertyActionListener target="#{xoserveSessionBean.fileAction}" value="File Download"/>                
                </tr:commandButton>
                <tr:commandButton text="#{str['button.downloadfile']}" styleClass= "intbtn" 
                    inlineStyle="width:110px;padding-top:2px; border-collapse:collapse; border:1px solid #000; height:22px; background:#f9f9f9; cursor:pointer" 
                    action="EXTERNAL_USER_FILE_DOWNLOAD" immediate="true" rendered="#{contactsmenuxoserve.userShipper}">
                </tr:commandButton>
                 </trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout>
                 <trh:cellFormat height="9" columnSpan="2" inlineStyle="background:#d6ecee;"> 
                 </trh:cellFormat>
                </trh:rowLayout>
               </trh:tableLayout>
              </trh:cellFormat>
             </trh:rowLayout>
            </trh:tableLayout>
           </trh:cellFormat>
           </trh:rowLayout>
           </trh:tableLayout>
           </trh:cellFormat>
           <trh:cellFormat width="25%" inlineStyle="padding-right:5px;">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0">
          <trh:rowLayout valign="top">
           <trh:cellFormat width="100%" height="300" inlineStyle="background-color:#d6ecee" valign="top">
           <trh:tableLayout cellPadding="0" cellSpacing="0" borderWidth="0" width="100%"
            inlineStyle="border:1px solid #999">
             <trh:rowLayout>
              <trh:cellFormat styleClass="table_heading"
                              inlineStyle="text-align:center !important">My Tasks</trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout>
              <trh:cellFormat>
              <div style="position:inherit; height:273px; padding-left:10px;  width:96%;overflow-y:scroll; overflow-x:hidden; ">
              <div style="height:5px;position:inherit; width:100%; "></div>
                <h:dataTable id="dt1" value="#{contactsmenuxoserve.contactsMenu}" style="line-height:20px;"  var="item" border="0" cellpadding="0" cellspacing="0" first="0" width="100%" dir="LTR" frame="hsides" >
                        <h:column>
                        <h:outputText value="#{item.priorityFlag}" styleClass="red"/> 
                        <h:commandLink value="#{item.contactLabel}" styleClass="textlink"   action="#{contactsmenuxoserve.setSessionData}"  immediate="true">
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.contactType}" value="#{item.contactType}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.crnNumber}" value="#{item.crnNumber}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.statusDesc}" value="#{item.statusDesc}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.ceType}" value="#{item.ceType}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.ceId}" value="#{item.ceId}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.prevCrnNum}" value="#{item.prevCrnNum}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.taskType}" value="#{item.taskType}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.workItemStatus}" value="#{item.workItemStatus}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.navigationString}" value="#{item.navigationString}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.contactRetrievedtable}" value="#{item.retrievedTable}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.stepId}" value="#{item.stepId}"/>
                        <f:setPropertyActionListener target="#{contactsmenuxoserve.caDelegatedAuthView}" value="#{item.caDelegatedAuthView}"/>
                         </h:commandLink> 
                        </h:column>
                        </h:dataTable>
                  </div>
                 <h:commandButton  id="btn_nav" immediate="true" value="cancel"
                    action="#{contactsmenuxoserve.navigateFromContactManagement}" 
                    style="display:none;"/>
              </trh:cellFormat>
             </trh:rowLayout>
            </trh:tableLayout>
           </trh:cellFormat>
           </trh:rowLayout>
           </trh:tableLayout>
           </trh:cellFormat>
           <trh:cellFormat width="23%" inlineStyle="padding-right:5px;">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0">
          <trh:rowLayout valign="top">
           <trh:cellFormat width="100%" height="300" inlineStyle="background-color:#d6ecee" valign="top">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                             borderWidth="0" inlineStyle="border:1px solid #999">
             <trh:rowLayout>
              <trh:cellFormat styleClass="table_heading"
                             inlineStyle="text-align:center !important">Recent
                                                                   Activity</trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout>
              <trh:cellFormat>
               <div style="position:inherit; height:273px; width:97%; padding-left:5px; overflow:auto; overflow-x:hidden; ">
                <div style="height:5px;position:inherit; width:100%;"></div>
                  <h:dataTable var="recentActivity"
                               value="#{contactsmenuxoserve.recentActivityList}" style="line-height:20px;">
                   <h:column>
                    <h:outputText value="#{recentActivity.contactTypeCode}-#{recentActivity.contactReferenceNumber}  #{recentActivity.description}"/>
                    <trh:cellFormat width="2%">&nbsp;</trh:cellFormat>
                   </h:column>
                  </h:dataTable>
                 
               </div>
              </trh:cellFormat>
             </trh:rowLayout>
            </trh:tableLayout>
           </trh:cellFormat>
           </trh:rowLayout>
           </trh:tableLayout>
           </trh:cellFormat>
           <trh:cellFormat width="17%" rowSpan="3" valign="middle">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0" inlineStyle="border:1px solid #999">
            <trh:rowLayout>
             <trh:cellFormat width="100%" height="300" inlineStyle="background-color:#d6ecee" valign="top">
           <trh:tableLayout cellPadding="0" cellSpacing="0" borderWidth="0" width="100%" inlineStyle="background-color:#d6ecee">
             <trh:rowLayout halign="center" valign="middle">
              <trh:cellFormat styleClass="table_heading" 
                              inlineStyle="text-align:center !important">Contact
                                                                   Support</trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout>
              <trh:cellFormat halign="center" valign="middle"  >
               <trh:tableLayout cellPadding="0" cellSpacing="0" borderWidth="0" width="100%"  >
              <trh:rowLayout> 
               <trh:cellFormat  height="7"> </trh:cellFormat>
            </trh:rowLayout>
             
             <trh:rowLayout>
             <trh:cellFormat  halign="center" valign="middle" height="40">
              <tr:commandButton styleClass="intbtn" text="#{str['button.contactUs']}"
                    inlineStyle="width:125px; border-collapse:collapse; border:1px solid #000; height:30px; background:#f9f9f9;  cursor:pointer" 
				    onclick="Javascript:popupwindow('http://www.xoserve.com/wp-content/uploads/CM-Contact-Us-Guide.pdf'); return false;"/>
               </trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout>
             <trh:cellFormat   halign="center" valign="middle"  height="40" >
               <tr:commandButton styleClass="intbtn" text="#{str['button.contactQueues']}" id="cqbtn" onclick="return DisableSubmit()"
                    inlineStyle="width:125px; border-collapse:collapse; border:1px solid #000; height:30px; background:#f9f9f9;  cursor:pointer"  action="#{workAllocQueueNavigationManagedBean.Intitlize}"  immediate="true"/>
             </trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout rendered="#{contactsmenuxoserve.renderContactsExplainedButton}">
             <trh:cellFormat   halign="center" valign="middle"  height="40">
               <tr:commandButton styleClass="intbtn" text="#{str['button.contactExplained']}" 
                    inlineStyle="width:125px; border-collapse:collapse; border:1px solid #000; height:30px; background:#f9f9f9;  cursor:pointer" 
					onclick="Javascript:popupwindow('http://www.xoserve.com/wp-content/uploads/CM-Contacts-Explained.pdf'); return false;"/>
                </trh:cellFormat>
              </trh:rowLayout>
               <trh:rowLayout rendered="#{contactsmenuxoserve.renderBamButton}">
               <trh:cellFormat   halign="center" valign="middle"  height="40">
               <tr:commandButton styleClass="intbtn" text="#{str['button.BAM']}"
                    inlineStyle="width:125px; border-collapse:collapse; border:1px solid #000; height:30px; background:#f9f9f9;  cursor:pointer" 
					immediate="true" onclick="popupwindow('/OracleBAM/16734/reportserver/default.jsp?Event=viewReport&ReportDef=8&Buttons=True');"  />

               </trh:cellFormat>
             </trh:rowLayout>
             <trh:rowLayout rendered="#{contactsmenuxoserve.renderAdminButton}">
              <trh:cellFormat   halign="center" valign="middle"  height="40">
                <tr:commandButton styleClass="intbtn" text="Controls"  action="#{adminControlsManagedBean.loadAdminControls}"
                    inlineStyle="width:125px; border-collapse:collapse; border:1px solid #000; height:30px; background:#f9f9f9;  cursor:pointer" 
					immediate="true"/>
               </trh:cellFormat>
               </trh:rowLayout>
                <!-- commented to disable the Filter Failure Invoices 
           <trh:rowLayout rendered="#{contactsmenuxoserve.renderInvoiceButton}">
                <trh:cellFormat  halign="center" valign="middle"  height="40">
                    <h:inputHidden value="#{contactsmenuxoserve.invChoice}"  id="invChoice" />
                    <h:inputHidden value="#{contactsmenuxoserve.userTyp}"  id="userTyp" />
                    <input type="button" value="Invoices" id="cb1"  tabindex="27"  class="intbtn"
                            style=" width:125px;  height:30px; " 
                               onclick="showInvoicediaLog('invChoice','contact_management_frm')"/>
                    <h:commandButton value="Submit" id="btn_Invid"  action="#{contactsmenuxoserve.loadInvoiceDetails}"  style="display:none;"/>    
                </trh:cellFormat>
            </trh:rowLayout> 
                 commented to disable the Filter Failure Invoices -->
            </trh:tableLayout>
              </trh:cellFormat>
             </trh:rowLayout>
            </trh:tableLayout>
            </trh:cellFormat>
            </trh:rowLayout>
            <trh:rowLayout>
            <trh:cellFormat height="5" inlineStyle="background-color:#d6ecee"></trh:cellFormat></trh:rowLayout>
            <trh:rowLayout valign="top">
            <trh:cellFormat height="100" inlineStyle="background-color:#d6ecee">
            <trh:tableLayout binding="#{contactsmenuxoserve.tabAvailability}" cellPadding="0" cellSpacing="0" borderWidth="0" width="100%">
        <trh:rowLayout>
         <trh:cellFormat styleClass="table_heading"
                         inlineStyle="text-align:center !important">Availability</trh:cellFormat>
        </trh:rowLayout>
        <trh:rowLayout>
         <trh:cellFormat inlineStyle="padding-top:10px" styleClass="PLeft">
         
        <tr:selectOneRadio valueChangeListener="#{contactsmenuxoserve.toUpdateAvailability}" id="availability" styleClass="avail_radio" immediate="true" onclick="submit()" value="#{contactsmenuxoserve.userAvailability}">
            <f:selectItem itemLabel="Available" itemValue="IN" id="avialable" />
            <f:selectItem itemLabel="Not Available" itemValue="OUT" id="notavialable" />
        </tr:selectOneRadio>
         </trh:cellFormat>
        </trh:rowLayout>
       </trh:tableLayout>
           </trh:cellFormat>
           </trh:rowLayout>
           </trh:tableLayout>
           </trh:cellFormat>
          </trh:rowLayout>
          <trh:rowLayout>
           <trh:cellFormat columnSpan="3" height="5"></trh:cellFormat>
          </trh:rowLayout>
          <trh:rowLayout valign="top">
           <trh:cellFormat columnSpan="3" inlineStyle="padding-right:5px">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                          borderWidth="0" inlineStyle="border:1px solid #999">
          <trh:rowLayout valign="top">
           <trh:cellFormat width="100%" height="100" inlineStyle="background-color:#d6ecee" valign="top">
           <trh:tableLayout cellPadding="0" cellSpacing="0" width="100%"
                             borderWidth="0" >
             <trh:rowLayout>
              <trh:cellFormat styleClass="table_heading"
                             inlineStyle="text-align:center !important">Search Options</trh:cellFormat>
             </trh:rowLayout>
             
             <trh:rowLayout>
              <trh:cellFormat columnSpan="4" height="6"></trh:cellFormat>
             </trh:rowLayout>
             
             <trh:rowLayout>
              <trh:cellFormat columnSpan="4"  styleClass="PLeft">
               <trh:tableLayout width="100%" borderWidth="0" cellSpacing="0"
                                cellPadding="0">
                <trh:rowLayout>
                    <trh:cellFormat width="22%"></trh:cellFormat>
                    <trh:cellFormat width="20%"></trh:cellFormat>
                    <trh:cellFormat width="24%"></trh:cellFormat>
                    <trh:cellFormat width="22%"></trh:cellFormat>
                    <trh:cellFormat width="12%"></trh:cellFormat>
                </trh:rowLayout>
                 <trh:rowLayout rendered="#{contactsmenuxoserve.stakeHolderMRA}">
                    <trh:cellFormat columnSpan="6" rendered="#{contactsmenuxoserve.renderFileSearchLink}">
                        <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderFileSearchLink}"/>
                             <tr:spacer height="10" width="7" rendered="#{contactsmenuxoserve.renderFileSearchLink}"/> 
                        <tr:commandLink id="file_search_Mra" text="File Search" action="#{fileSearchManagedBean.loadFileSearch}" immediate="true"  styleClass="textlink"
                                  blocking="true" partialSubmit="true"/>
                    </trh:cellFormat>
                 </trh:rowLayout>
                <trh:rowLayout rendered="#{!contactsmenuxoserve.stakeHolderMRA}">
                 <trh:cellFormat width="22%" valign="top">
                  <h:outputLabel value="Contact Reference Number"/>
                 </trh:cellFormat>
                 <trh:cellFormat width="20%" halign="left" valign="top">
                  <h:inputText id="searchCrn" maxlength="9"
                               value="#{searchcontact.search.contactReferenceNumber}" validator="#{searchcontact.validateCRNNumber}" binding="#{searchcontact.search.inputText}"/>
                 </trh:cellFormat>
                 <trh:cellFormat width="24%" halign="start" valign="top">
                    <tr:commandButton styleClass="intbtn" text="Find" id="search"
                    inlineStyle="width:97px; border-collapse:collapse; border:1px solid #000; background:#f9f9f9;  cursor:pointer"  action="#{searchcontact.showSearchedCRNDetails}"  >
                    <f:setPropertyActionListener target="#{xoserveSessionBean.searchView}" value="true"/>
                    <f:setPropertyActionListener target="#{xoserveSessionBean.searchResultPage}" value="XOSERVE_CONTACTS_HOME"/>
                    </tr:commandButton>
                </trh:cellFormat>
                 <trh:cellFormat width="22%" rendered="#{contactsmenuxoserve.renderAdvancedSearchLink}">
                 <tr:image source="/images/Search.jpg" styleClass="text_center"/>
                 <tr:spacer height="10" width="7" /> 
                 <tr:commandLink id="advanced_search" text="Advanced Search" action="#{searchManagedBean.loadAdvanceSearch}" 
                              styleClass="textlink" 
                              immediate="true" partialSubmit="true" blocking="true">
                   <f:setPropertyActionListener target="#{xoserveSessionBean.searchView}" value="true"/>
                  </tr:commandLink> 
                           
                 </trh:cellFormat>
                 <trh:cellFormat width="12%" rendered="#{!contactsmenuxoserve.renderFileSearchLink}">
                 &nbsp;
                 </trh:cellFormat>
                 <trh:cellFormat width="12%" rendered="#{contactsmenuxoserve.renderFileSearchLink}">
                <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderFileSearchLink}"/>
                             <tr:spacer height="10" width="7" rendered="#{contactsmenuxoserve.renderFileSearchLink}"/> 
                <tr:commandLink id="file_search" text="File Search" action="#{fileSearchManagedBean.loadFileSearch}" immediate="true"  styleClass="textlink"
                                  blocking="true" partialSubmit="true"/>
                 </trh:cellFormat>
                 <trh:cellFormat width="12%" rendered="#{!contactsmenuxoserve.renderFileSearchLink}">
                 &nbsp;
                 </trh:cellFormat>
                </trh:rowLayout>
                <trh:rowLayout>
                 <trh:cellFormat columnSpan="6">
                 <h:message for="searchCrn" style="color:red"/> 
                 </trh:cellFormat>
                </trh:rowLayout>
               </trh:tableLayout>
              </trh:cellFormat>
             </trh:rowLayout>

             <trh:rowLayout>
              <trh:cellFormat columnSpan="4" height="5"></trh:cellFormat>
             </trh:rowLayout>
             
             <trh:rowLayout rendered="#{xoserveSessionBean.stakeHolderType == 'UIP'}">
              <trh:cellFormat columnSpan="4" height="20"> 
                &nbsp;
              </trh:cellFormat>
             </trh:rowLayout>
             
            <trh:rowLayout rendered="#{xoserveSessionBean.stakeHolderType != 'UIP'}">
                <trh:cellFormat columnSpan="4"  styleClass="PLeft">
                    <trh:tableLayout width="100%" borderWidth="0" cellSpacing="0"
                                        cellPadding="0">
                        <trh:rowLayout>
                            <trh:cellFormat width="22%" rendered="#{contactsmenuxoserve.renderDataClarificationLink}">
                                <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderDataClarificationLink}"/>
                             <tr:spacer height="10" width="7" rendered="#{contactsmenuxoserve.renderDataClarificationLink}"/> 
                             <tr:commandLink text="Data Clarification" action="#{searchManagedBean.loadDCSearch}" blocking="true"
                                               partialSubmit="true" immediate="true" rendered="#{contactsmenuxoserve.renderDataClarificationLink}"
                                               styleClass="textlink"/>
                               <%--<tr:spacer height="10" width="35" rendered="#{contactsmenuxoserve.renderDataClarificationLink}"/>--%>
                             </trh:cellFormat> 

                            <trh:cellFormat width="22%" rendered="#{contactsmenuxoserve.renderSiteVisitLink}">
                                <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderSiteVisitLink}"/>
                                <tr:spacer height="10" width="7" rendered="#{contactsmenuxoserve.renderSiteVisitLink}"/> 
                                <tr:commandLink text="Site Visit" action="#{searchManagedBean.loadSVSearch}" blocking="true"
                                        styleClass="textlink"   partialSubmit="true" immediate="true" rendered="#{contactsmenuxoserve.renderSiteVisitLink}"/>
                            </trh:cellFormat>
                            
                             <trh:cellFormat width="22%" rendered="#{contactsmenuxoserve.renderConfigChangeLink}">
                             <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderConfigChangeLink}"/>
                                 <tr:spacer width="7" height="10" rendered="#{contactsmenuxoserve.renderConfigChangeLink}"/>
                                 <tr:commandLink text="Configuration Change" action="#{searchManagedBean.loadCCSearch}" blocking="true" styleClass="textlink"
                                                   partialSubmit="true" immediate="true" rendered="#{contactsmenuxoserve.renderConfigChangeLink}"/>
                              </trh:cellFormat>  
                              
                              <trh:cellFormat width="22%" rendered="#{contactsmenuxoserve.renderArchiveLink}">
                               <tr:image source="/images/Search.jpg" styleClass="text_center" rendered="#{contactsmenuxoserve.renderArchiveLink}"/>
                                <tr:spacer width="7" height="10" rendered="#{contactsmenuxoserve.renderArchiveLink}"/>
                                <tr:commandLink text="Archive" action="#{archiveSearchManagedBean.loadArchiveSearch}" blocking="true" styleClass="textlink" 
                                partialSubmit="true" immediate="true" rendered="#{contactsmenuxoserve.renderArchiveLink}"/>
                             <%--<tr:spacer width="35" height="10" rendered="#{contactsmenuxoserve.renderConfigChangeLink}"/>--%>
                              </trh:cellFormat>
                              <trh:cellFormat width="22%" rendered="#{!contactsmenuxoserve.renderDataClarificationLink}">
                              </trh:cellFormat>
                              <trh:cellFormat width="22%" rendered="#{!contactsmenuxoserve.renderSiteVisitLink}">
                              </trh:cellFormat>
                              <trh:cellFormat width="22%" rendered="#{!contactsmenuxoserve.renderConfigChangeLink}">
                              </trh:cellFormat>
                              <trh:cellFormat width="22%" rendered="#{!contactsmenuxoserve.renderArchiveLink}">
                              </trh:cellFormat>
                              <trh:cellFormat width="12%">
                              </trh:cellFormat>
                        </trh:rowLayout>
                                
                    </trh:tableLayout>
                    </trh:cellFormat>
                    </trh:rowLayout>
                    </trh:tableLayout>
           </trh:cellFormat>
           </trh:rowLayout>
           </trh:tableLayout>
           </trh:cellFormat>
          </trh:rowLayout>
         </trh:tableLayout>
        </trh:cellFormat>
       </trh:rowLayout>
      </trh:tableLayout>
      <h:commandButton value="#{str['button.submit']}" id="btn_Cid" action="#{searchcontact.cancel}" style="display:none;" immediate="true"/> 
     </div>
     <f:subview id="footer">
      <%@ include file="/common/footer.jsp"%>
     </f:subview>
    </div>
   </h:form>
  </trh:body>
 </trh:html>
</f:view>
