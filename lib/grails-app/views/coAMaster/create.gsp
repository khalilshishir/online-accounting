<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/13/14
  Time: 8:30 PM
--%>
<%@ page import=" org.dao.oa.CoAMaster" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.Project" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAGroup" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAClass" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.oa.util.CoAMasterAccountStatusType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Genarel Ledger</title>

    <style>
    input[type=checkbox]{
        height:18px;
        width:18px;
        padding:0;
        margin-top:5px;
        display:block;
        float:left;
    }

    span.previous {
        float:left;
    }
    span.next {
        float:right;
    }


    </style>

</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form id="coaMasterForm" name="coaMasterForm">
            <g:hiddenField name="hidCoAMasterId" value="${hidCoAMasterId}"/>
            <h3>Create Genarel Ledger</h3>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="project">Project</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="project" name='project' value="${coaMaster?.project?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${Project.findAllWhere(isActive: true)}' required=""
                                  optionKey="id" optionValue="projectName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountCode">Account Code</label>
                    <div class="col-md-3 required">
                        <g:textField name="accountCode" id="accountCode" required="required" class="form-control" value="${coaMaster?.accountCode}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountCode">Account name</label>
                    <div class="col-md-3 required">
                        <g:textField name="accountName" id="accountName" required="required" class="form-control" value="${coaMaster?.accountName}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                <label class="col-md-2 control-label" for="coaClass">GL Class</label>
                <div class="col-md-3 required">
                    <g:select class="form-control" required="required" id="coaClass" name='coaClass' value="${coaMaster?.coaClass?.id}"
                              noSelection="${["": 'Please Select...']}"
                              from='${CoAClass.findAllWhere(isActive: true)}'
                              optionKey="id" optionValue="coAClassName" tabindex="4"></g:select>
                </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coaGroup">GL Group</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" required="required" id="coaGroup" name='coaGroup' value="${coaMaster?.coaGroup?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${CoAGroup.findAllWhere(isActive: true)}'
                                  optionKey="id" optionValue="coAGroupName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountStatus">Account Status</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="accountStatus" required="required" name='accountStatus'
                                  noSelection="${["": 'Please Select...']}"
                                  from="${CoAMasterAccountStatusType.values()}" keys="${CoAMasterAccountStatusType.values()*.name()}"
                                  optionKey="key" optionValue="" tabindex="4" value="${coaMaster?.accountStatus}">
                        </g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="isDebitable">Is Debitable</label>
                    <div class="col-md-1 required">
                        <g:checkBox name="isDebitable"  id="isDebitable"  class="form-control" value="${true}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="isCreditable">Is Creditable</label>
                    <div class="col-md-1 required">
                        <g:checkBox name="isCreditable" id="isCreditable" class="form-control" value="${true}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">&nbsp;</label>
                    <div class="col-md-3">
                        <g:actionSubmit name="save" value="save" action="save"  class="btn btn-block btn-primary"/>
                    </div>
                </div>
            </fieldset>
        </g:form>
    </div>
</div>
<script language="javascript">

    function SaveCoAMaster(){
        isvalid = true;

        var project = $("#project").val();

        if (project == null || project == "") {
            //showAlert('Project Name must be filled out.','info');
            alert("Project Name must be filled out");
            isvalid = false;
        }

        if (isvalid) {
            document.coaMasterForm.submit();
        }
    }
</script>
</body>
</html>