<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    void Page_Load(System.Object Sender, System.EventArgs Args)
    {
        Session.Clear();
        Response.Redirect("login.aspx");

    }
</script>
