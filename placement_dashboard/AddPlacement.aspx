<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPlacement.aspx.cs" 
Inherits="placement_dashboard.AddPlacement" %> 
<!DOCTYPE html> 
<html> 
<head runat="server"> 
<title>Add Placement</title> 
<style> 
body { 
font
family: Arial; 
background: #f4f6f9; 
padding: 30px; 
} 
.container { 
width: 400px; 
margin: auto; 
background: white; 
padding: 25px; 
border
radius: 10px; 
} 
h2 { 
} 
text
.field { 
margin
align: center; 
} 
bottom: 15px; 
label { 
display: block; 
margin
bottom: 5px; 
} 
input { 
width: 100%; 
padding: 9px; 
box
} 
.btn { 
sizing: borderbox; 
 

 
 
            width: 100%; 
            padding: 10px; 
            background: #2563eb; 
            color: white; 
            border: none; 
            cursor: pointer; 
        } 
    </style> 
</head> 
<body> 
    <form id="form1" runat="server"> 
        <div class="container"> 
 
            <h2>Add Placement Details</h2> 
 
            <div class="field"> 
                <label>Select Student</label> 
                <asp:DropDownList ID="ddlStudents" runat="server"> 
                </asp:DropDownList> 
            </div> 
 
            <div class="field"> 
                <label>Company Name</label> 
                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox> 
            </div> 
 
            <div class="field"> 
                <label>Job Role</label> 
                <asp:TextBox ID="txtJobRole" runat="server"></asp:TextBox> 
            </div> 
 
            <div class="field"> 
                <label>Package (LPA)</label> 
                <asp:TextBox ID="txtPackage" runat="server" 
                    TextMode="Number"></asp:TextBox> 
            </div> 
 
            <asp:Button ID="btnAddPlacement" runat="server" 
                Text="Add Placement" 
                CssClass="btn" 
                OnClick="btnAddPlacement_Click" /> 
 
            <br /><br /> 
 
            <asp:Label ID="lblMessage" runat="server"></asp:Label> 
 
            <br /><br /> 

 
 
 
            <a href="Default.aspx">Back to Dashboard</a> 
 
        </div> 
    </form> 
</body> 
</html> 