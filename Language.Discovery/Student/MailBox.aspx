﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MailBox.aspx.cs" Inherits="Language.Discovery.Student.MailBox" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" ValidateRequest="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <br />
    <%--thanks to Gray star from http://danrabbit.deviantart.com
        yellow star from http://eponas-deeway.deviantart.com/
        --%>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    
    <script src="../Scripts/jquery.blockUI.js"></script>
    <script src="../Scripts/addClear.js"></script>
    <link href="../colorbox/colorbox.css" rel="stylesheet" />
    <script src="../colorbox/jquery.colorbox.js"></script>
    <script src="../Scripts/jquery-clearsearch.js"></script>
    <script src="../Scripts/buzz.min.js"></script>
    <style>
        hr {
             text-align:center;
             display: inline-block;
             width: 30%;
         }

         .message {
             /*background:#c9c9c9;*/
             background-color: rgb(252, 234, 187);
             cursor:pointer;
         }
        .divuser-msg-flag {
            top:35px;
            float:right;
            position:relative;
        }
        .msg_flagged {
             background-image: url(/Images/strip_metro7.png);
              background-repeat: no-repeat;
              background-attachment: scroll;
              overflow: hidden;
              width: 16px;
              height: 16px;
              background-position: -62px -125px; /*gray:-52px -73px; red: -62px -125px; */
              float:right;
        }
        .msg_unflagged {
             background-image: url(/Images/strip_metro7.png);
              background-repeat: no-repeat;
              background-attachment: scroll;
              overflow: hidden;
              width: 16px;
              height: 16px;
              background-position: -52px -73px; /*gray:-52px -73px; red: -62px -125px; */
              float:right;
        }
        .list_remove {
             background-image: url(/Images/list_remove.png);
            background-color:transparent;
              width: 16px;
              height: 16px;
              position: absolute;
              left:-2px;
              border-style:none;
              background-size:contain;
        }
        .list_check {
             background-image: url(/Images/list_check.png);
              width: 20px;
              height: 20px;
              position: absolute;
              left:-2px;
              background-repeat:no-repeat;
              background-size:contain;
        }

        .ui-accordion .ui-accordion-content {
            padding:0px !important;
        }
        #accordion .ui-icon { display: none; }
        #accordion .ui-accordion-header a { padding-left: 0 }
        .headeritem {
            background:none !important;
            background-color:#e6e6e6 !important;
            margin:auto;
        }
        .ui-tabs .ui-tabs-nav .ui-tabs-anchor {
            padding:5px !important;
        }
        .ui-widget {
            font-family: Arial,sans-serif,Verdana !important;
        }
        .imgReport {
            left: -15px; 
            bottom: -20px; 
            position: absolute;
            cursor:pointer;
            background-color:transparent;
            border-style:none;
        }
        .imgflameMessage {
            right: -20px; 
            top: -20px; 
            position: absolute;
        }
		/*Afsar*/
        .imgLikeMessage {
            right: -25px; 
            bottom: -45px; 
            position: absolute;
            cursor:pointer;
            background-color:transparent;
            border-style:none;
            width:40px;
            height:40px;
        }
        #chkDeleteMessage {
           height:20px;
           width:20px;
        }
        /*#imgDeleteMessage {
             background: rgba(251,200,67,1);
            background: -moz-linear-gradient(top, rgba(251,200,67,1) 0%, rgba(248,164,38,1) 100%);
            background: -webkit-gradient(left top, left bottom, color-stop(0%, rgba(251,200,67,1)), color-stop(100%, rgba(248,164,38,1)));
            background: -webkit-linear-gradient(top, rgba(251,200,67,1) 0%, rgba(248,164,38,1) 100%);
            background: -o-linear-gradient(top, rgba(251,200,67,1) 0%, rgba(248,164,38,1) 100%);
            background: -ms-linear-gradient(top, rgba(251,200,67,1) 0%, rgba(248,164,38,1) 100%);
            background: linear-gradient(to bottom, rgba(251,200,67,1) 0%, rgba(248,164,38,1) 100%);
            filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fbc843', endColorstr='#f8a426', GradientType=0 );
        }*/
        .needReply {
            background-color: silver;
        }
        .divUsers {
            border: 1px solid black;
        }
        a.gallery{
            padding-left: 0px !important;
            padding-right: 0px !important;
        }
        .paletteContainer span
        {
            display: inline-block !important;
        }
    </style>
    
       <script type="text/javascript">
           var alreadyblinking = false;
           var interval = null;
           var prm = Sys.WebForms.PageRequestManager.getInstance();
           prm.add_initializeRequest(InitializeRequest);

           function InitializeRequest(sender, args) {
               var updateProgress = $get('updProgress');
               var postBackElement = args.get_postBackElement();
               if (postBackElement.id == '<%= imgSearch.ClientID %>') {
                 updateProgress.control._associatedUpdatePanelId = 'dummyId';
             }
             else {
                 if (updateProgress.control)
                     updateProgress.control._associatedUpdatePanelId = null;
             }
         }
         function Bind() {
             $("#txtSearch").clearable();
             $(document).ready(function () {
                 var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);

                 $('.chkSelectUser').on("click", function (e) {
                     e.stopPropagation();
                 });

                 $('.mailbox-img').on("click", function (e) {
                     e.stopPropagation();
                 });
                 $('#imgDeleteMessage').tooltip();
                 $('#imgAddRemoveToVIP').tooltip();
                 $('#btnWriteBack').tooltip();
                 $(".message").click(function () {
                     var el = $('.divunread[data-userid="' + $(this).attr("data-userid") + '"]');
                     MarkMessageAsRead(el);
                     setMessageRead();
                     
                 });
                 InitializeTabs();
                 SetDefaultTab();
                 InitializeAccordion();
                 SetStatus();
                 //SetDefaultAccordion();
                 $('.msg_flagged').click(function (e) {
                     e.stopPropagation();
                 });
                 $('.btnReplyAll').click(function (e) {
                     var flaggedusers = [];
                     var users = $(this).closest("h3").next("div").children("div");
                     users.each(function (index) {
                         flaggedusers.push($(this).attr("data-userid"))
                     });
                     setArray("FlaggedUsers", flaggedusers);
                     ConfirmOpenToNewTab();
                     e.preventDefault();
                     e.stopPropagation();
                 });
                 $('#btnReplyAllSchoolUsers').click(function (e) {
                     var flaggedusers = [];
                     var users = $('#alltab').children("div");
                     users.each(function (index) {
                         flaggedusers.push($(this).attr("data-userid"))
                     });
                     setArray("FlaggedUsers", flaggedusers);
                     ConfirmOpenToNewTab();
                     e.preventDefault();
                     e.stopPropagation();
                 });
                 //$(".list_remove").click(function (e) {
                 //    ConfirmDelete($(this).attr("data-userid"));
                 //    return false;
                 //    //e.preventDefault();
                 //    //e.stopPropagation();

                 //    //$("#btnRemoveCloseFriend").click();
                 //});
                 $('#imgDeleteMessage').click(function () {
                     ConfirmDeleteMessage();
                     return false;
                 });

                 $(".ui-tooltip").hide();
                 $('#imgAddRemoveToVIP').tooltip("destroy");
                 $('#imgAddRemoveToVIP').tooltip();
                 if ($("#hdnSelectedTab").val() == "2") {

                     //$('#imgAddRemoveToVIP').attr("title", $('#hdnDeleteCloseFriends').val());
                     $('#imgAddRemoveToVIP').tooltip("option", "content", $('#hdnDeleteCloseFriends').val());
                 }
                 else
                     $('#imgAddRemoveToVIP').tooltip("option", "content", $('#hdnAddToCloseFriends').val());


                 $(".imgLikeMessage").click(function () {
                     var img = $(this);
                     var json = { Type: 'likemessage', usermailid: $(this).attr("data-usermailid") };
                     $.post("../Handler/GenericPostingHandler.ashx", json, function (data) {
                         var obj = $.parseJSON(data)

                         if (obj.Status == "True") {
                             var current = img.attr('src');
                             var swap = img.attr('data-swap');
                             img.attr("src", swap).attr("data-swap", current);
                         }
                         else
                             alert('Error updating your status. Please check your network or internet.');
                     });

                 });

                 $('.divMailIconContainer').click(function (e) {
                     if ($(this)[0].id == "divUnreadMessage")
                         $(this).hide();

                     e.stopPropagation();
                     e.preventDefault();
                 });
             });
         }

         function ShowPicture() {
             $("a.gallery").colorbox();
             return false;
         }


         function InitializeAccordion() {
             var activeIndex = parseInt($('#hdnSelectedAccordion').val());

             $("#accordion").accordion({
                 beforeActivate: function (event, ui) {
                     var index = $(this).children('h3').index(ui.newHeader);
                     $('#hdnSelectedAccordion').val(index);
                 },
                 heightStyle: "content",
                 collapsible: true,
                 active: activeIndex,
                 header: ".headeritem",
                 navigation: true
             });
             $('#accordion').accordion("option", "active", activeIndex);
             $('.btnReplyAll').button();
         }

         function InitializeTabs() {
             $('#msgtabs').tabs({
                 activate: function (event, ui) { //bind click event to link
                     if (ui.newTab.index() == 2) {
                         $('#imgAddRemoveToVIP').attr("src", "../Images/new/removetovip.png");
                         $('#hdnAddRemoveVipUserState').val("remove");
                         $('#imgAddRemoveToVIP').unbind().click(GetFlaggedUsers());

                     }
                     else {
                         $('#imgAddRemoveToVIP').attr("src", "../Images/new/add friends.png");
                         $('#hdnAddRemoveVipUserState').val("add");
                         $('#imgAddRemoveToVIP').unbind().click(GetFlaggedUsers());

                     }

                     $("#hdnSelectedTab").val(ui.newTab.index());
                 }
             });

             if ($('#alltab').has('.divUsers').length == 0)
                 $('#msgtabs').css("height", "100%");

         }
         function SetDefaultTab() {
             $('#msgtabs').tabs("option", "active", $("#hdnSelectedTab").val());

             $('#msgtabs').tabs("option", "activate", function (event, ui) { //bind click event to link
                 if (ui.newTab.index() == 2) {
                     $('#imgAddRemoveToVIP').attr("src", "../Images/new/removetovip.png");
                     $('#hdnAddRemoveVipUserState').val("remove");
                     $('#imgAddRemoveToVIP').unbind().click(GetFlaggedUsers());

                 }
                 else {
                     $('#imgAddRemoveToVIP').attr("src", "../Images/new/add friends.png");
                     $('#hdnAddRemoveVipUserState').val("add");
                     $('#imgAddRemoveToVIP').unbind().click(GetFlaggedUsers());

                 }

                 $("#hdnSelectedTab").val(ui.newTab.index());
                 $('#imgSearch').click();
             });

         }

         function SetStatus() {
             $('.divUsers').each(function () {
                 var isreplied = $(this).attr("data-IsReplied");
                 var $div = $(this);
                 if (isreplied == 'True') {
                     $(this).find("#divUnrepliedMessage").hide();
                 } else {
                     $(this).find("#divUnrepliedMessage").show();
                 }
             });

             $('.divunread').each(function () {
                 var unread = $(this).attr("data-unread");
                 var $div = $(this);
                 if (unread == '0') {
                     $(this).hide();
                 } else {
                     $(this).show();
                 }
             });

             alreadyblinking = true;
         }

         function AutoSelectUser() {
             var user = $('#divUsers[data-userid="' + $('#hdnUserID').val() + '"]');
             if (user != null && user.length == 0) {
                 user = $('#divUsers').first();
                 SelectUser(user, false);
             }
             else if (user != null && user.length > 0) {
                 SelectUser(user, false);
             }
         }

         function SelectUser(el, justmarkselected) {
             justmarkselected = typeof justmarkselected != 'undefined' ? justmarkselected : false;
             $(el).siblings().removeClass("selected");
             $(el).addClass("selected");
             var button = $('#<%=btnGetUserMessage.ClientID%>');
            $('#<%=hdnUserID.ClientID%>').val($(el).attr("data-userid"));
            $('#<%=hdnName.ClientID%>').val($(el).attr("data-firstname"));
            if (!justmarkselected)
                $(button).trigger('click');
        }

        function SelectUser1(el, ischeckbox) {
            
            $(el).siblings().removeClass("selected");
            $(el).addClass("selected");
            var button = $('#<%=btnGetUserMessage.ClientID%>');
            $('#<%=hdnUserID.ClientID%>').val($(el).attr("data-userid"));
            $('#<%=hdnName.ClientID%>').val($(el).attr("data-firstname"));
            $(button).trigger('click');
        }

        function SelectSchoolUser(el, e) {
            $(el).siblings().removeClass("selected");
            $(el).addClass("selected");
            var button = $('#<%=btnGetUserMessage.ClientID%>');
            $('#<%=hdnUserID.ClientID%>').val($(el).attr("data-userid"));
            $('#<%=hdnName.ClientID%>').val($(el).attr("data-firstname"));
            $(el).find("#chkSelectUser").prop('checked', true);
            $(button).trigger('click');
            //SetDefaultAccordion();
        }

        function CheckRecipient() {

            var user = $('#<%=hdnUserID.ClientID%>');
            if (user.val().length == 0) {
                alert('No recipient selected.');
                return false;
            }
            else {
                ConfirmOpenToNewTab();
                return false;
                //return true;
            }
        }

       function InitializeConfirmDeleteDialog(flaggedusers) {
            var translations = {};
            translations["Ok"] = $('#lblOk').text();
            translations["No"] = "No";
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
                $(this).dialog("close");
                $('#hdnFlaggedUsers').val(flaggedusers);
                //RemoveVIP(this);
                $('#btnRemoveCloseFriend').click();
            }
            buttonsOpts[translations["No"]] = function (e) {
                $(this).dialog("close");
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            $("#confirmDeleteDialog").dialog({
                autoOpen: false,
                modal: true,
                buttons: buttonsOpts
            });
        }

        function InitializeConfirmDeleteMessageDialog() {
            var translations = {};
            translations["Ok"] = $('#lblOk').text();
            translations["No"] = "No";
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
                $(this).dialog("close");
                $('#imgDeleteMessagePost').click();
            }
            buttonsOpts[translations["No"]] = function (e) {
                $(this).dialog("close");
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            $("#confirmDeleteMessageDialog").dialog({
                autoOpen: false,
                modal: true,
                buttons: buttonsOpts
            });
        }

        function InitializeConfirmMessageReadDialog(el) {
            var translations = {};
            translations["Ok"] = $('#lblYes').text();
            translations["No"] = $('#lblNo').text();
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
                $(this).dialog("close");
                MarkMessageAsUnRead(el);
            }
            buttonsOpts[translations["No"]] = function (e) {
                $(this).dialog("close");
                e.preventDefault();
                e.stopPropagation();
                return false;
            }

            $("#confirmMessageReadDialog").dialog({
                autoOpen: false,
                modal: true,
                buttons: buttonsOpts
            });
        }

        function ConfirmMessageRead(el, e) {
            e.stopPropagation();

            if ($(el).attr("src").indexOf("openmail.png") != -1)
                console.log("test");
            else {
                //$(".message").click();
                MarkMessageAsRead(el);
                $(el).attr("src", "../Images/new/openmail.png");
                //enableWriteNew();
                return false;
            }

            //InitializeConfirmMessageReadDialog(el);

            //var checkedVals = $('.chkDeleteMessage :checkbox:checked').map(function () {
            //    return $(this).parent().attr("data-usermailid");
            //}).get();
            //var userids = $('.chkDeleteMessage :checkbox:checked').map(function () {
            //    return $(this).parent().attr("data-userid");
            //}).get();
            //if (checkedVals.length > 0 && $(el).attr("data-userid") != $("#hdnUserID").val()) {
            //    return false;
            //}
            //var countofuser = 0;
            //for (i = 0; i < userids.length; i++) {
            //    if (userids[i] == $("#hdnCurrentLoggedUserID").val()) {
            //        countofuser = countofuser + 1;
            //    }
            //}
            //if (checkedVals.length > 0 && countofuser != userids.length)
            //    $("#confirmMessageReadDialog").dialog("open");
            //else {
            //    $("<div>" + $("#hdnNoMailSelected").val() + "</div>").dialog({
            //        modal: true,
            //        buttons: {
            //            Ok: function () {
            //                $(this).dialog("close");
            //            }
            //        }
            //    });

            //}

        }


        function ConfirmDelete(flaggedusers) {
            InitializeConfirmDeleteDialog(flaggedusers);
            $("#confirmDeleteDialog").dialog("open");
        }

        function GetCheckedKeywords()
        {
            var checkedkeyword = $('.chkDeleteMessage :checkbox:checked').map(function () {
                return $(this).closest("#trMessage").attr("data-keyword");
            }).get();
            return checkedkeyword;
        }

        function ConfirmDeleteMessage() {

            var checkedVals = $('.chkDeleteMessage :checkbox:checked').map(function () {
                return $(this).parent().attr("data-usermailid");
            }).get();

            
            if (checkedVals.length == 0) {

                $("#divNoCheckedForDeletionDialog").dialog({
                    modal: true,
                    buttons: {
                        Ok: function () {
                            $(this).dialog("close");
                        }
                    }
                });
                return false;
            }


            InitializeConfirmDeleteMessageDialog();
            $("#confirmDeleteMessageDialog").dialog("open");
        }

        function InitializeConfirmReportDialog(el) {
            var translations = {};
            translations["Ok"] = $('#lblOk').text();
            translations["Cancel"] = $('#lblCancel').text();
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
                $(this).dialog("close");
                Report(el);
            }
            buttonsOpts[translations["Cancel"]] = function () {
                $(this).dialog("close");
            }

            $("#confirmDialog").dialog({
                autoOpen: false,
                modal: true,
                buttons: buttonsOpts
            });
        }

        function InitializeConfirmOpenToNewTabDialog(el) {
            var translations = {};
            translations["Ok"] = $('#lblOk').text();
            //translations["No"] = "No";//$('#lblCancel').text();
            //translations["Cancel"] = $('#lblCancel').text();
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
               $(this).dialog("close");
                OpenToNewTab();
            }
            $("#confirmOpenToNewTabDialog").dialog({
                autoOpen: false,
                modal: true,
                width: 360,
                buttons: buttonsOpts
            });

            $(".ui-dialog-buttonpane").append($("#divDontShowOpenToNewTab"));
        }

        function ShowNewMessageAlert() {
            var translations = {};
            translations["Ok"] = $('#lblOk').text();
            var buttonsOpts = {};
            buttonsOpts[translations["Ok"]] = function () {
                $(this).dialog("close");
            }

            $("#divNewMessageAlert").dialog({
                autoOpen: true,
                modal: true,
                buttons: buttonsOpts
            });
        }

        function ShowNeedToReplyAlert() {
            $("<div>" + $("#hdnNeedReply").val() + "</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }



           function OpenToNewTab() {
               setMessageRead();

            var dst = $('#chkDontShowOpenToNewTab').prop("checked");
            var flaggedusers = getArray("FlaggedUsers");
            var users = [];
            setArray('FlaggedUsers', users);
            var url = "";
            var eurl = "";
            var kurl = "";
            var tr = $('#tblMessage tr:last');
            var keyword = "";
            if (tr) {
                keyword = $(tr).attr("data-keyword");
            }
            var kw = GetCheckedKeywords();
            if (kw.length > 0)
            {
                keyword = kw;
            }
            if (dst == true) {
                eurl = "&dst=1";
                $('#chkDontShowOpenToNewTab').prop("checked", false);
                $('#hdnDontShowNewTab').val("true");
            }
            if (keyword.length > 0) {
                kurl = "&k=" + keyword;
            }
            if ((flaggedusers && flaggedusers.length == 1)) {
                url = "SendMessage?dr=1&to=" + flaggedusers + eurl + kurl;
                var windowObjectReference = window.open(url, '_self');
            }
            else if (flaggedusers && flaggedusers.length > 1) {
                url = "SendMessage?dr=1&grp=" + flaggedusers + eurl + kurl;
                var windowObjectReference = window.open(url, '_self');
            }
            else if ($('#<%=hdnUserID.ClientID%>').val().length > 0) {
                url = "SendMessage?dr=1&to=" + $('#<%=hdnUserID.ClientID%>').val() + eurl + kurl;
                var windowObjectReference = window.open(url, '_self');
            }

}


function LoadPrevious() {
    
    var json = { Type: 'loadprevious', userid: $('#hdnUserID').val(), page: $('#hdnPageNumber').val() };

    //$.ajax({
    //    dataType: "json",
    //    url: "../Handler/MailboxHandler.ashx",
    //    data: json,
    //    success: function (data) {
    //        debugger;
    //        var obj = $.parseJSON(data);

    //    }
    //});

    $.post("../Handler/MailboxHandler.ashx", json).done(function (data) {

        var obj = $.parseJSON(data)
    });
}
function GotoFriendsRoom() {
    $(location).attr('href', '<%=Page.ResolveUrl("~/Student/MyFriendsRoom?fid=")%>' + $('#imgAvatar').attr("data-userid"));
}

function ConfirmReport(el) {
    InitializeConfirmReportDialog(el);
    $("#confirmDialog").dialog("open");
}

function ConfirmOpenToNewTab(el) {

        setMessageRead();
        OpenToNewTab();
               
    //if ($('#hdnDontShowNewTab').val() == "true") {
    //    setMessageRead();
    //    OpenToNewTab();
    //    return;
    //}

    //InitializeConfirmOpenToNewTabDialog(el);
    //$("#confirmOpenToNewTabDialog").dialog("open");

}

function Report(el) {

    var json = { Type: 'reportmessage', usermailid: $(el).attr("data-usermailid"), mailto: $('#hdnMailTo').val() };
    $.post("../Handler/GenericPostingHandler.ashx", json, function (data) {
        var obj = $.parseJSON(data);

        if (obj.Status == "True") {
            $("<div>Message reported</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
        }
        else
            $("<div>Error sending mail. Please contact administrator.</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
    });
    return false;
           }

            function setMessageRead() {
                var selected = $('.divUsers.selected');
                if ($(selected).length > 0) {
                    $(selected).find('.mailbox-img').click();
                }
           }

           function setNewMessageToEnable() {
               var unread = $('.divUsers').find(".mailbox-img[data-unread='1']");
               if (unread.length == 0) {
                   enableWriteNew();
               }
           }


          

function MarkMessageAsRead(el) {

    var json = { Type: 'markmessageasread', userid: $(el).attr("data-userid")};
    $.post("../Handler/GenericPostingHandler.ashx", json, function (data) {
        var obj = $.parseJSON(data);

        if (obj.Status == "True") {
            var currentcount = parseInt($('.counter-' + $(el).attr("data-userid")).text());
            var globalcount = parseInt($('.mail_name_lbl').text());
            var totalcount = globalcount - currentcount;
            $('.counter-' + $(el).attr("data-userid")).text("0");
            $('.mail_name_lbl').text(totalcount);
            $(el).attr("data-unread", "0");
            var userid = $(el).attr("data-userid");
            var usermessage = $(".divUsers[data-userid='" + userid + "']").find('.mailbox-img');
            $(usermessage).attr("data-unread", "0");
            if (totalcount == 0) {
                $('.mail_name_lbl_header').hide();
                $('.divUnreadMessageHeader').hide();
                if ($(".divUsers.selected").length > 0)
                    $(".divUsers.selected").find(".mailbox-img").attr("src", "../Images/openmail.png");
                else
                    $(el).attr("src", "../Images/openmail.png");

            }
            
            setNewMessageToEnable();
            $('.message').removeClass("message");
            if (!$(el).hasClass("mailbox-img"))
                $(el).hide();

        }
        else
            $("<div>Error setting Message as read . Please contact administrator.</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
    });
    return false;
}

function RemoveVIP(el) {

    var userid = $('#hdnFlaggedUsers').val();
    var json = { Type: 'removevip', userid: userid };
    $.post("../Handler/MailboxHandler.ashx", json, function (data) {
        var obj = $.parseJSON(data);

        if (obj.Status == "True") {
            var userids = userid.split(",");
            userids.forEach(function (item, index) {
                $('#viptab .divUsers[data-userid="' + item + '"]').remove();
            });
        }
        else
            $("<div>Error setting Message as read . Please contact administrator.</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
    });
    return false;
}

function MarkMessageAsUnRead(el) {

    var checkedVals = $('.chkDeleteMessage :checkbox:checked').map(function () {
        return $(this).parent().attr("data-usermailid");
    }).get();

    var arr = "";
    if (checkedVals.length == 0) {
        return;
    }
    var userids = $('.chkDeleteMessage :checkbox:checked').map(function () {
        return $(this).parent().attr("data-userid");
    }).get();


    for (var i = 0; i < userids.length; i++) {
        if (userids[i] == $("#hdnCurrentLoggedUserID").val()) {
            checkedVals.splice(i, 1);
        }
    }

    if (checkedVals.length > 0) {
        for (var i = 0, len = checkedVals.length; i < len; i++) {
            arr += checkedVals[i] + ",";
        }
    }


    var json = { Type: 'markmessageasunread', userid: $(el).attr("data-userid"), usermailid: arr };
    $.post("../Handler/GenericPostingHandler.ashx", json, function (data) {
        var obj = $.parseJSON(data);
        if (obj.Status == "True") {
            //var currentcount = parseInt($('.counter-' + $(el).attr("data-userid")).text());
            var globalcount = parseInt($('.mail_name_lbl').text());
            var totalcount = globalcount + checkedVals.length;

            $('.counter-' + $(el).attr("data-userid")).text(checkedVals.length);
            $('.mail_name_lbl_header').show();
            $('.mail_name_lbl').text(totalcount);
            //$(el).parent().parent().find('#divUnreadMessage').show();
            $(el).attr("src", "../Images/mail.png");
            //$(el).parent().parent().find('#divUnreadMessage').attr("data-unread", checkedVals.length);
            $('.divUnreadMessageHeader').show();

        }
        else
            $("<div>Error setting Message as read . Please contact administrator.</div>").dialog({
                modal: true,
                buttons: {
                    Ok: function () {
                        $(this).dialog("close");
                    }
                }
            });
    });
    return false;
}

function setArray(key, value) {
    return sessionStorage.setItem(key, JSON.stringify(value));
}
function getArray(key) {
    return JSON.parse(sessionStorage.getItem(key));
}


var flaggedusers = [];
function FlagUnflag(el, e) {
    flaggedusers = getArray('FlaggedUsers');
    if (!flaggedusers)
        flaggedusers = [];

    var ischecked = $(el).is(":checked");
    var userid = $(el).parent().attr("data-userid");
    if (ischecked) {
        if (flaggedusers.indexOf(userid) == -1)
            flaggedusers.push(userid);
    }
    else {
        var index = flaggedusers.indexOf(userid);
        if (index > -1)
            flaggedusers.splice(index, 1);
    }
    setArray('FlaggedUsers', flaggedusers);
}

function ToggleDeleteCloseFriends(e) {
    //$(".list_remove").toggle();
    //e.stopPropagation();
}

function DeleteCloseFriend(el, e) {
    if (confirm("are you sure?")) {
        $('#hdnFlaggedUsers').val($('#' + el.id).attr("data-userid"));
    }
    else {
        e.stopPropagation();
    }

}
var fordeletion = [];
function MarkForDeleteUndelete(el, e) {

    fordeletion = getArray('ForDeletion');
    if (!fordeletion)
        fordeletion = [];

    $('#' + el.id).toggleClass("list_check");
    var userid = $('#' + el.id).closest('#divUsers').attr("data-userid");
    if ($('#' + el.id).hasClass('list_check')) {
        if (fordeletion.indexOf(userid) == -1)
            fordeletion.push(userid);
    }
    else {
        var index = fordeletion.indexOf(userid);
        if (index > -1)
            fordeletion.splice(index, 1);
    }
    setArray('ForDeletion', fordeletion);
    //$('#hdnFlaggedUsers').val(userid);
    e.stopPropagation();
}

function GetFlaggedUsers() {
    
    flaggedusers = getArray("FlaggedUsers");
    $('#hdnFlaggedUsers').val(flaggedusers);
    if (flaggedusers && flaggedusers.length > 0) {
        setArray("FlaggedUsers", []);
        if ($('#hdnAddRemoveVipUserState').val() == "remove") {
            ConfirmDelete(flaggedusers);
            //$("#btnRemoveCloseFriend").click();
        }
        else
            $("#btnAddToCloseFriends").click();
        return true;
    }
    else
        return false;

}

function InformUser() {//commented based on Item 18
    //$("#divInformUserDialog").dialog({
    //    modal: true,
    //    buttons: {
    //        Ok: function () {
    //            $(this).dialog("close");
    //        }
    //    }
    //});
}
function playsoundnow(el, sounds) {
    var s;
    if (sounds.toLowerCase().indexOf("content/sound") == -1)
        s = new buzz.sound('../content/sound/' + sounds);
    else
        s = new buzz.sound(sounds);
    s.load();
    s.play();
}

function PlaySequentialSounds(el) {
    
    var sounds = [];
    $(el).parent().children('span, a').each(function () {
        if ($(this).attr("data-sound") != "" && $(this).attr("data-sound").toLowerCase() != "../content/sound/") {
            if ($(this).attr("data-sound").toLowerCase().indexOf("content/sound") == - 1)
                sounds.push("../content/sound/" + $(this).attr("data-sound"));
            else
                sounds.push($(this).attr("data-sound"));
        }
    });
    //PlayNext1(sounds, 0);
    var soundscount = sounds.length;
    if (soundscount > 0) {
        var myaudio = [];
        var next = 0;
        for (var i = 0; i < soundscount; i++) {
            myaudio[i] = new Audio(sounds[i]);
            myaudio[i].load();
        }
        //$(el).attr('src', '../images/waves.gif');
        $(el).parent().find(".speaker").attr('src', '../images/waves.gif');
        function playnext(element, index) {
            if (next == myaudio.length) {
                $(el).parent().find(".speaker").attr('src', '../images/ICO_Speaker.png');
                return;
            }
            $(element).on('ended', function() {
                next = next + 1;
                if (next == myaudio.length) {
                    $(el).parent().find(".speaker").attr('src', '../images/ICO_Speaker.png');
                    return;
                }
                        
                if (next > myaudio.length)
                    return;
                if (myaudio[next].readyState == 0) {
                    next = next + 1;
                    playnext($(element), index);
                    return;
                }
                myaudio[next].play();
            }).on("error", function () {
                next = next + 1;
                if (myaudio.length > next)
                    myaudio[next].play();
                else {
                    $(el).parent().find(".speaker").attr('src', '../images/ICO_Speaker.png');
                }

            });
        };

        myaudio.forEach(playnext);
        myaudio[0].play();

    } else {
        $(el).parent().find(".speaker").attr('src', '../images/ICO_Speaker.png');
    }
           
}

function AttachPlaysound() {
    $(".paletteContainer").children("span, a").each(function () {
        
        //if (($(this).closest('.tblMessage_conversation') && $(this).closest('.tblMessage_conversation').attr("data-isreply") == "False" &&  $(this).parent().parent().hasClass("bubble1")) || 
        //    ($(this).closest('.tblMessage_conversation') && $(this).closest('.tblMessage_conversation').attr("data-isreply") == "True" && $(this).parent().parent().hasClass("bubble")))
        if (($(this).closest('.tblMessage_conversation') && $(this).parent().parent().hasClass("bubble1")))
        {
            
            if ($(this).hasClass("hasSound")) {
                $(this).parent().attr("data-hassound", "true");
                if ($(this).attr("onclick"))
                    $(this).attr("onclick", $(this).attr("onclick") + "playsoundnow(this,\"" + $(this).attr("data-sound") + "\");");
                else
                    $(this).attr("onclick", "playsoundnow(this,\"" + $(this).attr("data-sound") + "\");");
            }
        }
        //if (($(this).closest('.tblMessage_conversation') && $(this).closest('.tblMessage_conversation').attr("data-isreply") == "False" && $(this).parent().parent().hasClass("bubble1")) ||
        //    ($(this).closest('.tblMessage_conversation') && $(this).closest('.tblMessage_conversation').attr("data-isreply") == "True" && $(this).parent().parent().hasClass("rightpeople"))) {
        if (($(this).closest('.tblMessage_conversation') && $(this).parent().parent().hasClass("bubble")))
        {
            if ($(this).hasClass("hasSound")) {
                $(this).removeClass("hasSound");
            }
        }

    });

    $(".paletteContainer").each(function () {
        if ($(this).attr("data-hassound") == "true") {
            if ($(this).find(".speaker").length == 0) {
                var sentencesound = $($(this).children("span, a")[0]).attr("data-sentencesound");
                var soundimage = "";
                if (sentencesound != undefined && sentencesound.length > 0)
                    soundimage = "<img class=\"speaker\" src=\"../Images/ICO_Speaker.png\" style=\"width:16px; height:16px; float:right;vertical-align:middle;cursor:pointer;float:right;\" onclick=\"playsoundnow(this,'" + sentencesound + "');\" />";

                if ($(this).children("span[data-swapped]").length > 0 || $(this).children("a[data-swapped]").length > 0)
                    soundimage = "<img class=\"speaker\" src=\"../Images/ICO_Speaker.png\" style=\"width:16px; height:16px; float:right;vertical-align:middle;cursor:pointer;float:right;\" onclick=\"PlaySequentialSounds(this, false);\" />";



                $(this).append(soundimage);
            }
        }
    });
    //$(".paletteContainer").each(function () {
    //    if($(this).attr("data-hassound") == "true")
    //    {
    //        var soundimage = "<img class=\"speaker\" src=\"../Images/ICO_Speaker.png\" style=\"width:16px; height:16px; float:right;vertical-align:middle;cursor:pointer;float:right;\" onclick=\"PlaySequentialSounds(this);\" />";
    //        $(this).append(soundimage);
    //    }
    //});

           }

           function SwitchWords() {
            if ($('#hdnSwitchWord').val() == 'true') {
                $(".secondword").each(function () {
                    if ($(this).attr("data-switchword") != "") {
                        $(this).text($(this).attr("data-switchword"));
                    }
                });
            }
            else {
                $(".secondword").each(function () {
                    if ($(this).attr("data-word") != "") {
                        $(this).text($(this).attr("data-word"));
                    }
                });

            }

        }


    </script>
   
    <div class="MailBox_Frame_Holder" id="MailBox_Frame_Holder">
        <asp:HiddenField ID="hdnDemoMessage" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnSwitchWord" runat="server" ClientIDMode="Static" />
        <div id="confirmDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="lblDialogMessage" runat="server" Text=""  meta:resourcekey="lblDialogMessageResource1"></asp:Label><br />
        </div>
        <div id="confirmOpenToNewTabDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="lblOpenToNewTab" runat="server" Text=""  meta:resourcekey="lblOpenToNewTabResource1"></asp:Label><br />
            <div id="divDontShowOpenToNewTab">
             <asp:CheckBox ID="chkDontShowOpenToNewTab" runat="server" ClientIDMode="Static"/>&nbsp;<asp:Label ID="lblDontShowOpenToNewTab" runat="server" ClientIDMode="Static" meta:resourcekey="lblDontShowOpenToNewTabResource1">Dont't display this again.</asp:Label>
        </div>

        </div>
        <div id="confirmMessageReadDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="lblReadMessage" runat="server" Text=""  meta:resourcekey="lblReadMessageResource1"></asp:Label><br />
        </div>
        <div id="divInformUserDialog" title="" style="display:none;">
            <asp:Label ID="lblInformUser" runat="server" Text=""  meta:resourcekey="lblInformUserResource1"></asp:Label>
        </div>
        <div id="confirmDeleteDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="Label1" runat="server" Text=""  meta:resourcekey="lblconfirmDeleteDialogMessageResource1" style="text-align:center;display:inline-block;"></asp:Label><br />
        </div>
        <div id="confirmDeleteMessageDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="Label2" runat="server" Text=""  meta:resourcekey="lblconfirmDeleteMessageTrailDialogResource1"></asp:Label><br />
        </div>
        <div id="divNoCheckedForDeletionDialog" title="&nbsp;" style="display:none;">
            <asp:Label ID="lblNoCheckedForDeletion" runat="server" Text=""  meta:resourcekey="lblNoCheckedForDeletionResource1"></asp:Label><br />
        </div>
        <div id="divNewMessageAlert" title="" style="display:none;">
            <asp:Label ID="lblNewMessageAlert" runat="server" Text=""  meta:resourcekey="lblNewMessageAlertResource1"></asp:Label>
        </div>
        <asp:Label ID="lblOk" runat="server" meta:resourcekey="hdnlblOkResource1" ClientIDMode="Static" style="display:none;"/>
        <asp:Label ID="lblYes" runat="server" meta:resourcekey="hdnlblYesResource1" ClientIDMode="Static" style="display:none;"/>
        <asp:Label ID="lblNo" runat="server" meta:resourcekey="hdnlblNoResource1" ClientIDMode="Static" style="display:none;"/>
        <asp:Label ID="lblCancel" runat="server" meta:resourcekey="hdnlblCancelResource1" ClientIDMode="Static" style="display:none;"/>
        <asp:HiddenField ID="hdnMailTo" Value="info@languagediscovery.org"  meta:resourcekey="hdnMailToResource1" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnNoMailSelected" Value="Choose the message you want to mark as unread."  meta:resourcekey="hdnNoMailSelectedResource1" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnNeedReply" Value="These are the messages not responded. Let's reply!"  meta:resourcekey="hdnNeedReplyResource1" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="hdnDontShowNewTab" runat="server" ClientIDMode="Static" />
        <asp:HiddenField ID="hdnCurrentLoggedUserID" runat="server" ClientIDMode="Static" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:HiddenField ID="hdnAddRemoveVipUserState" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnFlaggedUsers" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnSelectedTab" runat="server" ClientIDMode="Static" Value="0"/>
                <asp:HiddenField ID="hdnSelectedAccordion" runat="server" ClientIDMode="Static"/>
                <asp:HiddenField ID="hdnPageNumber" Value="1" runat="server" ClientIDMode="Static" />
                <asp:HiddenField ID="hdnDeleteCloseFriends" Value="1" runat="server" ClientIDMode="Static"  meta:resourcekey="hdnDeleteCloseFriendsResource1" />
                <asp:HiddenField ID="hdnAddToCloseFriends" Value="1" runat="server" ClientIDMode="Static"  meta:resourcekey="hdnAddToCloseFriendsResource1" />
                <asp:Button ID="btnRemoveCloseFriend" runat="server"  OnClick="btnRemoveCloseFriend_Click" ClientIDMode="Static" style="display:none;"/>
                <asp:Button ID="btnAddToCloseFriends" runat="server"  OnClick="btnAddToCloseFriends_Click" ClientIDMode="Static" style="display:none;"/>

                <div class="list_mail" id="list_mail">

                    <asp:HiddenField ID="hdnUserID" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="hdnSelectedUser" runat="server" ClientIDMode="Static" />
                    <asp:HiddenField ID="hdnName" runat="server" ClientIDMode="Static" />

                    <div class="mail_box_search" id="mail_box_search">
                        <asp:Label ID="lblSearchName" CssClass="lblEmailName_Mailbox" runat="server" Text="Email or Name" AssociatedControlID="txtSearch" meta:resourcekey="lblSearchNameResource1"></asp:Label>
                        <div id="txtsearch_mailbox">
                            <asp:TextBox ID="txtSearch" CssClass="mailbox_smcsc_search_txt" ClientIDMode="Static" runat="server" meta:resourcekey="txtSearchResource1"></asp:TextBox>
                        <%--</div>
                        <div class="btnsearch_mailbox" id="btnsearch_mailbox">--%>
                            <asp:ImageButton CssClass="btnsearch_mailbox" ID="imgSearch" ImageUrl="~/Images/SearchF.png" BorderColor="Transparent" BackColor="Transparent" runat="server" Width="12px" Height="13px" OnClick="imgSearch_Click" ClientIDMode="Static" meta:resourcekey="ImageButton1Resource1"/>
                        </div>
                    </div>
                    <div class="Tabs_Container" id="Tabs_Container">
                        <div id="msgtabs">
                             <div class="tabs_menu_container">
                                  <ul  id="tabs_header">
                                    <li><asp:HyperLink  ID="AllLink" href="#alltab" runat="server" Text="All" meta:resourcekey="AllLinkResource1"/></li>
                                    <li style="display: none;"><asp:HyperLink ID="SchoolLink" href="#schooltab" runat="server" Text="School" meta:resourcekey="SchoolLinkResource1" /></li>
                                    <li><asp:HyperLink ID="VIPLink" href="#viptab" runat="server" Text="Close friends" meta:resourcekey="VIPLinkResource1" style="padding-left:1px;padding-right:1px;" /></li>
                                    <li style="float: right;margin-top: -5px;"><asp:ImageButton ID="imgAddRemoveToVIP"  data-state="add" ImageUrl="~/Images/new/add friends.png" ClientIDMode="Static" runat="server" style="cursor:pointer;" OnClientClick="var x = GetFlaggedUsers(); return x;" ToolTip="Add to Close Friends" OnClick="imgAddToVIP_Click" meta:resourcekey="imgAddRemoveToVIPResource1" /></li>
                                  </ul>
                            </div>
                                <div id="divStatusContainerLegend">
                                    <img src="../Images/mail.png" class="imgUnread" />
                                    <asp:Label runat="server" id="lblunread" CssClass="labelLegend" meta:resourcekey="lblunreadResource1">Unread</asp:Label>
                                    <img src="../Images/red-flag.png" class="imgNotReplied" />
                                    <asp:Label runat="server" id="lblNotReplied" CssClass="labelLegend" meta:resourcekey="lblNotRepliedResource1">Not replied</asp:Label>
                                </div>
                            <div class="mailbox_frnd_container" id="alltab">
                                <asp:Repeater ID="rptFriends" runat="server">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div id="divUsers" class="divUsers" role="button" onclick="SelectUser(this);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>" data-IsReplied="<%# Eval("IsReplied") %>">
                                        
                                            <asp:CheckBox ID="chkSelectUser" CssClass="chkSelectUser" ClientIDMode="Static" runat="server" data-userid='<%# Eval("UserID") %>' style="float:left;margin:auto;" onclick="FlagUnflag(this, event);"/>
                                            <div class="divUser_avatar" id="divUser_avatar">
                                                <img src='<%# Eval("Avatar") %>' style="width:45px;height:45px;">
                                                <div class="statusContainer">
                                                    <img class="imageStatus" src='<%# Eval("StatusImage") %>'/>
                                                    <span class="label_Status" id="Span4" style="font-size: x-small;"><%# Eval("OnlineStatusText") %></span>    
                                                </div>
                                            </div>
                                            <div class="divUser_avatar_info" id="divUser_avatar_info">
                                                <span class="divUser_Avatar_Name" id="divUser_Avatar_Name"><%# Eval("FirstName") %></span><br/>
                                                <span class="divUser_Avatar_Name" id="divUser_Avatar_Other_Info"><%# Eval("UserName") %></span><br />
                                                <span class="divUser_Avatar_Name" id="divUser_Avatar_address"><%# Eval("Address") %></span>
                                                
                                            </div>
                                            <div class="divuser-msg-identification">
                                                <asp:ImageButton ID="imgMail" CssClass="mailbox-img" data-unread='<%# Eval("UnReadMessageCount") %>'  data-userid='<%# Eval("UserID") %>' runat="server" OnClientClick="ConfirmMessageRead(this, event); return false;" ImageUrl='<%# "../Images/" + Eval("MailIcon") %>' Width="24px" Height="16px"  meta:resourcekey="imgAvatarResource2" /><span style="display: none;" class="mailbox-img-counter counter-<%# Eval("UserID") %>"  ><%# Eval("UnReadMessageCount") %></span>
                                                <span style="font-size: x-small;"><%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString() %></span>
                                            </div>
                                            <div id="divStatusContainer">
<%--                                                <div id="divUnreadMessage" class="divMailIconContainer divunread" data-userid="<%# Eval("UserID") %>" onclick="MarkMessageAsRead(this);" data-unread="<%# Eval("UnReadMessageCount") %>">
                                                    <img src="../Images/mail.png" class="imgUnread">
                                                </div>--%>
                                                <div id="divUnrepliedMessage" class="divMailIconContainer divunreplied divunread" data-userid="<%# Eval("UserID") %>" onclick="MarkMessageAsRead(this);">
                                                    <img src="../Images/red-flag.png" class="imgNotReplied">
                                                </div>
                                            </div>
                                            <div class="divuser-msg-flag" style="display:none;">
                                                <asp:Image ID="imgflag" CssClass="msg_unflagged" runat="server" ImageUrl="~/Images/strip_metro7.png" Width="16px" Height="16px" style="display:none;border-style:none;"  meta:resourcekey="imgflagResource2"  onclick="FlagUnflag(this); return false;" />
                                                <asp:Label ID="lblflag" CssClass="msg_unflagged" runat="server" onclick="FlagUnflag(this, event); return false;" ></asp:Label>
                                            </div>
                                    
                                        <div style='clear:both;'></div>
                                        <%--<asp:Image runat="server" id="imgflameUser" CssClass="imgflameUser" ClientIDMode="Static" ImageUrl="../Images/flame.png" style="width: 24px; height: 24px;position: relative; left: 0px; margin-top: -25px; float: left; display: none;"/>--%>
                                    
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>   
                            </div>
                            <div class="mailbox_frnd_container" id="schooltab" style="display: none;">
                                <div id="accordion">
                                    <div>
                                        <label style="margin-left:50%;">ALL</label>
                                        <div style="float:left;margin-top:-15px;margin-left:15px;">
                                            <asp:Image ID="Image1"  runat="server" ImageUrl="~/Images/accordionmail.png" Width="24px" Height="24px"  meta:resourcekey="imgAvatarResource2"  />
                                            <div style="clear:both;"></div>
                                            <asp:Label ID="lblAllUnreadMessageCount" runat="server" ClientIDMode="Static" style="margin-left:5px;">0</asp:Label>
                                        </div>
                                        <center>
                                            <div class="btnReplyAll" id="btnReplyAllSchoolUsers" style="bottom:-10px;text-decoration:underline;color:blue;width:auto;display:inline-block;margin-left:-10px;border:1px solid orange;"><asp:Localize ID="Localize1" runat="server" Text="Reply all"  meta:resourcekey="btnReplyAllResource1"></asp:Localize></div>
                                        </center>
                                    </div><br />
                                    <asp:Repeater ID="rptSchool" runat="server">
                                        <HeaderTemplate>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <h3 class="headeritem">
                                                <div>
                                                    <center><label><%# Eval("SchoolCode") %></label></center>
                                                    <div style="float:left;margin-top:-15px;margin-left:-20px;">
                                                        <asp:Image ID="Image1"  runat="server" ImageUrl="~/Images/accordionmail.png" Width="24px" Height="24px"  meta:resourcekey="imgAvatarResource2" style="float:left;" />
                                                        <div style="clear:both;"></div>
                                                        <span style="float:left;margin-left:5px;"><%# Eval("UnReadMessageCount") %></span>
                                                
                                                    </div>
                                                    <center>
                                                        <div class="btnReplyAll" style="bottom:-5px;color:blue;width:auto;display:inline-block;border:1px solid orange;"><asp:Localize ID="Localize1" runat="server" Text="Reply all"  meta:resourcekey="btnReplyAllResource1"></asp:Localize></div>
                                                    </center>
                                                </div>
                                            </h3>
                                            <div>
                                             <asp:Repeater ID="rptSchoolUsers" runat="server">
                                                <HeaderTemplate>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <div id="divUsers" class="divUsers"  onclick="SelectSchoolUser(this,event);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>" data-IsReplied="<%# Eval("IsReplied") %>">
                                                        <asp:CheckBox ID="chkSelectUser" ClientIDMode="Static" runat="server" data-userid='<%# Eval("UserID") %>' style="float:left;margin:auto;" onclick="SelectUser(this,true);FlagUnflag(this);"/>
                                                        <div class="divUser_avatar" id="divUser_avatar">
                                                            <img src='<%# Eval("Avatar") %>' style="width:45px;height:45px;">
                                                        </div>
                                                        <div class="divUser_avatar_info" id="divUser_avatar_info">
                                                            <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_Name"><%# Eval("FirstName") %></span><br/>
                                                            <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_Other_Info"><%# Eval("UserName") %></span><br />
                                                            <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_address"><%# Eval("Address") %></span>
                                                            <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="Span2"><img src='<%# Eval("StatusImage") %>'/><%# Eval("OnlineStatusText") %></span>
                                                        </div>
                                                        <div class="divuser-msg-identification">
                                                            <asp:Image ID="Image1" CssClass="mailbox-img" runat="server" data-userid='<%# Eval("UserID") %>'  OnClientClick="ConfirmMessageRead(this,event); return false;" ImageUrl="~/Images/mail.png" Width="24px" Height="16px"  meta:resourcekey="imgAvatarResource2" /><span style="display: none;" class="mailbox-img-counter counter-<%# Eval("UserID") %>"><%# Eval("UnReadMessageCount") %></span>
                                                        </div>
                                                        <div class="divuser-msg-flag" style="display: none;">
                                                            <asp:Image ID="imgflag" CssClass="msg_unflagged" runat="server" Width="16px" Height="16px"  meta:resourcekey="imgflagResource2"  onclick="FlagUnflag(this,event); return false;" style="display:none;"/>
                                                            <asp:Label ID="lblflag" CssClass="msg_unflagged" runat="server" onclick="FlagUnflag(this, event); return false;" ></asp:Label>
                                                        </div>
                                                    <div style='clear:both;'></div>
                                                    </div>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                </FooterTemplate>
                                            </asp:Repeater> 
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="mailbox_frnd_container" id="viptab">
                                 <asp:Repeater ID="rptVip" runat="server">
                                    <HeaderTemplate>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                    
                                        <div id="divUsers" class="divUsers" role="button" onclick="SelectUser(this);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>" data-IsReplied="<%# Eval("IsReplied") %>">
                                            <asp:CheckBox ID="chkSelectUser" ClientIDMode="Static" runat="server" data-userid='<%# Eval("UserID") %>' style="float:left;margin:auto;" onclick="SelectUser(this,true);FlagUnflag(this);"/>
                                            <div class="divUser_avatar" id="divUser_avatar">
                                                <img src='<%# Eval("Avatar") %>' style="width:45px;height:45px;">
                                                <div class="statusContainer">
                                                    <img class="imageStatus" src='<%# Eval("StatusImage") %>'/>
                                                    <span class="label_Status" id="Span4" style="font-size: x-small;"><%# Eval("OnlineStatusText") %></span>    
                                                </div>
                                            </div>
                                            <div class="divUser_avatar_info" id="divUser_avatar_info">
                                                <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_Name"><%# Eval("FirstName") %></span><br/>
                                                <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_Other_Info"><%# Eval("UserName") %></span><br />
                                                <span class="divUser_Avatar_Name divUser_Avatar_Other_Info" id="divUser_Avatar_address"><%# Eval("Address") %></span>
                                                
                                            </div>
                                            <div class="divuser-msg-identification">
                                                <asp:ImageButton ID="imgMail" CssClass="mailbox-img" data-unread='<%# Eval("UnReadMessageCount") %>'  data-userid='<%# Eval("UserID") %>' runat="server" OnClientClick="ConfirmMessageRead(this, event); return false;" ImageUrl='<%# "../Images/" + Eval("MailIcon") %>' Width="24px" Height="16px"  meta:resourcekey="imgAvatarResource2" /><span style="display: none;" class="mailbox-img-counter counter-<%# Eval("UserID") %>"  ><%# Eval("UnReadMessageCount") %></span>
                                                <span style="font-size: x-small;"><%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString() %></span>
                                                <asp:Image ID="Image1" style="display:none;" CssClass="mailbox-img" runat="server" data-userid='<%# Eval("UserID") %>' OnClientClick="ConfirmMessageRead(this, event); return false;" ImageUrl="~/Images/mail.png" Width="24px" Height="16px"  meta:resourcekey="imgAvatarResource2" /><span style="display: none;" class="mailbox-img-counter counter-<%# Eval("UserID") %>"><%# Eval("UnReadMessageCount") %></span>
                                            </div>
                                            <div class="divuser-msg-flag" style="display: none;">
                                                <asp:Image ID="imgflag" CssClass="msg_unflagged" runat="server" Width="16px" Height="16px"  meta:resourcekey="imgflagResource2"  onclick="FlagUnflag(this); return false;" style="display:none;"/>
                                                <asp:Label ID="lblflag" CssClass="msg_unflagged" runat="server" onclick="FlagUnflag(this, event); return false;"></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblRemoveCloseFriend" CssClass="list_remove"  runat="server" data-userid='<%# Eval("UserID") %>' style="display:none;"></asp:Label>
                                            </div>
                                            <div style='clear:both;'></div>
                                    
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                    </FooterTemplate>
                                </asp:Repeater>   
                            </div>
                        </div>
                        <div id="divInfo" style="margin-top: 60px; text-align: center">
                            <asp:Label ID="lblCheckedUserInfo" runat="server" meta:resourcekey="lblCheckedUserInfoResource1" ClientIDMode="Static" ForeColor="red" Font-Size=".95em" ></asp:Label>
                        </div>
                    </div>
                 </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Button ID="btnGetUserMessage" runat="server" Text="Get User" style="display:none;" ClientIDMode="Static" OnClick="btnGetUserMessage_Click" meta:resourcekey="btnGetUserMessageResource1" />
                <div class="mailbox_ChatRoom" id="mailbox_ChatRoom">
                    <div class="mailbox_chatroom_profile" id="mailbox_chatroom_profile">
                        <div id="divUser" runat="server" style="display:none;">
                            <div class="mcp_avatar" id="mcp_avatar">
                                <asp:Image ID="imgAvatar" style="cursor:pointer;" CssClass="mcp_avatar_img" runat="server" Width="80px" Height="80px" ClientIDMode="Static" meta:resourcekey="imgAvatarResource1" onclick="GotoFriendsRoom();"/>
                            </div>
                            <div class="mcp_information" id="mcp_information">
                                <asp:Label ID="lblFirstNAme" CssClass="mcp_information_name" runat="server" meta:resourcekey="lblFirstNAmeResource1" ClientIDMode="Static" onclick="GotoFriendsRoom();" style="cursor:pointer;"></asp:Label><br />
                                <asp:Label ID="lblLastName" CssClass="mcp_information_others" runat="server" meta:resourcekey="lblLastNameResource1"></asp:Label><br />
                                <asp:Label ID="lblAddress" CssClass="mcp_information_others" runat="server" meta:resourcekey="lblAddressResource1"></asp:Label><br />
                                <asp:Image ID="imgStatus" CssClass="mcp_information_others" runat="server" meta:resourcekey="imgStatusResource1"/><asp:Label ID="lblOnlineStatusText" CssClass="mcp_information_others" runat="server" meta:resourcekey="lblOnlineStatusTextResource1"></asp:Label><br />
                                <asp:Image ID="imgLike" runat="server" ImageUrl="~/Images/heartUnlike.png" meta:resourcekey="imgLikeResource1" style="display: none;"/>&nbsp;<asp:Label ID="lblLikeCount" CssClass="mcp_information_others" runat="server" style="margin-right:5px;display: none;" meta:resourcekey="lblLikeCountResource1"></asp:Label><asp:Label ID="lblStatusText" CssClass="mcp_information_others" runat="server" meta:resourcekey="lblStatusTextResource1"></asp:Label>
                            </div>
                        <div style='clear:both;'></div>
                        </div>
                    </div>

                    <div id="divMessage" class="divMessage">
                        <asp:Repeater ID="rptConversation" runat="server" ClientIDMode="Static" OnItemDataBound="rptConversation_ItemDataBound">
                            <HeaderTemplate>
                                <asp:Button ID="btnLoadPrevious" runat="server" Text="Load Previous..." OnClientClick="LoadPrevious(); return false;" Visible="false" />
                                <table id="tblMessage" class="tblMessage">
                            </HeaderTemplate>
                                <ItemTemplate>
                                    <tr runat="server" id="trMessage" data-keyword='<%# Eval("Keyword") %>' data-userid='<%# Eval("SenderID") %>'>
                                        <td style="vertical-align:top;">
                                            <asp:CheckBox id="chkDeleteMessage" runat="server" ClientIDMode="Static" CssClass="chkDeleteMessage" data-usermailid='<%# Eval("UserMailID") %>' data-userid='<%# Eval("SenderID") %>'></asp:CheckBox>
                                            <asp:Image ID="imgAvatarYou" CssClass="imgAvatarYou" runat="server" Width="65px" Height="65px" meta:resourcekey="imgAvatarYouResource1"/>
                                        </td>
                                        <td class="tblMessage_conv">
                                            <div style="width:100%;text-align:center;">
                                                <span style="width:100%;text-align:center;"><%# Convert.ToDateTime(Eval("CreateDate")).ToShortDateString() %></span>
                                            </div>
                                            <div class="tblMessage_conversation" data-isreply="<%# Eval("IsReply") %>">
                                                <span class="<%# Eval("CssClass") %>" id="msg_conversation" style="word-wrap:break-word; width:40%;"><%# Eval("NativeLanguageMessage") == null ? string.Empty : Server.HtmlDecode(Eval("NativeLanguageMessage").ToString() )%>
                                                </span>
                                           <%-- </div>
                                            <div class="tblMessage_conv_eng">--%>
                                                <span class="bubble1" style="word-wrap:break-word; background-color:#ccffff; border:#ccffff !important; width:40%;"><%# Server.HtmlDecode( Eval("LearningLanguageMessage").ToString() )%>
                                                    
                                                    <asp:ImageButton ID="imgReport" CssClass="imgReport" ClientIDMode="Static" runat="server" data-usermailid='<%# Eval("UserMailID") %>' meta:resourcekey="imgReportResource1" ImageUrl="~/Images/block.png" style="" ToolTip="Report this Problem Message" Visible='<%# Convert.ToBoolean(Eval("IsReply")) ? false : true%>' OnClientClick="ConfirmReport(this); return false;"/>
                                                    <asp:ImageButton ID="imgLikeMessage" CssClass="imgLikeMessage" ClientIDMode="Static" runat="server" data-usermailid='<%# Eval("UserMailID") %>' meta:resourcekey="imgLikeMessageResource1" ImageUrl="../Images/default_star.png" data-swap="../Images/like_star.png" style="" ToolTip="Click this if you like the message!" Visible='<%# Convert.ToBoolean(Eval("IsReply")) ? false : true%>' OnClientClick="return false;"/>
                                                    <%--<asp:Image runat="server" id="imgflameMessage" CssClass="imgflameMessage" ClientIDMode="Static" ImageUrl="../Images/flame.png" data-cssclass='<%# Eval("CssClass") %>' Visible='<%# !(Convert.ToBoolean(Eval("IsLastMessage")) && Eval("CssClass").ToString().Contains("bubble me")) ? false : true%>'/>--%>
                                                    </span>
                                            </div>
                                        </td>
                                        <td style="vertical-align:top;">
                                            <asp:Image ID="imgAvatarMe" CssClass="imgAvatarMe" runat="server" Width="65px" Height="65px" meta:resourcekey="imgAvatarMeResource1"/>
                                            
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            <FooterTemplate>
                                </table>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                    <div class="btn_MailBox" id="btn_MailBox">
                        <%--<asp:Button ID="imgDeleteMessage_backup" CssClass="btnWriteBack_GoHome"  BorderStyle="None" runat="server" style="display:none;" ClientIDMode="Static" Text="Delete" meta:resourcekey="imgDeleteMessageResource1" />--%>
                        <asp:ImageButton ID="imgDeleteMessage" runat="server" ClientIDMode="Static" ImageUrl="~/Images/new/delete.png" />
                        <asp:ImageButton ID="imgDeleteMessagePost" runat="server" ClientIDMode="Static" OnClick="imgDeleteMessage_Click" style="display:none;"/> 
                        <asp:Button ID="btnWriteBackPostBack" style="display:none;background-image:url('../Images/btnWriteBack.png');" Height="36px" BorderStyle="None" runat="server" Text="Write Back" OnClick="btnWriteBack_Click" meta:resourcekey="btnWriteBackResource1" ClientIDMode="Static" />
                        <asp:Button ID="btnWriteBackGroup" CssClass="btnWriteBack_GoHome" style="display:none;background-color:Transparent; cursor:pointer; background-repeat:no-repeat; background-position:left; padding-left:15px;" Height="36px" BorderStyle="None" Width="224px"  runat="server" Text="Write Back to Selected Friends" OnClientClick="return CheckRecipient();" OnClick="btnWriteBack_Click" meta:resourcekey="btnWriteBackResource11" />
                        <%--<asp:Button ID="btnGoTohome" CssClass="btnWriteBack_GoHome"  BorderStyle="None" runat="server" ClientIDMode="Static" Text="Go to Home" OnClick="btnGoTohome_Click" meta:resourcekey="btnGoTohomeResource1" />--%>
                        <asp:ImageButton ID="btnGoTohome" runat="server" ClientIDMode="Static" ImageUrl="~/Images/new/home.png" OnClick="btnGoTohome_Click" />
                        <%--<asp:Button ID="btnWriteBack" ClientIDMode="Static" CssClass="btnWriteBack_GoHome" BorderStyle="None" runat="server" Text="Write Back" OnClientClick="return CheckRecipient();" meta:resourcekey="btnWriteBackResource1" />--%>
                        <asp:ImageButton ID="btnWriteBack" runat="server" ClientIDMode="Static" OnClientClick="return CheckRecipient();" ImageUrl="~/Images/new/reply2.png" />
                    </div>
                </div>
                <div style="clear:both;"></div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    
  
</asp:Content>
