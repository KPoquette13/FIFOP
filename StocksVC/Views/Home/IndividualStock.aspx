﻿@{
    ViewBag.Title = "Individual Stocks";
}

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IndividualStock.aspx.cs" Inherits="IndividualStock" %>

<script type="text/javascript">
    function showDialog() {
        var dialog = $(".modal-dialog").dialog({
            autoOpen: false,
            height: 300,
            width: 500,
        });
        dialog.dialog("open");
    }

    function closeDialog() {
        $(".modal-dialog").hide();
    }

</script>

<div class="row">
    <div class="col-lg-6 col-lg-offset-2">
        <h1>Stock Description</h1>
    </div>
    <div class="col-lg-12">
        <img src=@ViewBag.Image class="image-rounded" />
    </div>
    <div class="col-lg-6 col-lg-offset-3">
        <div>
            <table class="table table-striped table-bordered table-condensed">
                <tr>
                    <td>Stock Name</td>
                    <td>@ViewBag.StockName</td>
                </tr>
                <tr>
                    <td>Number Owned</td>
                    <td>@ViewBag.NumOwned</td>
                </tr>
                <tr>
                    <td>Price</td>
                    <td>@ViewBag.Price</td>
                </tr>
                <tr>
                    <td>Thoughts</td>
                    <td>@ViewBag.Thoughts</td>
                </tr>
                <tr>
                    <td>Total Bought</td>
                    <td>@ViewBag.TotalBought</td>
                </tr>
                <tr>
                    <td>Total Sold</td>
                    <td>@ViewBag.TotalSold</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="col-lg-8 col-lg-offset-3">
        <div class="col-md-2">
            <input type="button" onclick="showDialog();" class="btn btn-primary" role="button" value="Buy" />
        </div>
        <div class="col-md-2">
            <input type="button" class="btn btn-primary" role="button" value="Sell" />
        </div>
        <div class="col-md-2 col-md-offset-2">
            <input type="button" onclick="location.href='Index'" class="btn btn-default" role="button" value="Back" />
        </div>
    </div>
</div>

<div class="modal-dialog" style="display:none">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h3 class="modal-title">Buy New Stocks</h3>
        </div>
        <div class="modal-body">
            <p class="validateTips">All form fields are required.</p>
            <form role="form" id="form1" runat="server">
                <div class="form-group">
                    <label for="name">Stock Name:</label>
                    <input type="text" name="name" id="name" value=@ViewBag.StockName class="form-control">
                </div>
                <div class="form-group">
                    <label for="price">Stock Price:</label>
                    <p> @ViewBag.Price </p>
                </div>
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <asp:textbox id="quantity" runat="server"></asp:textbox>
                </div>
            </form>

        </div>
        <div class="modal-footer">
            <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Buy" />
            <asp:button id="Button2" runat="server" onclick="Button1_Click" text="Cancel" /> 
        </div>
    </div>
</div>
