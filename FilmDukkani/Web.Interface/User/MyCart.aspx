<%@ Page Title="" Language="C#" MasterPageFile="~/User/Genel.Master" AutoEventWireup="true" CodeBehind="MyCart.aspx.cs" Inherits="Web.Interface.MyCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 730px;
            float: left;
            text-align: center;
            color: black;
            background-color: lightgray;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <div style="font-family: Calibri; font-size: medium; font-weight: bold; width: 730px; background-color: lightsalmon">
            <table style="width: 730px;">
                <tr style="color: black">
                    <td style="text-align: center; vertical-align: middle; width: 75px;">Seçiniz
                    </td>
                    <td style="text-align: center; vertical-align: middle; width: 150px;">Film Adı
                    </td>
                    <td style="text-align: center; vertical-align: middle; width: 150px;">Resim</td>
                    <td style="text-align: center; vertical-align: middle; width: 140px;">Adet
                    </td>
                    <td style="text-align: center; vertical-align: middle; width: 100px;">Fiyat
                    </td>
                </tr>
            </table>
        </div>
    </div>

    <asp:Repeater ID="rptMyCart" runat="server" OnItemCommand="rptMyCart_ItemCommand">
        <ItemTemplate>
            <div style="font-family: Calibri; font-size: medium; font-weight: bold; width: 730px;">
                <table class="auto-style2">
                    <tr>
                        <td style="text-align: center; vertical-align: middle; width: 75px">
                            <asp:CheckBox ID="chkCheck" runat="server" Text="Remove" AutoPostBack="True"/>

                            <asp:HiddenField ID="hfFilmId" runat="server" Value='<%# Eval("FilmID") %>' />
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 150px">
                            <%# Eval("FilmAdi") %>
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 150px;">
                            <asp:ImageButton ID="imgFilm" runat="server" CommandArgument='<%# Eval("FilmID") %>' CommandName="sepet" Width="75" Height="75" ImageUrl='<%# Eval("Resim") %>' />
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 140px">
                            <%# Eval("Adet") %>
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 100px">
                            <%# string.Format("{0:C}", (Convert.ToInt32(Eval("Adet")) * Convert.ToDecimal(Eval("Fiyat")))) %>
                        </td>

                        <%--   <td style="text-align: center; vertical-align: middle; width: 75px">
                            <asp:ImageButton ID="imgFilm" runat="server" CommandArgument='<%# Eval("FilmID") %>' CommandName="sepet" Width="30" Height="30" ImageUrl="~/images/icons/sepet.png" />
                        </td>--%>
                    </tr>
                </table>
            </div>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <div style="font-family: Calibri; font-size: medium; font-weight: bold; width: 730px;">
                <table class="auto-style2" style="background-color: aqua">
                    <tr>
                        <td style="text-align: center; vertical-align: middle; width: 75px">
                            <asp:CheckBox ID="chkCheck" runat="server" Text="Remove" AutoPostBack="True" />

                            <asp:HiddenField ID="hfFilmId" runat="server" Value='<%# Eval("FilmID") %>' />
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 150px">
                            <%# Eval("FilmAdi") %>
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 150px;">
                            <asp:ImageButton ID="imgFilm" runat="server" CommandArgument='<%# Eval("FilmID") %>' CommandName="sepet" Width="75" Height="75" ImageUrl='<%# Eval("Resim") %>' />
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 140px">
                            <%# Eval("Adet") %>
                        </td>

                        <td style="text-align: center; vertical-align: middle; width: 100px">
                            <%# string.Format("{0:C}", (Convert.ToInt32(Eval("Adet")) * Convert.ToDecimal(Eval("Fiyat")))) %>
                        </td>

                        <%--   <td style="text-align: center; vertical-align: middle; width: 75px">
                            <asp:ImageButton ID="imgFilm" runat="server" CommandArgument='<%# Eval("FilmID") %>' CommandName="sepet" Width="30" Height="30" ImageUrl="~/images/icons/sepet.png" />
                        </td>--%>
                    </tr>
                </table>
            </div>
        </AlternatingItemTemplate>
        <FooterTemplate>
             <div style="font-family: Calibri; font-size: medium; font-weight: bold; width: 730px;">
                 <table class="auto-style2" style="background-color: azure">
                    <tr>
                        <td style="text-align: right; vertical-align: middle; width: 75px">
                            Toplam Fiyat: <%= string.Format("{0:C2}", TotalPrice) %>
                        </td> 
                    </tr>
                </table>               
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <br />
    <br />
    <asp:Button ID="btnSecilenleriKaldir" runat="server" Text="Secilenleri Kaldir" OnClick="btnSecilenleriKaldir_Click" style="height:50px"/>
</asp:Content>
