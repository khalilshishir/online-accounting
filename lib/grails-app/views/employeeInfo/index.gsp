<%@ page import="org.dao.oa.Designation" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.Department" contentType="text/html;charset=UTF-8" %>
<%@ page import="org.dao.oa.EmployeeInfo" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <title>Employee Information</title>

</head>

<body>

<script>
    jQuery(document).ready(function()
// This is advance publishing page
    {

        // These elements don't change so no point getting them on each click
        var modal = $('#transparent').on('click.close', function() {
                    $(this).hide(); // hide the element on click
                }),
                instructor_input = modal.find('input[name=instructor_name]'),
                section_input = modal.find('input[name=section]'),
                location_input = modal.find('input[name=location]'),
                start_input = modal.find('input[name=start]'),
                end_input = modal.find('input[name=end]'),
                day_checkboxes = modal.find('input[type=checkbox]');

        $('#close').on('click', function() {
            modal.trigger('click.close'); // trigger the "close" click event
        });

        $('#splash').on('click', function(e) {
            e.stopPropagation(); // don't allow clicks to leave the #splash element
        });

        if($('.data_row').on('mouseover', function(e){

            // Get all the data from within this element (row)
            var row = $(this),
                    instructor = row.find('.row_instructor').text(),
                    section = row.find('.row_section').text(),
                    location = row.find('.row_location').text(),
                    start = row.find('.row_start').text(),
                    end = row.find('.row_end').text(),
                    days = row.find('.row_dates').text().toLowerCase();

            // split the days by comma, defaulting to an empty array
            days = days.length && days.split(',') || [];

            section_input.val(section);
            instructor_input.val(instructor);
            start_input.val(start);
            end_input.val(end);
            location_input.val(location);
            if($('.data').on('click', function(e){
                modal.show();
                day_checkboxes.prop('checked', function() {
                    // looks for the "value" in the days array and sets the "checked" property
                    return ~days.indexOf(this.value);
                });

            }));
        }));
    });
</script>
<!-- Begin page content -->
<div class="container">
    <div class="row">
        <g:form>
            <g:hiddenField name="hidEmployeeId" value="${hidEmployeeId}"/>
            <h3>Create Employee</h3>
            <fieldset style="padding: 0 0 0 35px;margin-left: 0px;margin-right: 0px">
                <div class="form-group required">
                    <label class="col-md-2 control-label" for="name">Name</label>
                    <div class="col-md-3 required">
                        <g:textField name="name" class="form-control" value="${employee?.name}" tabindex="1"/>
                    </div>
                </div><br>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="address">Address</label>
                    <div class="col-md-3 required">
                        <g:textField name="address" class="form-control " value="${employee?.address}" tabindex="2"/>
                    </div>
                </div><br>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="department">Department</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="department" name='department' value="${employee?.department?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${Department.list()}'
                                  optionKey="id" optionValue="deptName" tabindex="3"></g:select>
                        </div>
                </div><br>

                <div class="form-group required">
                    <label class="col-md-2 control-label" for="designation">Designation</label>
                    <div class="col-md-3 required">
                        <g:select class="form-control" id="designation" name='designation' value="${employee?.designation?.id}"
                                  noSelection="${["": 'Please Select...']}"
                                  from='${Designation.list()}'
                                  optionKey="id" optionValue="desigName" tabindex="4"></g:select>
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
            <th>Name</th>
            <th>Address</th>
            <th>Department</th>
            <th>Designation</th>
            <th>&nbsp;</th>
        </tr>
        </thead>
        <tbody>

        <g:each in="${employeeList}" var="employee">

            <tr>
                <td>${employee?.name}</td>
                <td>${employee?.address}</td>
                <td>${employee?.department?.deptName}</td>
                <td>${employee?.designation?.desigName}</td>
                <td class="actions ">
                    <div class="btn-group">
                        <a class="btn btn-warning"
                           href="${g.createLink(controller: 'employeeInfo', action: 'update', params: [id: employee?.id])}"
                           title="Edit"><i class="fa fa-eye"></i></a>
                        <a class="btn btn-danger delete" onclick="return confirm('Are you sure delete this employee?')"
                           href="${g.createLink(controller: 'employeeInfo', action: 'delete', params: [id: employee?.id])}"
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