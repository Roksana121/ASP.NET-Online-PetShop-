<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pet_Add.aspx.cs" Inherits="petShop.pet_Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2>Add New Pet</h2>
            <div runat="server" class="alert" id="alert" visible="false">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <p runat="server" id="msg"></p>
            </div>
            <div class="form-group row">
                <asp:Label ID="lblPetType" AssociatedControlID="ddlPetType" CssClass="col-form-label col-md-2" runat="server" Text="Pet Type"></asp:Label>
                <div class="col-md-10">
                    <asp:DropDownList ID="ddlPetType" CssClass="form-control col-md-4" runat="server" DataSourceID="dsPetTypes" DataTextField="petType" DataValueField="typeId"></asp:DropDownList>
                    <asp:SqlDataSource ID="dsPetTypes" runat="server" ConnectionString="<%$ ConnectionStrings:petDBCon %>" SelectCommand="SELECT [typeId], [petType] FROM [petTypes]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label1" AssociatedControlID="txtColor" CssClass="col-form-label col-md-2" runat="server" Text="Pet skin Color"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtColor" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
                </div>
            </div>
             <div class="form-group row">
                <asp:Label ID="Label2" AssociatedControlID="txtDescription" CssClass="col-form-label col-md-2" runat="server" Text="Pet Sell Description"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label3" AssociatedControlID="txtSellPrice" CssClass="col-form-label col-md-2" runat="server" Text="Sell Price"></asp:Label>
                <div class="col-md-10">
                    <asp:TextBox ID="txtSellPrice" runat="server" CssClass="form-control col-md-4"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="Label4" CssClass="col-form-label col-md-2" runat="server" Text="Choose file"></asp:Label>
                <div class="col-md-10">
                    <div class="col-md-4 custom-file">
                        <asp:FileUpload ID="picture" runat="server" CssClass="custom-file-input" />
                        <asp:Label ID="Label5" runat="server" CssClass="custom-file-label" AssociatedControlID="picture" Text="">Choose file...</asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group row">
                <div class="col-md-10 offset-2">
                    <asp:Button ID="btnInsert" runat="server" CssClass="btn btn-primary" Text="Insert" OnClick="btnInsert_Click" />
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="dsPets" runat="server" ConnectionString="<%$ ConnectionStrings:petDBCon %>" DeleteCommand="DELETE FROM [pets] WHERE [petId] = @petId" InsertCommand="INSERT INTO [pets] ([typeId], [colorDescription], [sellUnitDescription], [price], [picture]) VALUES (@typeId, @colorDescription, @sellUnitDescription, @price, @picture)" SelectCommand="SELECT * FROM [pets]" UpdateCommand="UPDATE [pets] SET [typeId] = @typeId, [colorDescription] = @colorDescription, [sellUnitDescription] = @sellUnitDescription, [price] = @price, [picture] = @picture WHERE [petId] = @petId">
            <DeleteParameters>
                <asp:Parameter Name="petId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="typeId" Type="Int32" />
                <asp:Parameter Name="colorDescription" Type="String" />
                <asp:Parameter Name="sellUnitDescription" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="picture" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="typeId" Type="Int32" />
                <asp:Parameter Name="colorDescription" Type="String" />
                <asp:Parameter Name="sellUnitDescription" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="picture" Type="String" />
                <asp:Parameter Name="petId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <a runat="server" href="pet_manage.aspx"><i class="fa fa-long-arrow-left"></i> Back to the list</a>
    </div>
</asp:Content>
