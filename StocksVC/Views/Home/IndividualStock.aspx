<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<StocksVC.Models.StockInfo>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Individual Stock
</asp:Content>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="BodyContent">
    <style>
        #buy-modal-container, #sell-modal-container {
            height: 400px;
            width: 500px;
            background-color: white;
            margin-left: 30%;
        }

        #buy_quantity, #sell_quantity {
            width: 200px;
        }
    </style>

    <div class="row">
        <div class="col-lg-6 col-lg-offset-2">
            <h1>Stock Description</h1>
        </div>
        <div class="col-lg-12">
            <img src=<%= ViewBag.Image %> class="image-rounded" />
        </div>
        <div class="col-lg-6 col-lg-offset-3">
            <div>
                <table class="table table-striped table-bordered table-condensed">
                   <% foreach (var item in Model)
                   { %>
                    <tr>
                        <td><%: Html.DisplayNameFor(model => model.StockName) %> </td>
                        <td>    <% var name = Html.DisplayFor(model => item.StockName);
                               ViewBag.StockName = name; %> 
                            <%= name %>
                        </td>
                    </tr>
                    <tr>
                        <td>Current Price</td>
                        <td><%= "$" + ViewBag.StockPrice %> </td> 
                    </tr>
                    <tr>
                        <td><%: Html.DisplayNameFor(model => model.Thoughts) %></td>
                        <td><%: Html.DisplayFor(model => item.Thoughts)%> </td>
                    </tr>
                    <tr>
                        <td><%: Html.DisplayNameFor(model => model.TotalBought) %></td>
                        <td><% var bought = Html.DisplayFor(model => item.TotalBought);
                               ViewBag.Bought = Convert.ToInt32(bought.ToString()); %> 
                            <%= bought %>
                        </td>
                    </tr>
                    <tr>
                        <td><%: Html.DisplayNameFor(model => model.TotalSold) %></td>
                        <td><% var sold = Html.DisplayFor(model => item.TotalSold);
                               ViewBag.Sold = Convert.ToInt32(sold.ToString()); %> 
                            <%= sold %>
                        </td>
                    </tr>
                    <tr>
                        <td>Number Owned</td>
                        <td> <% var owned = ViewBag.Bought - ViewBag.Sold; %> 
                             <%= owned %>
                        </td>
                    </tr>
                    <tr>
                        <td>Average Price</td>
                        <td> $0.00 </td>
                    </tr>
                    
                    <% } %> 
                </table>
            </div>
        </div>
        <div class="col-md-8 col-md-offset-3">
            <div class="col-md-2">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#buy-modal-container">Buy</button>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sell-modal-container">Sell</button>
            </div>
            <div class="col-md-2 col-md-offset-2">
                <button type="button" onclick="location.href='Index'" class="btn btn-default">Back</button>
            </div>
        </div>
    </div>


    <div id="buy-modal-container" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h2 class="modal-title">Buy New Stocks</h2>
        </div>
        <% using(Html.BeginForm()) { %>
        <form role="form" id="form1" method="post" runat="server">
            <% foreach (var item in Model)
              { %>
            <div class="modal-body">
                <p class="validateTips">All form fields are required.</p>
                <div class="form-group">
                    <label for="buy_name">Stock Name:</label>
                    <% Html.EditorFor(model => item.StockName, new { htmlAttributes = new { @class = "form-control" }, }); %>
                </div>
                <div class="form-group">
                    <label for="buy_price">Stock Price:</label>
                    <p><%= ViewBag.StockPrice %></p>
                </div>
                <div class="form-group">
                    <label for="buy_quantity">Quantity:</label>
                    <% Html.EditorFor(model => item.TotalBought, "NumberField"); %>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Buy</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cancel</button>
            </div>
            <% } %>
        </form>
        <% } %>
    </div>

    <div id="sell-modal-container" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h2 class="modal-title">Sell Stocks</h2>
        </div>
        <div class="modal-body">
            <p class="validateTips">All form fields are required.</p>
            <form role="form" id="form2">
                <div class="form-group">
                    <label for="sell_name">Stock Name:</label>
                    <input type="text" name="stockName" class="form-control" value="<%= ViewBag.StockName %>" />
                </div>
                <div class="form-group">
                    <label for="sell_price">Stock Price:</label>
                    <p> <%= ViewBag.StockPrice %> </p>
                </div>
                <div class="form-group">
                    <label for="sell_quantity">Quantity:</label>
                    <input type="text" name="quantity" id="sell_quantity" class="form-control">
                </div>
            </form>

        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-primary">Sell</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cancel</button>
        </div>
        </div>  

</asp:Content>