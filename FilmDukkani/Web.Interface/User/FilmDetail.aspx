<%@ Page Title="" Language="C#" MasterPageFile="~/User/Genel.Master" AutoEventWireup="true" CodeBehind="FilmDetail.aspx.cs" Inherits="Web.Interface.FilmDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width: 100%">
        <div class="center_content">
            <div class="center_title_bar"><%= SelectedFilm.FilmAdi %></div>

            <div class="prod_box_big">
                <div class="top_prod_box_big"></div>

                <div class="center_prod_box_big">
                    <div class="product_img_big">
                        <img src='<%= ResolveClientUrl(SelectedFilm.Resim) %>'  alt="" title="" border="0" width="150" />
                    </div>

                    <div class="details_big_box">
                        <div class="product_title_big">
                            Film Özeti:<span class="blue"><%= SelectedFilm.Ozet %></span>
                        </div>

                        <div class="specifications">
                            Kategorisi : <span class="blue">
                                <%= SelectedFilm.Kategoriler.KategoriAdi %>
                            </span>
                            <br />
                            Yönetmeni : <span class="blue">
                                <%= SelectedFilm.Yonetmenler.YonetmenAdi + " " + SelectedFilm.Yonetmenler.YonetmenSoyadi %>
                            </span>
                            <br />
                            Oyuncular : <span class="blue">
                                <%= SelectedFilm.Oyuncular.OyuncuAdi + " " + SelectedFilm.Oyuncular.OyuncuSoyadi %>
                            </span>
                            <br />
                            Yapım Yılı : <span class="blue">
                                <%= SelectedFilm.YapimYili %>
                            </span>
                            <br />
                            Ödül : <span class="blue">
                                <%= SelectedFilm.Odul %>
                            </span>
                            <br />
                            Süre : <span class="blue">
                                <%= SelectedFilm.Sure %>
                            </span>
                            <br />
                            Stok Miktari : <span class="blue">
                                <%= SelectedFilm.StokMiktari.ToString() %>
                            </span>
                            <br />
                            Stok Durumu : <span class="blue"><%= stokDurumu %></span>
                            <br />
                            Garanti : <span class="blue">24 Ay</span><br />
                            <%--Kargo : <span class="blue">Ucretsiz</span><br />--%>
                            Kargo : <span class="blue"><%= kargoFiyati %></span>
                            <br />
                            Şube : <span class="blue">
                                <%= SelectedFilm.Subeler.SubeAdi %>
                            </span>
                            <br />
                        </div>

                        <div class="prod_price_big">
                            <span class="reduce"><%= string.Format("{0:C}", (Convert.ToDouble(SelectedFilm.Fiyat) + (Convert.ToDouble(SelectedFilm.Fiyat) * 0.3))) %></span>

                            <span class="price"><%= string.Format("{0:C}", (Convert.ToDouble(SelectedFilm.Fiyat))) %></span>
                        </div>

                        <asp:LinkButton runat="server" ID="lbtnSepeteEkle" class="addtocart" OnClick="lbtnSepeteEkle_Click">Sepete Ekle</asp:LinkButton>

                        <asp:LinkButton runat="server" ID="lbtnUrunKarsilastir" class="compare" OnClick="lbtnUrunKarsilastir_Click">Film Karsilastir</asp:LinkButton>

                        <asp:LinkButton runat="server" ID="lbtnFragman" class="fragman" OnClick="lbtnFragman_Click" OnClientClick="form1.target='_blank';"><span>Fragman</span></asp:LinkButton>
                    </div>
                </div>
                <div class="bottom_prod_box_big"></div>
            </div>

            <div class="center_title_bar">Benzer Urunler</div>

            <div style="width: auto; float: left;">
                <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
                    <ItemTemplate>
                        <div id="main">
                            <div id="content">
                                <div class="box">
                                    <div class="movie">
                                        <div class="movie-image">
                                            <%-- <span class="name">X-MAN</span>--%>
                                            <a href="FilmDetail.aspx">
                                                <asp:Image ID="Image1" runat="server" Width="150" ImageUrl='<%# ResolveClientUrl(Eval("Resim").ToString()) %>' />
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

            </div>

            <asp:HiddenField ID="hfFilmId" runat="server" />
        </div>
    </div>
</asp:Content>
