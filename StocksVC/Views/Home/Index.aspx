<%@ Page Title="Home" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<StocksVC.Models.StockInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

<div class="container-fluid">

    <div class="row">
        <div class="col-md-3" id="indexCalendar">
            <h2>Calendar</h2>
            <img src="file://Images/march-calendar-2015.png">
            <p class="link"><%= Html.ActionLink("View Calendar", "Calendar", "Home") %></p>
        </div>

        <div class="col-md-6" id="newsfeed">
            <h2>Newsfeed</h2>
            <textarea style="height: 60px; width: 100%; padding: 4px; margin-bottom: 5px;" rows="8" cols="80" name="message" id="message" tabindex="1"></textarea>
            <button type="submit" class="btn btn-success">Post</button>
            <div class="newsfeed">
            </div>
        </div>

        <div class="col-md-3" id="indexStocks">
            <h2>Top Stocks</h2>
            <table class="table table-striped table-bordered table-condensed">
                <tr>
                    <th>
                        <%: Html.DisplayNameFor(model => model.StockName) %>
                    </th>
                    <th>
                        <%: Html.DisplayNameFor(model => model.Price) %>
                    </th>
                    <th>
                        <%: Html.DisplayNameFor(model => model.Thoughts) %>
                    </th>
                </tr>
               
                <% for (var item = 0; item < 5; item ++)
                { %>
                <tr>
                    <td>
                        <%: Html.DisplayFor(modelItem => Model.ElementAt(item).StockName) %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => Model.ElementAt(item).Price)%>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => Model.ElementAt(item).Thoughts)%>
                    </td>
                </tr>
                <% } %>
            
            </table>
            <p class="link"><%= Html.ActionLink("View More Stock Info...", "AllStocks", "Home") %></p>
        </div>

    </div>
</div>

    <script src="scripts/jquery-2.1.3.js"></script>

    <script type="text/javascript">
        window.fbAsyncInit = function () {
            FB.init({
                appId: '525344350942089',
                xfbml: true,
                version: 'v2.2'
            });

            FB.api('/me/home', function (response) {
                for (var i = 0; i < response.length; i++) {
                    newsfeed.append(response[i]);
                }
            });

        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        })
</script>



<!--Start of Tawk.to Script-->
<script type="text/javascript">
    var $_Tawk_API = {}, $_Tawk_LoadStart = new Date();
    (function () {
        var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
        s1.async = true;
        s1.src = 'https://embed.tawk.to/55418188d8de6eae538950f8/default';
        s1.charset = 'UTF-8';
        s1.setAttribute('crossorigin', '*');
        s0.parentNode.insertBefore(s1, s0);
    })();
</script>
<!--End of Tawk.to Script-->

</asp:Content>
