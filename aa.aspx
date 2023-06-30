<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Panel1.Visible = false;
    }

</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>

.card222
{
    background: aliceblue;
    width: 300px;
    text-align: center;
    position: relative;
    top: 200px;
    /* left: 50%; */
    margin: auto;

}
        
.btn-send {
    border: 0;
    background-color: #53335a;
    color: #FFF;
    border-radius: 50px;
    padding: 10px 60px;
    cursor: pointer;
}

.card {
    background-color: #FFF;
    border-radius: 10px;
    box-shadow: 1px 1px 1px 1px rgb(0, 0, 0/15%);
    padding: 1em;
    position: absolute;
    top: -100%;
    left: 50%;
    text-align: center;
    width: 400px;
    transform: translate(-50%,-50%);
    transition: all .5s;
    opacity: 0;
}

    .card.open {
        opacity: 1;
        top: 50%;
    }

    .card img {
        width: 100px;
        height: 100px;
        border-radius: 50px;
        margin-top: -50px;
    }

    .card h2 {
        font-size: 22px;
        font-weight: bold;
        margin-bottom: 5px;
    }

    .card .btn-close {
        width: 100%;
        border-radius: 50px;
        border: 0;
        padding: 15px;
        margin-top: 20px;
        background-color: #53335a;
        color: #FFF;
        cursor: pointer;
    }

    </style>
</head>
<body>
<form id="ff" runat="server">

        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />






    <asp:Panel ID="Panel1" runat="server" Visible="false" class="card222"> 
        <img src="check.png" width="50" alt="" />
            <h2>Successful</h2>
            <p></p>
        <asp:Button ID="Button2" runat="server" Text="Close"  OnClick="Button2_Click"/>
    </asp:Panel>

</form>
    <script>
        function show_popup(){
            document.getElementById('popup').classList.add('open');
        }
        function hide_popup(){
            document.getElementById('popup').classList.remove('open');
        }
    </script>

  
</body>
</html>
