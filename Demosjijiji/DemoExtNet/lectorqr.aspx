<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lectorqr.aspx.cs" Inherits="Prestamos.lectorqr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
 
    <script type="text/javascript">
        function msg() {
            alert("bienvenido:")
        };
    </script>
    
    <style type="text/css">
        .rotar
        {
            width: 1000px;
            height: 450px;
        }
        #reader
        {
            width: 600px;
            height: 450px;
        }

        @media screen and (min-width: 480px)
        {
            body
            {
                background-color: lightgreen;
            }
        }
   
        
    </style>
</head>
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/html5-qrcode.min.js"></script>
   
<body>
    <form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label" ></asp:Label>
        <asp:Label ID="lblQR" runat="server"   Visible="true"></asp:Label>
        <div id="reader" class="rotar" >
            
               <h3>Datos del Código QR:</h3> 
           
                <asp:TextBox ID="txtCodigo" runat="server" Width="371px" ></asp:TextBox>
            

            <br />
        </div>
        </form>
        <script>

            $(document).ready(function () {
                $('#reader').html5_qrcode(function (data) {
                    
                   
                    $('#<%=lblQR.ClientID%>').val(data);
                    
                    var label = document.getElementById('lblQR');
                    
                    //cod = txtCodigo.Text;
                    if (label.value.length > 0) {
                        //alert("jaja");
                        window.open('http://www.forosdelweb.com/f13/abrir-pagina-desde-javascript-882373/', '', 'width=330,height=252,scrollbars=NO,statusbar=NO,left=500,top=250');
                    }
            },
                function (error) {

                }, function (videoError) {
                    alert("No hay cámara");
                }
            );
        });

    </script>

    
    </body>
</html>
