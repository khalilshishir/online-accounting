<%@ page import="org.dao.oa.test.Model; org.dao.oa.test.Manufacturer" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>
${flash.message}
<table>
<tbody>
<tr>
<td valign="top"><label for="vehicleName">Vehicle Name:</label></td>
<td valign="top"></td>
</tr>
<tr>
<td valign="top"><label for="vehicleManufacturer">Manufacturer</label></td>
<td valign="top"><g:select id="vehicleManufacturerDropDown" optionKey="id" optionValue="manufacturerName"
                                     from="${Manufacturer.list()}"
                                     name="vehicleManufacturerDropDown" value=""/></td>
</tr>
<tr>
<td valign="top"><label for="model">Model</label></td>
<td valign="top"><g:select id="model" optionKey="id" optionValue="modelName"
                                       from="${Model.list()}"
                                       name="model" value=""/></td>
</tr>
</tbody>
</table>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#vehicleManufacturerDropDown").change(function() {
                $.ajax({
                    url: "/online-accounting/vehicle/manufacturerSelected",
                    data: "id=" + this.value,
                    cache: false,
                    success: function(html) {
                        $("#model").html(html);
                    }
                });
            });
        });
    </script>
</body>
</html>
