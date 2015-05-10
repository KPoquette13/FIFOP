<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<StocksVC.Models.StockInfo>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Individual Stock
</asp:Content>

<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="BodyContent">

        <div class="col-lg-6 col-lg-offset-2">
            <h1>Stock Description</h1>
        </div>

        <div class="col-lg-12">
            <img src=<%= ViewBag.Image %> class="image-rounded" />
        </div>

        <div class="col-lg-4 col-lg-offset-2">
            <table class="table table-striped table-bordered table-condensed">
                <tr>
                    <td>Stock Name</td>
                    <td><%= ViewBag.StockFullName %></td>
                </tr>
                <tr>
                    <td>Stock Symbol</td>
                    <td><%= ViewBag.StockName %></td>
                </tr>
                <tr>
                    <td>Market High</td>
                    <td><%= "$" + ViewBag.StockHigh %></td>
                </tr>
                <tr>
                    <td>Market Low</td>
                    <td><%= "$" + ViewBag.StockLow %></td>
                </tr>

            </table>
        </div>
            
        <div class="col-lg-4">
            <table class="table table-striped table-bordered table-condensed">
                <% if (!Model.Any()) 
                   { %>
                    <tr>
                        <td>Current Price</td>
                        <td><%= "$" + ViewBag.StockPrice %> </td> 
                    </tr>
                    <tr>
                        <td>Thoughts</td>
                        <td>X</td>
                    </tr>
                    <tr>
                        <td>Total Bought</td>
                        <td>X</td>
                    </tr>
                    <tr>
                        <td>Total Sold</td>
                        <td>X</td>
                    </tr>
                    <tr>
                        <td>Number Owned</td>
                        <td>X</td>
                    </tr>
                    <tr>
                        <td>Average Sold</td>
                        <td>X</td>
                    </tr>
                <% } %>

                <% foreach (var item in Model)
                   { %>
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
        <div class="col-md-8 col-md-offset-3" id="buyOrSell">
            <div class="col-md-2">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#buy-modal-container">Buy</button>
            </div>
            <% if (!Model.Any()) 
            { %>
                <div class="col-md-2">
                    <button type="button" disabled="disabled" class="btn btn-primary" data-toggle="modal" data-target="#sell-modal-container">Sell</button>
                </div>
            <% }  else { %>
                <div class="col-md-2">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#sell-modal-container">Sell</button>
                </div>
            <% } %>
            <div class="col-md-2 col-md-offset-2">
                <button type="button" onclick="location.href='Index'" class="btn btn-default">Back</button>
            </div>
        </div>


        <div id="buy-modal-container" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h2 class="modal-title">Buy New Stocks</h2>
            </div>
            <% using (Html.BeginForm(null, null, FormMethod.Post, new { id = "newStockForm" }))
               {  %>
                <fieldset>
                    <div class="modal-body">
                        <p class="validateTips">All form fields are required.</p>
                        <div class="form-group">
                            <label for="buy_name">Stock Name:</label>
                            <p id="stockInfoSymbol"><%= ViewBag.StockName%></p>
                        </div>
                        <div class="form-group">
                            <label for="buy_price">Stock Price:</label>
                            <p id="stockInfoPrice"><%= ViewBag.StockPrice%></p>
                        </div>
                        <p><strong>Quantity</strong></p>
                        <div class="editor-field">
                            <p><input type="number" id="stockInfoQuantity"/></p>
                        </div>
                        <div class="editor-label">
                            <p><strong>Thoughts</strong></p>
                        </div>
                        <div class="editor-field">
                            <textarea id="stockInfoThoughts"></textarea>
                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="submitBuy" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Buy</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cancel</button>
                </div>
                </fieldset>
            <% } %>
    </div>

    <div id="sell-modal-container" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h2 class="modal-title">Sell Stocks</h2>
        </div>
        <div class="modal-body">
            <p class="validateTips">All form fields are required.</p>
             <% using (Html.BeginForm(null, null, FormMethod.Post, new { id = "newSellForm" }))
               {  %>
                <div class="form-group">
                    <label for="buy_name">Stock Name:</label>
                    <p id="stockInfoSymbolSell"><%= ViewBag.StockName%></p>
                </div>
                <div class="form-group">
                    <label for="buy_price">Stock Price:</label>
                    <p id="stockInfoPriceSell"><%= ViewBag.StockPrice%></p>
                </div>
                <p><strong>Quantity</strong></p>
                <div class="editor-field">
                    <p><input type="number" id="stockInfoQuantitySell"/></p>
                </div>
            <% } %>
        </div>
        <div class="modal-footer">
            <button type="button" id="submitSell" class="btn btn-primary" data-dismiss="modal" aria-hidden="true">Sell</button>
            <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-hidden="true">Cancel</button>
        </div>
    </div>  

</asp:Content>