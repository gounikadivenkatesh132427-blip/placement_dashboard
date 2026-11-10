<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" 
Inherits="placement_dashboard.Default" %> 
<!DOCTYPE html> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server"> 

 
 
    <title></title> 
</head> 
<body> 
    <form id="form1" runat ="server"> 
        <h1>Placement Dashboard</h1> 
        <hr /> 
        <h3>Placement Summary</h3> 
 
        <table border="1" cellpadding="8"> 
            <tr> 
                <td>Total Students</td> 
                <td><asp:Label ID="lblTotal" runat="server" /></td> 
            </tr> 
            <tr> 
                <td>Placed Students</td> 
                <td> 
                    <asp:Label ID="lblPlaced" runat="server" /></td> 
            </tr> 
            <tr> 
                <td>Unplaced Students</td> 
                <td> 
                    <asp:Label ID="lblUnplaced" runat="server" /></td> 
            </tr> 
            <tr> 
                <td>Placement Percentage</td> 
                <td><asp:Label ID="lblPercentage" runat="server" /></td> 
            </tr> 
            <tr> 
                <td>Highest Package (LPA)</td> 
                <td><asp:Label ID="lblHighestPackage" runat="server" /></td> 
            </tr> 
        </table> 
 
        <h3>Student Placement Records</h3> 
 
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="true"  
            EmptyDataText="No student records found!" CellPadding="8"> 
        </asp:GridView>     
 
        <br /> 
 
        <asp:HyperLink ID="lnkCompanies" runat="server" NavigateUrl="~/Companies.aspx"> 
            View Company Summary 
        </asp:HyperLink> 
 
        <br /><br /> 
 

 
 
        <asp:HyperLink ID="lnkAddPlacement" runat="server" 
NavigateUrl="~/AddPlacement.aspx"> 
            Add New Placement 
        </asp:HyperLink> 
 
        <br /><br /> 
 
        <asp:HyperLink ID="lnkAddStudent" runat="server" NavigateUrl="~/AddStudent.aspx"> 
            Add New Student 
        </asp:HyperLink> 
 
        <br /><br /> 
    </form> 
</body> 
</html> 