<%@ Page Title="" Language="C#" MasterPageFile="~/User/Genel.Master" AutoEventWireup="true" CodeBehind="ComparedFilms.aspx.cs" Inherits="Web.Interface.ComparedFilms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">    
    
     <div style="width: 100%">

        <asp:GridView ID="gwFilmKarsilastirma" runat="server" AutoGenerateColumns="False">

            <HeaderStyle BackColor="Black" ForeColor="White" Height="30px" Font-Size="Medium" />
            <RowStyle BackColor="Aquamarine" ForeColor="Black" Font-Size="Larger" Width="190px" />
            <AlternatingRowStyle BackColor="Wheat" ForeColor="Black" Font-Size="Larger" />

            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:CheckBox ID="chkCheck" runat="server" Text="Remove" AutoPostBack="True" />
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Film Adı" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <asp:HiddenField ID="hfFilmId" runat="server" Value='<%# Eval("FilmID") %>' />

                        <div style="padding: 20px;">
                            <asp:Label ID="lblFilmAdi" runat="server" Text='<%# Eval("FilmAdi") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Özet" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <div style="padding: 20px;">
                            <asp:Label ID="lblOzet" runat="server" Text='<%# Eval("Ozet") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Resim" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <div style="padding: 20px;">
                            <asp:Image ID="imgPhoto" runat="server" ImageUrl='<%# ResolveClientUrl(Eval("Resim").ToString()) %>' Width="100px" Height="100px" />
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Stok Miktarı" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <div style="padding: 20px;">
                            <asp:Label ID="lblStok" runat="server" Text='<%# Eval("StokMiktari") %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

                  <asp:TemplateField HeaderText="Fiyat" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <div style="padding: 20px;">
                            <asp:Label ID="lblFiyat" runat="server" Text='<%# string.Format( "{0:C2}", Eval("Fiyat")) %>'></asp:Label>
                        </div>
                    </ItemTemplate>

                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
    </div>


    <div>
        <asp:LinkButton CssClass="compare" ID="lbtnSecilenleriKaldir" runat="server" Width="100px" OnClick="lbtnSecilenleriKaldir_Click">Seçilenleri Kaldır</asp:LinkButton>
    </div>
       
</asp:Content>
