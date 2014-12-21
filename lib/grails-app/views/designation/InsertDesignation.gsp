<%@ page import="org.dao.oa.Department" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>

</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form>
            <g:hiddenField name="hidDesignationId" value="${id}"/>
            <h3>Create Designation</h3>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="desigId">Id</label>
                    <div class="col-md-3 required">
                        <g:textField name="desigId" class="form-control" value="${desigId}"/>
                    </div>
                </div><br>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="desigName">Name</label>
                    <div class="col-md-3 required">
                        <g:textField name="desigName" class="form-control" value="${desigName}"/>
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
        <br/><br/>
        <div id="data" class="panel-body" >
            <table id="example" style="width: 750px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>

                <g:each in="${designationList}" var="designation">

                    <tr>
                        <td>${designation?.desigId}</td>
                        <td>${designation?.desigName}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'designation', action: 'update', params: [id: designation?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete student?')"
                                   href="${g.createLink(controller: 'designation', action: 'delete', params: [id: designation?.id])}"
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