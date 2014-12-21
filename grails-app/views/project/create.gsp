
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Welcome to Grails</title>
    <style type="text/css">
    .home {
        background: #95BD4A;
    }

    .contents table td {
        color: white;
        font-size: 16px;
    }

    .first_row td {
        font-size: 14px;
    }

    .contents ul li {
        color: white;
        font-size: 16px;
        list-style: none;
    / / list-style-type : square;
    }

    .contents .shiftleft li {
        margin-left: -32px;
    }

    .col-md-6 {
        padding: 0;
        margin: 0;
        width: 50%;
    }

    .subject {
        width: 25%;
    }

    .silverstripe .contents .from {
        width: 15%;
    }

    .progress {
        margin: 10px;
    }

    .received img {
        width: 25px;
    }

    .silverstripe .contents table .list-item .subject {
        text-align: center;
    }

    .silverstripe .contents table .unread {
        font-weight: bold;
    }

    .toolbar td {
        vertical-align: middle;
    }

    a {
        text-decoration: none
    }

    #transparent {
        display: none;
    }

    .row_course_name {
        font-weight: bold;
        width: 40%;
        font-family: arial;
    }

    .instructor_list {
        font-weight: bold;
        width: 25%;
        font-family: arial;
    }
    /*style for rendering button*/
    a.cupid-blue {
        background-color: #d7e5f5;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #d7e5f5), color-stop(100%, #cbe0f5));
        background-image: -webkit-linear-gradient(top, #d7e5f5, #cbe0f5);
        background-image: -moz-linear-gradient(top, #d7e5f5, #cbe0f5);
        background-image: -ms-linear-gradient(top, #d7e5f5, #cbe0f5);
        background-image: -o-linear-gradient(top, #d7e5f5, #cbe0f5);
        background-image: linear-gradient(top, #d7e5f5, #cbe0f5);
        border-top: 1px solid #abbbcc;
        border-left: 1px solid #a7b6c7;
        border-bottom: 1px solid #a1afbf;
        border-right: 1px solid #a7b6c7;
        border-radius: 12px;
        -webkit-box-shadow: inset 0 1px 0 0 white;
        box-shadow: inset 0 1px 0 0 white;
        text-decoration: none;
        color: #1a3e66;
        font: normal 11px/1 "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
        padding: 6px 10px 7px 10px;
        text-align: center;
        text-shadow: 0 1px 1px #fff;
        width: 150px; }
    a.cupid-blue:hover {
        background-color: #ccd9e8;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #ccd9e8), color-stop(100%, #c1d4e8));
        background-image: -webkit-linear-gradient(top, #ccd9e8, #c1d4e8);
        background-image: -moz-linear-gradient(top, #ccd9e8, #c1d4e8);
        background-image: -ms-linear-gradient(top, #ccd9e8, #c1d4e8);
        background-image: -o-linear-gradient(top, #ccd9e8, #c1d4e8);
        background-image: linear-gradient(top, #ccd9e8, #c1d4e8);
        border-top: 1px solid #a1afbf;
        border-left: 1px solid #9caaba;
        border-bottom: 1px solid #96a3b3;
        border-right: 1px solid #9caaba;
        -webkit-box-shadow: inset 0 1px 0 0 #f2f2f2;
        box-shadow: inset 0 1px 0 0 #f2f2f2;
        color: #163659;
        cursor: pointer; }
    a.cupid-blue:active {
        border: 1px solid #8c98a7;
        -webkit-box-shadow: inset 0 0 4px 2px #abbccf, 0 0 1px 0 #eeeeee;
        box-shadow: inset 0 0 4px 2px #abbccf, 0 0 1px 0 #eeeeee; }


    </style>
</head>

<body>

<div class="container">
    <div class="row">

        <form action='${resource(dir:'project', file:'save')}'>
            <g:hiddenField name="hidProjectId" value="${hidProjectId}"/>
            <h3>Create Project</h3>

            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="projectName" >Project name</label>

                    <div class="col-md-3 required">
                        <g:textField name="projectName" required="required" class="form-control" value="${projectName}"/>
                    </div>
                </div><br/><br/>
                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">&nbsp;</label>
                    <div class="col-md-3">
                        <g:actionSubmit name="save" value="save" action="save" class="btn btn-block btn-primary" />
                    </div>
                </div>
            </fieldset>
        </form>
        %{--for listing--}%
        <div id="data" class="panel-body">
            <table id="example" style="width: 700px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Project Name</th>
                </tr>
                </thead>
                <tbody>

                <g:each in="${projectList}" var="project">

                    <tr>
                        <td>${project?.projectName}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning" style="text-align: right"
                                   href="${g.createLink(controller: 'project', action: 'update', params: [id: project?.id])}"
                                   title="Edit"><i class="fa fa-eye" ></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete student?')"
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
</body>
</html>