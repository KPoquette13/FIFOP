<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Calendar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">

        <div class="col-lg-12 col-lg-offset-1">
            <h1>Calendar</h1>
        </div>

        <div class="col-lg-3 col-lg-offset-1" id="indexEvent">
            <h2>Add New Event</h2>
            <p>Event Name:</p> 
            <input id="event_name" type="text" /> 
            <p>Start:</p>
            <input id="start" type="text" />
            <p>End:</p>
            <input id="end" type="text" />
            <button class="btn btn-primary" id="add-event">Go!</button>
        </div>

        <div id="calendar" class="col-lg-8">

        </div>

</asp:Content>
