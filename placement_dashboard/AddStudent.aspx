<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" 
Inherits="placement_dashboard.AddStudent" %> 
<!DOCTYPE html> 
<html> 
<head runat="server"> 
<title>Add Student</title> 
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
            box-sizing: border-box; 
        } 
 
        .btn { 
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
 
            <h2>Register New Student</h2> 
 
            <div class="field"> 
                <label>Student ID</label> 
                <asp:TextBox ID="txtStudentID" runat="server" 
                    TextMode="Number"></asp:TextBox> 
            </div> 
 
            <div class="field"> 
                <label>Student Name</label> 
                <asp:TextBox ID="txtStudentName" runat="server"></asp:TextBox> 
            </div> 
 
            <div class="field"> 
                <label>Department</label> 
                <asp:TextBox ID="txtDepartment" runat="server"></asp:TextBox> 
            </div> 
 
            <div class="field"> 
                <label>Email</label> 
                <asp:TextBox ID="txtEmail" runat="server" 
                    TextMode="Email"></asp:TextBox> 
            </div> 
 
            <asp:Button ID="btnAddStudent" runat="server" 
                Text="Register Student"  
                CssClass="btn" 
                OnClick="btnAddStudent_Click" /> 
 
            <br /><br /> 
 
            <asp:Label ID="lblMessage" runat="server"></asp:Label> 
 
            <br /><br /> 
 
            <a href="Default.aspx">Back to Dashboard</a> 
 
        </div> 
 
    </form> 
</body> 
</html> 