<%--
  Created by IntelliJ IDEA.
  User: Saedur Rahman
  Date: 12/2/14
  Time: 4:56 PM
--%>

<%@ page import="org.dao.oa.Project; org.dao.oa.CoAMasterInfo; org.dao.oa.BankAccount" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.oa.util.AccountType" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Bank Account</title>

</head>

<body>

<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form>
            <g:hiddenField name="hidBankAccountId" value="${hidBankAccountId}"/>
            <h3>Create Bank Account</h3>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="project">Project</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="project" name='project' value="${bankAccount?.project?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${Project.list()}'
                                  optionKey="id" optionValue="projectName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="bankName">Bank Name</label>

                    <div class="col-md-3 required">
                        <g:textField name="bankName" id="bankName" required="required" class="form-control" value="${bankName}"/>
                    </div></div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="bankAccountName">Bank account name</label>

                    <div class="col-md-3 required">
                        <g:textField name="bankAccountName" id="bankAccountName" required="required" class="form-control" value="${bankAccountName}"/>
                    </div></div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="coaMaster">GL</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="coaMaster" name='coaMaster' value="${bankAccount?.coaMaster?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${CoAMasterInfo.findAllWhere(isActive: true)}'
                                  optionKey="id" optionValue="accountName" tabindex="4"></g:select>
                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountNumber">Account number</label>

                    <div class="col-md-3 required">
                        <g:textField name="accountNumber" id="accountNumber" required="required" class="form-control" value="${accountNumber}"/>
                 </div></div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="accountType">Account Type</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="accountType" name='accountType'
                                  noSelection="${["": 'Please Select...']}"
                                  from="${AccountType.values()}" keys="${AccountType.values()*.name()}"
                                  optionKey="key" optionValue="" tabindex="4" value="${accountType}"></g:select>

                    </div>
                </div><br/><br/>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="address">Address</label>

                    <div class="col-md-3 required">
                        <g:textField name="address" id="address" required="required" class="form-control" value="${address}"/>
                    </div></div><br/><br/>


                <div class="form-group">
                    <label for="data" class="col-md-2 control-label">&nbsp;</label>
                    <div class="col-md-3">

                        <g:actionSubmit name="save" value="save" action="save" class="btn btn-block btn-primary"/>
                    </div></div>
            </fieldset>
        </g:form>
        <br/><br/>
        <div id="data" class="panel-body" >
            <table align ="left" id="example" style="width: 750px;" class="dataListTable table table-bordered table-striped table-hover table-condensed">
                <thead>
                <tr>
                    <th>Project</th>
                    <th>Bank Name</th>
                    <th>Bank account name</th>
                    <th>GL</th>
                    <th>Account number</th>
                    <th>Account Type</th>
                    <th>Address</th>
                    <th>&nbsp;</th>
                </tr>
                </thead>
                <tbody>

                <g:each in="${bankAccountList}" var="bankAccount">

                    <tr>
                        <td>${bankAccount?.project?.projectName}</td>
                        <td>${bankAccount?.bankName}</td>
                        <td>${bankAccount?.bankAccountName}</td>
                        <td>${bankAccount?.coaMaster?.accountName}</td>
                        <td>${bankAccount?.accountNumber}</td>
                        <td>${bankAccount?.accountType}</td>
                        <td>${bankAccount?.address}</td>
                        <td class="actions ">
                            <div class="btn-group">
                                <a class="btn btn-warning"
                                   href="${g.createLink(controller: 'bankAccount', action: 'update', params: [id: bankAccount?.id])}"
                                   title="Edit"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this bank account?')"
                                   href="${g.createLink(controller: 'bankAccount', action: 'delete', params: [id: bankAccount?.id])}"
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
    $(document).ready(function() {
        $("#project").change(function() {
            $.ajax({
                url: "/online-accounting/bankAccount/projectSelected",
                data: "id=" + this.value,
                cache: false,
                success: function(html) {
                    $("#coaMaster").html(html);
                }
            });
        });
    });
</script>

</body>
</html>