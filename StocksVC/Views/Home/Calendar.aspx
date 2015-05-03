<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Calendar
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="BodyContent" runat="server">
    
        <script type="text/javascript">
            $(document).ready(function() {
                $('#calendar').fullCalendar({
                    header: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'month,basicWeek,basicDay'
                    },
                    defaultDate: '2015-05-12',
                    editable: true,
                    eventLimit: true, // allow "more" link when too many events

                });
            })
        </script>

        <style>
            #calendar {
                width: 900px;
            }

            .fc button {
                width: 100px;
                font-size: 1.5em;
            }

            .fc-day-header {
                height: 200px;
            }

        </style>

        <div class="col-lg-12 col-lg-offset-1">
            <h1>Calendar</h1>
        </div>

        <div class="col-lg-3 col-lg-offset-1" id="index" style="padding-bottom:10px;">
            <h2>Add New Event</h2>
            <label for="event_name">Event Name:</label> 
            <input id="event_name" type="text" /> 
            <label for="start">Start:</label>
            <input id="start" type="text" />
            <label for="end">End:</label>
            <input id="end" type="text" style="margin-bottom: 20px;" />
            <button class="btn btn-primary">Go!</button>
        </div>

        <div id="calendar" class="col-lg-8">

        </div>

</asp:Content>
