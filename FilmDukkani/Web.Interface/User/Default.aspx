<%@ Page Title="" Language="C#" MasterPageFile="~/User/Genel.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web.Interface.Default" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div id="main">
                <div id="content">
                    <div class="box">
                        <div class="movie">
                            <div class="movie-image">
                                <%-- <span class="name">X-MAN</span>--%>                            
                                    <a href="FilmDetail.aspx">
                                        <asp:Image ID="Image1" runat="server" Width="150" ImageUrl='<%# ResolveClientUrl(Eval("Resim").ToString()) %>'/>
                                    </a>                      
                            </div>
                            <div class="prod_details_tab">
                                <%--   <span class="reduce"></span>--%>
                                <span><%# string.Format("{0:C}", Eval("Fiyat")) %></span>
                                <span>Stok:<%# Eval("StokMiktari") %></span>&nbsp;<%--<span><asp:LinkButton ID="lbtnSepet" class="text-right" runat="server">Sepet</asp:LinkButton></span>--%><asp:LinkButton ID="lbtnDetay" runat="server" CssClass="text-right" CommandArgument='<%# Eval("FilmID") %>' CommandName="details">Film Detayı</asp:LinkButton>
                            </div>
                        </div>
                        <div class="cl">&nbsp;</div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <cc1:CollectionPager ID="CollectionPager1" runat="server" MaxPages="5" PageSize="15" SectionPadding="5" SliderSize="5" LabelText="Sayfa" NextText="İleri" BackText="Geri" ResultsFormat=""></cc1:CollectionPager>

    <%--    <asp:SqlDataSource ID="FilmDukkaniDB" runat="server" ConnectionString="<%$ ConnectionStrings:FilmDukkaniDBConnectionString4 %>" SelectCommand="SELECT * FROM [Filmler]"></asp:SqlDataSource>--%>
</asp:Content>
