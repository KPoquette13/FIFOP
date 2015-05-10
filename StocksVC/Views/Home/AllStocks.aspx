<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<StocksVC.Models.StockInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Purchased Stocks
</asp:Content>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="BodyContent">

        <div class="col-lg-3 col-lg-offset-2" id="index">
            <form role="form" id="stockLookup">
                <h2>Stock Lookup</h2>
                <label for="stock_name"><p>Stock Name:</p></label> 
                <input type="text"name="stock_name" /> 
                <button id="stockSearch" class="btn btn-primary" style="width:50%;" type="button">GO</button>
            </form>
        </div>

        <div class="col-lg-6" id="index">
            <h2>Owned Stocks</h2>
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
                    <th>
                        <%: Html.DisplayNameFor(model => model.TotalBought) %>
                    </th>
                    <th>
                        <%: Html.DisplayNameFor(model => model.TotalSold) %>
                    </th>
                    <th>
                        Action
                    </th>
                </tr>

                <% foreach (var item in Model)
                   { if (item.TotalBought != item.TotalSold) { %>
                <tr>
                    <td>
                        <% var name = Html.DisplayFor(modelItem => item.StockName).ToString(); %>
                        <%= name %>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.Price)%>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.Thoughts)%>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.TotalBought)%>
                    </td>
                    <td>
                        <%: Html.DisplayFor(modelItem => item.TotalSold)%> 
                    </td>
                    <td>
                        <%= Html.ActionLink("View", "IndividualStock", new { ticker = name })%>
                    </td>
                </tr>
                <% } }%>
            </table>

        </div>

</asp:Content>

