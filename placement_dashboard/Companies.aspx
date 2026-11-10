<%@ Page Language="C#" AutoEventWireup="true" CodeBehind=" Companies.aspx.cs" 
Inherits="placement_dashboard.Companies" %> 
 
<!DOCTYPE html> 
 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head runat="server"> 
    <title></title> 
</head> 
<body> 
    <form id="form1" runat="server"> 
        <h3>Placement Records</h3> 
 
        <asp:Repeater ID="rptCompanies" runat="server"> 
            <HeaderTemplate> 
                <table border="1" cellpadding="5"> 
                    <tr> 
                        <th>Placement ID</th> 
                        <th>Student ID</th> 
                        <th>Company</th> 
                        <th>Job Role</th> 
                        <th>Package (LPA)</th> 
                    </tr> 
            </HeaderTemplate> 
            <ItemTemplate> 
                <tr> 
                    <td><%# Eval("PlacementID") %></td> 
                    <td><%# Eval("StudentID") %></td> 
                    <td><%# Eval("CompanyName") %></td> 
                    <td><%# Eval("JobRole") %></td> 
                    <td><%# Eval("PackageLPA") %></td> 
                </tr> 
            </ItemTemplate> 
            <FooterTemplate> 
                </table> 
            
            </FooterTemplate> 
        </asp:Repeater> 
 
        <h3>Company Details Using DataList</h3> 
 
        <asp:DataList ID="dlPlacements" runat="server"> 
            <ItemTemplate> 

 
 
                <p> 
                    Company: <%# Eval("CompanyName") %><br /> 
                    Job Role: <%# Eval("JobRole") %><br /> 
                    Package: <%# Eval("PackageLPA") %> LPA 
                
                </p> 
                <hr /> 
            </ItemTemplate> 
        </asp:DataList> 
 
        <br /> 
        <a href="Default.aspx">Back to Dashboard</a> 
    </form> 
</body> 
</html> 