<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main">
    <title><g:message code="configuracaoSistema.label"/> </title>

    <style>
        .header{
            font-size: x-large;
        }
        .subitem{
            font-size: medium;
            white-space: pre;
        }
    </style>
</head>

<body>
    <div class="ui list" >
        <div class="item">
            <div class="header">Sistema</div>
            <g:link action="show" class="subitem">
                <i class="configure icon"></i> Configurar
            </g:link>
        </div>
        <div class="item">
            <div class="header">Manutenção</div>
            <g:link controller="console" class="subitem">
                <i class="file code outline icon"></i> Console
            </g:link>
        </div>
    </div>

</body>
</html>