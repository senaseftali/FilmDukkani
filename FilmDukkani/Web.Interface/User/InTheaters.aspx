<%@ Page Title="" Language="C#" MasterPageFile="~/User/Genel.Master" AutoEventWireup="true" CodeBehind="InTheaters.aspx.cs" Inherits="Web.Interface.InTheaters" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="auto-style2">
        <tr>
            <td>
                <div id="InTheaters">
                    <div class="head">                    
                        <p style="background-color: #725050; text-align:center;">VİZYONDAKİLER</p>
                    </div>
                    <div class="content" style="float: left;">
                        <asp:ListView ID="lstViewVizyon" runat="server">
                            <ItemTemplate>
                                <div style="background-color: #839a4a">
                                    <h3 style="color: #ea0f0f"><%#Eval("Title") %></h3>
                                    <br />
                                    <p class="date">
                                        <%#string.Format("{0:dd/MM/yyyy}",Eval("PublishDate")) %>
                                    </p>
                                    <br />
                                    <p><%# Eval("Description").ToString().Substring(0, 500)%></p>
                                    <br />
                                    <a href='<%#Eval("Link") %>' target="_blank" style="color: #1e6dc3">Devamını Gör...</a>
                                </div>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <div style="background-color: #808080">
                                    <h3 style="color: #ea0f0f"><%#Eval("Title") %></h3>
                                    <br />
                                    <p class="date">
                                        <%#string.Format("{0:dd/MM/yyyy}",Eval("PublishDate")) %>
                                    </p>
                                    <br />
                                    <p><%#Eval("Description").ToString().Substring(0, 500) %></p>
                                    <br />
                                    <a href='<%#Eval("Link") %>' target="_blank" style="color: #1e6dc3">Devamını Gör...</a>
                                </div>
                            </AlternatingItemTemplate>
                        </asp:ListView>

                        <cc1:CollectionPager ID="CollectionPagerInTheaters" runat="server" MaxPages="5" PageSize="8" SectionPadding="5" SliderSize="5" LabelText="Sayfa" NextText="İleri" BackText="Geri" ResultsFormat=""></cc1:CollectionPager>

                    </div>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
