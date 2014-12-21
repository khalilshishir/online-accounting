<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/3/14
  Time: 7:56 PM
--%>

<%@ page import="org.dao.oa.Project" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Project</title>

    <script type="text/javascript">

    </script>
</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form id="projectForm" name="projectForm">
            <g:hiddenField name="hidProjectId" value="${hidProjectId}"/>
            <h3>Create project</h3>
            <div class="alert alert-info" style="width: 764px">
                ${flash.message}
            </div>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="projectName">Project Name</label>

                    <div class="col-md-3 required">
                        <g:textField name="projectName" required="required" id="projectName"  class="form-control" value="${project?.projectName}"/>
                    </div>
                </div>
                <br/><br/>

                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">&nbsp;</label>
                    <div class="col-md-3">
                        <g:actionSubmit name="save" value="save" action="save"  class="btn btn-block btn-primary"/>
                    </div>
                </div>
            </fieldset>
        </g:form>

        <div id="data" class="panel-body" >
            <table id="example"  style="width: 700px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Project Name</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${projectList}" var="project">
                    <tr>
                        <td>${project?.projectName}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'project', action: 'update', params: [id: project?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this Project?')"
                                   href="${g.createLink(controller: 'project', action: 'delete', params: [id: project?.id])}"
                                   title="Delete"><i class="fa fa-trash-o"></i></a>

                            </div>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div></div>
<script type="text/javascript">


    function resetInputs() {
        $("#projectName").val("");
           }

    function SaveProject()
    {
        isvalid = true;

        var projectName = $("#projectName").val();

        if (projectName == null || projectName == "") {
            alert("Project Name must be filled out");
            isvalid = false;
        }
    }

</script>
</body>
</html>