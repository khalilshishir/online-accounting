<%--
  Created by IntelliJ IDEA.
  User: khalil.ullah
  Date: 16/December/2014
  Time: 2:57 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Genarel Ledger</title>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="alert-info" style="width: 764px">
           <a  class="btn btn-success Create"
                     href="${g.createLink(controller: 'coAMaster', action: 'index')}"
                     title="Create"><i class="fa fa-pencil-o"></i>Create</a>
</div>
        <div id="data" class="panel-body" >
            <table id="example"  style="width: 750px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Project</th>
                    <th>Account Code</th>
                    <th>Account Name</th>
                    <th>GL Class</th>
                    <th>GL Group</th>
                    <th>Account Status</th>
                    <th>Is Debitable</th>
                    <th>Is Creditable</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${coAMasterList}" var="coaMaster">

                    <tr>
                        <td>${coaMaster?.project?.projectName}</td>
                        <td>${coaMaster?.accountCode}</td>
                        <td>${coaMaster?.accountName}</td>
                        <td>${coaMaster?.coaClass?.coAClassName}</td>
                        <td>${coaMaster?.coaGroup?.coAGroupName}</td>
                        <td>${coaMaster?.accountStatus}</td>
                        %{--<td class="text-center">${coaMaster?.isDebitable ? "Yes":"NO"}--}%
                        <td>
                            <g:if test="${coaMaster?.isDebitable}">
                                <span class="text-center glyphicon glyphicon-ok"></span>
                            </g:if>
                            <g:else>
                                <span class="text-center glyphicon glyphicon-remove"></span>
                            </g:else>
                        </td>
                        <td>
                            <g:if test="${coaMaster?.isCreditable}">
                                <span class="glyphicon glyphicon-ok"></span>
                            </g:if>
                            <g:else>
                                <span class="glyphicon glyphicon-remove"></span>
                            </g:else>
                        </td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'coAMaster', action: 'update', params: [id: coaMaster?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this Genarel Ledger?')"
                                   href="${g.createLink(controller: 'coAMaster', action: 'delete', params: [id: coaMaster?.id])}"
                                   title="Delete"><i class="fa fa-trash-o"></i></a>

                            </div>
                        </td>
                    </tr>

                </g:each>
                </tbody>
            </table>
        </div>

    </div>

</div>
</body>
</html>