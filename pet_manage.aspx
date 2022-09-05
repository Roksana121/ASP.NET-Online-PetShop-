<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pet_manage.aspx.cs" Inherits="petShop.pet_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col">
            <h2>Pets in store</h2>
            <div class="d-flex justify-content-end mb-1">
                <a runat="server" href="pet_Add.aspx" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> Add New</a>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="petId" DataSourceID="dsPetList" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-warning" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" CssClass="btn btn-danger" Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="petId" HeaderText="petId" InsertVisible="False" ReadOnly="True" SortExpression="petId" />
                    <asp:BoundField DataField="typeId" HeaderText="typeId" SortExpression="typeId" />
                    <asp:BoundField DataField="colorDescription" HeaderText="colorDescription" SortExpression="colorDescription" />
                    <asp:BoundField DataField="sellUnitDescription" HeaderText="sellUnitDescription" SortExpression="sellUnitDescription" />
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:TemplateField HeaderText="picture" SortExpression="picture">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("picture") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <img src='<%# Eval("picture","/Images/{0}") %>' width="40"/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsPetList" runat="server" ConnectionString="<%$ ConnectionStrings:petDBCon %>" DeleteCommand="DELETE FROM [pets] WHERE [petId] = @petId" InsertCommand="INSERT INTO [pets] ([typeId], [colorDescription], [sellUnitDescription], [price], [picture]) VALUES (@typeId, @colorDescription, @sellUnitDescription, @price, @picture)" SelectCommand="SELECT * FROM [pets]" UpdateCommand="UPDATE [pets] SET [typeId] = @typeId, [colorDescription] = @colorDescription, [sellUnitDescription] = @sellUnitDescription, [price] = @price, [picture] = @picture WHERE [petId] = @petId">
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
        </div>
    </div>
</asp:Content>
