<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    %{--
            <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    --}%
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'bootstrap.min.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/font-awesome-4.0.3', file: 'font-awesome.min.css')}">
    <link href="${resource(dir: 'css', file: 'business-plate.css')}" rel="stylesheet">
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap/', file: 'bootstrap-modal.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css/bootstrap', file: 'bootstrap-modal-bs3patch.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.dataTables.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'menu.css')}" type="text/css">

    <script src="${resource(dir: 'js', file: 'jquery.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'jquery.dataTables.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'menu.js')}"></script>

    <g:layoutHead/>
    <g:javascript library="application"/>

    <r:script>
        jQuery(document).ready(function () {
            $('#example').dataTable();

        });

    </r:script>
    <r:layoutResources />
</head>
<body>

%{--
		<div id="grailsLogo" role="banner"><a href="http://grails.org"><img src="${resource(dir: 'images', file: 'grails_logo.png')}" alt="Grails"/></a></div>
--}%
<div style="width: 960px;">
</div>
<div class="centre">
<div id="menu">
    <ul class="menu">
        <li><a href="${g.createLink(uri: '/')}" class="parent"><span><i class="fa fa-home fa-fw"></i>&nbsp;Home</span></a>
            <div><ul>
                <li><a href="#" class="parent"><span>GL Maintanance</span></a>
                    <div><ul>
                        <li><a href="${g.createLink(controller: 'coAClass')}"><span><i class="fa fa-pencil fa-fw"></i>GL Class</span></a></li>
                        <li><a href="${g.createLink(controller: 'coAGroup')}"><span><i class="fa fa-pencil fa-fw"></i>GL Group</span></a></li>
                        <li><a href="${g.createLink(controller: 'coAMaster',action: 'list')}"><span><i class="fa fa-pencil fa-fw"></i>Genarel Ledger</span></a></li>
                        <li><a href="#"><span>Category</span></a></li>
                        <li><a href="#"><span>Sub Category</span></a></li>
                    </ul></div>
                </li>
                <li><a href="${g.createLink(controller: 'project')}"><span><i class="fa fa-book fa-fw"></i>Project</span></a></li>
                <li><a href="${g.createLink(controller: 'bankAccount')}"><span><i class="fa fa-pencil fa-fw"></i>Bank Account</span></a></li>
                <li><a href="${g.createLink(controller: 'vehicle',action: 'create')}"><span><i class="fa fa-pencil fa-fw"></i>Bank Account</span></a></li>
            </ul></div>
        </li>
        <li><a href="#" class="parent"><span>Employee</span></a>
            <div><ul>
                <li>
                    <a href="${g.createLink(controller: 'employeeInfo')}"><span><i class="fa fa-book fa-fw"></i>Employee</span></a>
                </li>
                <li><a href="${g.createLink(controller: 'department')}" class="parent"><span><i class="fa fa-book fa-fw"></i>Department</span></a>
                    <div><ul>
                        <li><a href="${g.createLink(controller: 'designation')}"><span><i class="fa fa-book fa-fw"></i>Designation</span></a></li>
                        <li><a href="#"><span>Sub Item 1.2</span></a></li>
                    </ul></div>
                </li>

                <li><a href="#" class="parent"><span>Sub Item 2</span></a>
                    <div><ul>
                        <li><a href="#"><span>Sub Item 2.1</span></a></li>
                        <li><a href="#"><span>Sub Item 2.2</span></a></li>
                    </ul></div>
                </li>
                <li><a href="#"><span>Sub Item 3</span></a></li>
                <li><a href="#"><span>Sub Item 4</span></a></li>
                <li><a href="#"><span>Sub Item 5</span></a></li>
                <li><a href="#"><span>Sub Item 6</span></a></li>
                <li><a href="#"><span>Sub Item 7</span></a></li>
            </ul></div>
        </li>
        <li><a href="${g.createLink(controller: 'help',action: 'help')}"><span>Help</span></a></li>
        <li class="last"><a href="#"><span>Contacts</span></a></li>
    </ul>
</div>
<g:layoutBody/>
<div class="footer" role="contentinfo"></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<r:layoutResources />

</div>
</body>
</html>
