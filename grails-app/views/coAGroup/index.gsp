<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/13/14
  Time: 12:29 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAClassInfo" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.CoAGroupInfo" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>GL Grroup Information</title>
</head>

<body>

<div class="container">
    <div class="row">
        <g:form>

            <g:hiddenField name="hidCoAGroupId" value="${hidCoAGroupId}"/>
            <h3>Create GL Group</h3>
            <div class="alert alert-info">
                ${flash.message}
            </div>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coAGroupName">Name</label>
                    <div class="col-md-3 required">
                        <g:textField name="coAGroupName" id="coAGroupName" required="required" class="form-control" value="${coAGroupInfo?.coAGroupName}" tabindex="1"/>
                    </div>
                </div><br>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coAClass">CoA Class</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" required="required" id="coAClass" name='coAClass' value="${coAGroupInfo?.coAClass?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${CoAClassInfo.list()}'
                                  optionKey="id" optionValue="coAClassName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>
                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">&nbsp;</label>
                    <div class="col-md-3">
                        <g:actionSubmit name="save" value="save" action="save" class="btn btn-block btn-primary" tabindex="5"/>
                    </div>
                </div>
            </fieldset>
        </g:form>

        <div id="data" class="panel-body">
            <table id="example" style="width: 750px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Group name</th>
                    <th>Class name</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${coAGroupList}" var="coaGroup">
                    <tr>
                        <td>${coaGroup?.coAGroupName}</td>
                        <td>${coaGroup?.coAClass?.coAClassName}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'coAGroup', action: 'update', params: [id: coaGroup?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this GL Group?')"
                                   href="${g.createLink(controller: 'coAGroup', action: 'delete', params: [id: coaGroup?.id])}"
                                   title="Delete"><i class="fa fa-trash-o"></i></a>

                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div></div>

</body>
</html>