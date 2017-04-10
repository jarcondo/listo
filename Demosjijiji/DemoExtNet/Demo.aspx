<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Demo.aspx.cs" Inherits="DemoExtNet.Demo" %>
<%@ Import Namespace="System.Xml" %>
<%@ Import Namespace="System.Collections.Generic" %>
<%@ Register Assembly="Ext.Net" Namespace="Ext.Net" TagPrefix="ext" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"   />
    <title></title>
    <link href="/resources/css/examples.css" rel="stylesheet" />
    <script>

        var invalidateLogin = function (reason) {
            App.txtUsername.setValidation(reason);
            App.txtPassword.setValidation(reason);
            App.txtUsername.validate();
            App.txtPassword.validate();

            Ext.MessageBox.show({
                title: 'Authentication error',
                msg: reason,
                buttons: Ext.MessageBox.OK,
                animateTarget: 'Window1',
                icon: 'Error'
            });
        };

        var handleLogin = function () {
            var form = App.Window1.el.up().dom;

            App.Window1.close();


           // setForm(form, "lectorqr.aspx.aspx?parametro=" + txtUsername.Text, form.target);
            // form.submit();
            // restoreForm(form);
        };
       

        var orgFormAction, orgFormTarget,
            btn = null, iframe = null;

        var handleClientClick = function () {
            var form = App.Window1.el.up().dom; 

            if (Ext.isIE) {
                if (iframe == null) {
                    iframe = document.createElement("IFRAME");
                    iframe.name = "ie_login_flush";
                    iframe.style.display = "none";
                    form.appendChild(iframe);
                }

                if (btn == null) {
                    btn = document.createElement("BUTTON");
                    btn.type = "submit";
                    btn.id = "submitButton";
                    btn.style.display = "none";
                    form.appendChild(btn);
                }

                setForm(form, "about:blank", "ie_login_flush");
                btn.click();
                restoreForm(form);
            }
        }

        var setForm = function (form, action, target) {
            if (typeof orgFormAction == 'undefined') {
                orgFormAction = form.action;
            }
            if (typeof orgFormTarget == 'undefined') {
                orgFormTarget = form.target;
            }

            form.action = action;
            form.target = target;
        };

        var restoreForm = function (form) {
            form.action = orgFormAction;
            form.target = orgFormTarget;
        };
    </script>
</head>
<body>
   <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server" />
        <ext:Window
            ID="Window1"
            runat="server"
            Closable="false"
            Resizable="false"
            Height="150"
            Icon="Lock"
            Title="Login"
            Draggable="true"
            Width="350"
            Modal="false"
            BodyPadding="5"
            Layout="Form">


            <Items>
                <ext:TextField
                    ID="txtUsername"
                    runat="server"
                    Name="username"
                    FieldLabel="Usuario"
                    AllowBlank="false"
                    BlankText="Usuario Requerido" />
                <ext:TextField
                    ID="txtPassword"
                    runat="server"
                    Name="password"
                    InputType="Password"
                    FieldLabel="Contraseña"
                    AllowBlank="false"
                    BlankText="Contraseña Requerida" />
            </Items>
            <Buttons>
                <ext:Button
                    ID="Button1"
                    runat="server"
                    Text="Login"
                    Icon="Accept"
                    FormBind="true"                   
                    Handler="handleClientClick">
                    <DirectEvents>
                        <Click
                            OnEvent="Button1_Click"
                            Success="handleLogin"
                            Failure="invalidateLogin(result.errorMessage);"
                            ShowWarningOnFailure="false">
                            <EventMask ShowMask="true" Msg="Verifying..." MinDelay="1000" />
                            <ExtraParams>
                                <ext:Parameter Name="user" Value="App.txtUsername.value" Mode="Raw" />
                                <ext:Parameter Name="pass" Value="App.txtPassword.value" Mode="Raw" />
                            </ExtraParams>
                        </Click>
                    </DirectEvents>
                </ext:Button>
            </Buttons>
            
        </ext:Window>
    </form>
</body>
</html>
