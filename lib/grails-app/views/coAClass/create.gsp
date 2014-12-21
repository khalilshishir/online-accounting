<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/3/14
  Time: 7:56 PM
--%>


<%@ page import="org.dao.oa.CoAClass" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.oa.util.CoAClassType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>GL Class</title>

</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form>
            <g:hiddenField name="hidCoAClassId" value="${hidCoAClassId}"/>
            <h3>Create Chart of Account Class</h3>
            <div class="alert alert-info" style="width: 764px">
                ${flash.message}
            </div>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coAClassName">Class Name</label>

                    <div class="col-md-3 required">
                        <g:textField name="coAClassName" id="coAClassName" required="required" class="form-control" value="${coAClassName}"/>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coAClassType">Class Type</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="coAClassType" required="required" name='coAClassType'
                              noSelection="${["": 'Please Select...']}"
                              from="${CoAClassType.values()}" keys="${CoAClassType.values()*.name()}"
                              optionKey="key" optionValue="" tabindex="4" value="${coAClassType}">
                         </g:select>
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

        <div id="data" class="panel-body" >
            <table id="example"  style="width: 700px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Class Name</th>
                    <th>Class Type</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${coAClassList}" var="coAClass">

                    <tr>
                        <td>${coAClass?.coAClassName}</td>
                        <td>${coAClass?.coAClassType}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'coAClass', action: 'update', params: [id: coAClass?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this GL Class?')"
                                   href="${g.createLink(controller: 'coAClass', action: 'delete', params: [id: coAClass?.id])}"
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