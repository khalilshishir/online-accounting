<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/13/14
  Time: 8:30 PM
--%>
<%@ page import="org.dao.oa.CoAMasterInfo" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.Project" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAGroupInfo" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAClassInfo" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.oa.util.CoAMasterAccountStatus" contentType="text/html;charset=UTF-8" %>
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
        <g:form>
            <g:hiddenField name="hidCoAMasterId" value="${hidCoAMasterId}"/>
            <h3>Create Genarel Ledger</h3>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="project">Project</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="project" name='project' value="${coAMasterInfo?.project?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${Project.list()}'
                                  optionKey="id" optionValue="projectName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountCode">Account Code</label>
                    <div class="col-md-3 required">
                        <g:textField name="accountCode" id="accountCode" required="required" class="form-control" value="${accountCode}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountCode">Account name</label>
                    <div class="col-md-3 required">
                        <g:textField name="accountName" id="accountName" required="required" class="form-control" value="${accountName}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                <label class="col-md-2 control-label" for="coaClass">GL Class</label>
                <div class="col-md-3 required">
                    <g:select class="form-control" id="coaClass" name='coaClass' value="${coAMasterInfo?.coaClass?.id}"
                              noSelection="${["": 'Please Select...']}"
                              from='${CoAClassInfo.list()}'
                              optionKey="id" optionValue="coAClassName" tabindex="4"></g:select>
                </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coaGroup">GL Group</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="coaGroup" name='coaGroup' value="${coAMasterInfo?.coaGroup?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${CoAGroupInfo.list()}'
                                  optionKey="id" optionValue="coAGroupName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountStatus">Account Status</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="accountStatus" required="required" name='accountStatus'
                                  noSelection="${["": 'Please Select...']}"
                                  from="${CoAMasterAccountStatus.values()}" keys="${CoAMasterAccountStatus.values()*.name()}"
                                  optionKey="key" optionValue="" tabindex="4" value="${accountStatus}">
                        </g:select>
                    </div>
                </div><br/>

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
                        <g:actionSubmit name="save" value="save" action="save" class="btn btn-block btn-primary"/>
                    </div>
                </div>
            </fieldset>
        </g:form>


    </div>
</div>
</body>
</html>