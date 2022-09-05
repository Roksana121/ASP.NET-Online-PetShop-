<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pet_type_add.aspx.cs" Inherits="petShop.pet_type_add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2>Add New Pet Type</h2>
            <div runat="server" class="alert" id="alert" visible="false">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <p runat="server" id="msg"></p>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label1" CssClass="col-form-label col-md-2" AssociatedControlID="txtPetType" runat="server" Text="Pet Type"></asp:Label>
                <asp:TextBox ID="txtPetType" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label2" CssClass="col-form-label col-md-2" AssociatedControlID="txtHousing" runat="server" Text="Housing"></asp:Label>
                <asp:TextBox ID="txtHousing" CssClass="form-control col-md-6" runat="server"></asp:TextBox>
            </div>
            <div class="form-group row">
                <div class="offset-2">
                    <asp:Button ID="btnInsert" CssClass="btn btn-primary" runat="server" Text="Save to database" OnClick="btnInsert_Click" />
                </div>
            </div>
            <asp:SqlDataSource ID="dsPetTypes" runat="server" ConnectionString="<%$ ConnectionStrings:petDBCon %>" DeleteCommand="DELETE FROM [petTypes] WHERE [typeId] = @typeId" InsertCommand="INSERT INTO [petTypes] ([petType], [housing]) VALUES (@petType, @housing)" SelectCommand="SELECT * FROM [petTypes]" UpdateCommand="UPDATE [petTypes] SET [petType] = @petType, [housing] = @housing WHERE [typeId] = @typeId">
                <DeleteParameters>
                    <asp:Parameter Name="typeId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="petType" Type="String" />
                    <asp:Parameter Name="housing" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="petType" Type="String" />
                    <asp:Parameter Name="housing" Type="String" />
                    <asp:Parameter Name="typeId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <a runat="server" href="pet_type_manage.aspx"><i class="fa fa-long-arrow-left"></i> Back to the list</a>
        </div>
    </div>
</asp:Content>
