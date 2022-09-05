<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pet_type_manage.aspx.cs" Inherits="petShop.pet_type_manage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        //function confirmDelete() {
        //    if (confirm("Are you sure to delete?")) {
        //        return true;
        //    }
        //    else {
        //        return false;
        //    }
        //}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
     <div class="row">
        <div class="col-md-12">
            <h2>Pet type we sell</h2>
            <div class="d-flex justify-content-end">
                <a runat="server" class="btn btn-primary btn-sm" href="pet_type_add.aspx"> <i class="fa fa-plus"></i> Add New</a>
            </div>
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered mt-2" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="typeId" DataSourceID="dsPetTypeData" OnPreRender="GridView1_PreRender">
                <Columns>
                    <asp:BoundField DataField="typeId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="typeId" />
                    <asp:TemplateField HeaderText="Type" SortExpression="petType">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Bind("petType") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" CssClass="col-form-label" Text='<%# Bind("petType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Housing" SortExpression="housing">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" Text='<%# Bind("housing") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" CssClass="col-form-label" Text='<%# Bind("housing") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" CssClass="btn btn-primary btn-sm"><i class="fa fa-save"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="btn btn-danger btn-sm"><i class="fa fa-times"></i></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" CssClass="btn btn-info btn-sm"><i class="fa fa-pencil"></i></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('Are you sure to delete?')"><i class="fa fa-trash-o"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="dsPetTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:petDBCon %>" DeleteCommand="DELETE FROM [petTypes] WHERE [typeId] = @typeId" InsertCommand="INSERT INTO [petTypes] ([petType], [housing]) VALUES (@petType, @housing)" SelectCommand="SELECT * FROM [petTypes]" UpdateCommand="UPDATE [petTypes] SET [petType] = @petType, [housing] = @housing WHERE [typeId] = @typeId">
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
        </div>
    </div>
</asp:Content>
