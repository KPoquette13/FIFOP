<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<StocksVC.Models.StockInfo>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Purchased Stocks
</asp:Content>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="BodyContent">
        <div class="col-lg-8 col-lg-offset-2">

            <table class="table table-striped table-bordered table-condensed">
                <tr>
                    <th>
                        <p><%: Html.DisplayNameFor(model => model.StockName) %> </p>
                    </th>
                    <th>
                        <p><%: Html.DisplayNameFor(model => model.Price) %> </p>
                    </th>
                    <th>
                        <p><%: Html.DisplayNameFor(model => model.Thoughts) %> </p>
                    </th>
                    <th>
                        <p><%: Html.DisplayNameFor(model => model.TotalBought) %> </p>
                    </th>
                    <th>
                        <p><%: Html.DisplayNameFor(model => model.TotalSold) %> </p>
                    </th>
                </tr>

                <% foreach (var item in Model)
                   { %>
                <tr>
                    <td>
                        <% var name = Html.DisplayFor(modelItem => item.StockName).ToString(); %>
                        <p> <%= Html.ActionLink(name, "IndividualStock", new { ticker = name }) %> </p>
                    </td>
                    <td>
                        <p><%: Html.DisplayFor(modelItem => item.Price)%> </p>
                    </td>
                    <td>
                        <p><%: Html.DisplayFor(modelItem => item.Thoughts)%> </p>
                    </td>
                    <td>
                        <p><%: Html.DisplayFor(modelItem => item.TotalBought)%> </p>
                    </td>
                    <td>
                        <p><%: Html.DisplayFor(modelItem => item.TotalSold)%> </p>
                    </td>
                </tr>
                <% } %>
            </table>

        </div>

</asp:Content>

