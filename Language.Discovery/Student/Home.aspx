<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Language.Discovery.Student.Home" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <%--flagicons created by IconDrawer (Eugen Buzuk) http://www.icondrawer.com/--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../Scripts/jquery-1.9.1.js"></script>
    <script src="../Scripts/jquery-ui-1.10.3.min.js"></script>
    <script src="../Scripts/jquery.blockUI.js"></script>
    <link href="../colorbox/colorbox.css" rel="stylesheet" />
    <script src="../colorbox/jquery.colorbox.js"></script>
    <script src="../Scripts/Others.js?xx"></script>
    <script src="../Scripts/jquery-clearsearch.js"></script>


    <style>
        .scr {
            vertical-align: super;
            font-size: smaller;
        }

        .liUser {
            cursor: pointer;
            display: flex;
            align-items: center;
            height: 70px;
        }

        .rowrankselect {
            cursor: pointer;
        }

            .rowrankselect:hover {
                background-color: orange;
                color: white;
            }

        #tblRanking, #tblRanking th, #tblRanking td {
            border: 1px solid black;
        }

        .ui-dialog .ui-dialog-title {
            font-size: x-large;
            text-align: center;
        }

        .ui-dialog {
            z-index: 99999;
        }
        /*.ui-icon-closethick
        {
            background-image:url('../Images/x.png') !important;
        }*/
        .ui-icon-closethick {
           background-image: url(../Images/cancel.png) !important;
    background-size: cover;
    margin-left: -30px !important;
    margin-top: -14px !important;
    outline: none;
    background-position: unset !important;
    top: 0 !important;
    left: 0 !important;
    outline:none;
        }
        .ui-dialog .ui-dialog-titlebar-close {
            background: none !important;
            border: none !important;
        }
            .ui-dialog .ui-dialog-titlebar-close, .ui-dialog .ui-dialog-titlebar-close:hover {
                padding: 0 !important;
            }
            .ui-icon
            {
                width: 48px;
                height: 48px;
            }
        ::-webkit-scrollbar {
            width: 8px;
            height: 10px;

          }
          .new_notice_content::-webkit-scrollbar-thumb, .Tnew_notice_content::-webkit-scrollbar-thumb {
            border-radius: 8px;
            background: rgba(251,200,67,1);
          }
    </style>
    <script type="text/javascript">

        function AddLocalstorage(userid) {
            localStorage.setItem("UserID", userid);
        }

        $(function () {
            $(".newsImage").colorbox({ width: '500px', height: '500px', innerWidth: 500, innerHeight: 500 });
            $(".noticeImage").colorbox({ width: '500px', height: '500px', innerWidth: 500, innerHeight: 500 });
            $('#imgReplyFirst').click(function () {
                location.href = "Mailbox";
            });

            //var isSafari = !!navigator.userAgent.match(/Version\/[\d\.]+.*Safari/);
            $(".txtsearch_box").clearable();
            //Temporary commented 08-08-2019
            //if ($('#hdnVideoUrl').val() == "") {
            //    $('#frmVideo').attr("src", $('#hdnVideoUrl').val());
            //    if ($('#hdnDontShowVideo').val().toLowerCase() == "false") {
            //        $("#divVideo").dialog({
            //            autoOpen: true,
            //            height: 600,
            //            width: 634,
            //            modal: true,
            //            buttons:
            //                {
            //                    Ok: function () {
            //                        $(this).dialog("close");
            //                        $('#hdnDontShowVideo').val($('#chkDontShowVideo').prop("checked"));
            //                        $('#btnPostback').click();
            //                    }
            //                },
            //            close: function () {
            //                $('#frmVideo').attr("src", "");
            //            }
            //        });

            //        $(".ui-dialog-buttonpane").append($("#divchkDontShowVideo"));
            //    }
            //}

            MakeRankingOrdinal();
        });
       
        function nth(n) {
            return ["st", "nd", "rd"][((n + 90) % 100 - 10) % 10 - 1] || "th"
        }
        function ShowPicture() {
             $("a.gallery").colorbox();
             return false;
         }
        function MakeRankingOrdinal() {
            $('.scr').each(function () {

                var rank = parseInt($(this).attr("data-ranking"));
                rank = nth(rank);
                $(this).text(rank);
            });
        }
        function InitializeTabs() {
            $('#tabs').tabs({
                activate: function (event, ui) { //bind click event to link
                    $("#<%=hdnSelectedTab.ClientID%>").val(ui.newTab.index());

                    //$('#btnContinuetab' + ui.newTab.index()).show();
                    //$('#btnContinuetab' + ui.oldTab.index()).hide();

                    //if (ui.newTab.index() == 2) // New Palaygo joiner
                    //{
                    //    $('#btnContinue').show();
                    //}
                    //else {
                    //    $('#btnContinue').hide();
                    //}
                    //$('#imgSearch').click();
                    //alert('You chose tab index ' + ui.newTab.index());
                }
            });


            //$('#tabs').tabs("option", "active", $("#<%=hdnSelectedTab.ClientID%>").val());
        }
        function SetDefaultTab() {
            $('#tabs').tabs("option", "active", $("#<%=hdnSelectedTab.ClientID%>").val());
            $('#tabs').tabs("option", "activate", function (event, ui) { //bind click event to link
                $("#<%=hdnSelectedTab.ClientID%>").val(ui.newTab.index());
                $('#imgSearch').click();
                //$('#btnContinuetab' + ui.newTab.index()).show();
                //$('#btnContinuetab' + ui.oldTab.index()).hide();

            });

        }

        function SendToAllFriends(tabNum) {
            var selectedusers = "";
            var count = 0;
            $('#tab' + tabNum + '>.userBlock').each(function (i, obj) {
                count++;
                selectedusers = selectedusers + $(obj).attr("data-userid") + ",";
                if (count == 20)
                    return false;
            });//.data("data-userid");
            if (selectedusers != "")
                $(location).attr('href', '<%=Page.ResolveUrl("~/Student/SendMessage")%>' + '?grp=' + selectedusers);
        }


            //var prm = Sys.WebForms.PageRequestManager.getInstance();

            //prm.add_endRequest(function(s, e) {
            //    $('#tabs').tabs({selected:  $("#<%=hdnSelectedTab.ClientID%>").val(),
        //        activate: function (event, ui) { //bind click event to link
        //             $("#<%=hdnSelectedTab.ClientID%>").val(ui.newTab.index());
        //             
        //             //alert('You chose tab index ' + ui.newTab.index());
        //         }
        //     });
        //     $('#tabs').tabs("option", "active", $("#<%=hdnSelectedTab.ClientID%>").val());

        //BlockElement();
        //UnBlockElement();
        // });

        function pageLoad(sender, args) {
            $(function () {
                $(".imglike").click(function () {
                    $('.userBlock').removeAttr("onclick");
                    var onclickevent = $('.userBlock').attr("onclick");
                    var img = $(this);
                    var json = { Type: 'like', userid: $(this).attr("data-userid"), userstatusid: $(this).attr("data-userstatusid"), ilike: $(this).attr("data-ilike") };
                    $.post("../Handler/GenericPostingHandler.ashx", json, function (data) {
                        var obj = $.parseJSON(data)

                        if (obj.Status == "True") {
                            if (json.ilike.toLowerCase() == "true") {
                                img.attr("src", '../Images/heartLike.png');
                                img.attr("data-ilike", "false");
                                var likecount = img.siblings('.likecount').text();
                                img.siblings('.likecount').text(parseInt(likecount) - 1)
                            }
                            else {
                                img.attr("src", '../Images/heartUnlike.png');
                                img.attr("data-ilike", "true");
                                var likecount = img.siblings('.likecount').text();
                                img.siblings('.likecount').text(parseInt(likecount) + 1)
                            }
                        }
                        else
                            alert('Error updating your status.');
                    });
                    $('.userBlock').attr("onclick", onclickevent);
                });



            });

        }

        function InitializeDiscoverNewFriendsDialog() {

            var translations = {};
            translations["Continue"] = $('#lblContinue').text();
            translations["Cancel"] = $('#lblCancel').text();
            var buttonsOpts = {};
            buttonsOpts[translations["Continue"]] = function () {

                if (sessionStorage.getItem("selectedUser") != null)
                    $(location).attr('href', '<%=Page.ResolveUrl("~/Student/SendMessage")%>' + '?grp=' + sessionStorage.getItem("selectedUser"));

                $(this).dialog("close");
                $("#results").html("");
                $("[id*=chkInterestGroup] input").each(function () {
                    $(this).removeAttr('checked');
                });
                $("[id*=chkGenderList] input").each(function () {
                    $(this).removeAttr('checked');
                });


            }
            buttonsOpts[translations["Cancel"]] = function () {
                $("#results").html("");
                $("[id*=chkInterestGroup] input").each(function () {
                    $(this).removeAttr('checked');
                });
                $("[id*=chkGenderList] input").each(function () {
                    $(this).removeAttr('checked');
                });
                $(this).dialog("close");

            }

            $("#discovernewfriendDialog").dialog({
                autoOpen: false,
                height: 700,
                width: 700,
                modal: true,
                title: $('#btnDisconverNewFriends').val(),
                //buttons: buttonsOpts
                open: function (event, ui) { SearchUser('', ''); $(this).parent().appendTo("form"); } //- remove selection as per meeting dec 04, 2014
                //title: $('#hdnDiscoverNewFriendsTitle').val(),
            });
        }
      

        $(function () {
            //createRoom();
            //if ($("#hdnLanguage").val() == "ja-JP") {
            //    $('#lblStartCount').css("margin-top", "-2px");
            //    $('#replyfirst').css("font-size", "12pt");
            //    $('#replyfirst').css("margin-top", "11px");
            //}
            //else {
            //    $('#lblStartCount').css("margin-top", "-5px");
            //    $('#replyfirst').css("font-size", "14pt");
            //    $('#replyfirst').css("margin-top", "14px");
            //}

            $('#chkGenderList').change(function () {

                var selectedItems = "";
                var selectedGenders = "";
                $("[id*=chkInterestGroup] input:checked").each(function () {
                    selectedItems += $(this).val() + ",";
                });

                $("[id*=chkGenderList] input:checked").each(function () {
                    selectedGenders += $(this).val() + ",";
                });

                SearchUser(selectedItems, selectedGenders);
            });

            $('#chkInterestGroup').change(function () {
                var selectedItems = "";
                var selectedGenders = "";
                $("[id*=chkInterestGroup] input:checked").each(function () {
                    selectedItems += $(this).val() + ",";
                });

                $("[id*=chkGenderList] input:checked").each(function () {
                    selectedGenders += $(this).val() + ",";
                });
                SearchUser(selectedItems, selectedGenders);
            });

            $('#ddlCity').change(function () {
                var selectedItems = "";
                var selectedGenders = "";
                $("[id*=chkInterestGroup] input:checked").each(function () {
                    selectedItems += $(this).val() + ",";
                });
                $("[id*=chkGenderList] input:checked").each(function () {
                    selectedGenders += $(this).val() + ",";
                });
                SearchUser(selectedItems, selectedGenders);
            });

            $('#txtSearch').on('input', function () {
                var selectedItems = "";
                var selectedGenders = "";
                $("[id*=chkInterestGroup] input:checked").each(function () {
                    selectedItems += $(this).val() + ",";
                });
                $("[id*=chkGenderList] input:checked").each(function () {
                    selectedGenders += $(this).val() + ",";
                });

                SearchUser(selectedItems, selectedGenders);
            });

        });

        function SelectAmbassador(el) {
            //if ($('#hdnIsDemo').val() == "True" || $('#hdnIsLevelDemo').val() == "True")
                //return;

            if ($(el).attr("data-flag").toLowerCase().indexOf("japan") > -1 && $("#hdnLanguage").val() == "ja-JP")
                return;
            if ($(el).attr("data-flag").toLowerCase().indexOf("australia") > -1 && $("#hdnLanguage").val() == "en-US")
                return;

            SelectUser(el);
        }


        function WriteNewMessage() {
            //if (sessionStorage.getItem("userresult") != null && parseInt(sessionStorage.getItem("userresult")) > 350) {
            //    alert('Search result too many, please limit your search criteria.');
            //    return false;
            //}
            var selectedusers = '';
            $(".chkSelectUser").each(function () {
                if ($(this).is(':checked') == true) {
                    selectedusers += $(this).attr("data-userid") + ",";
                }
            });
            sessionStorage.setItem("selectedUser", selectedusers);
            $('#hdnSelectedUsers').val(selectedusers);
            $("#results").html("");
            $("[id*=chkInterestGroup] input").each(function () {
                $(this).removeAttr('checked');
            });
            //$("#discovernewfriendDialog").dialog('close');
            //sessionStorage.removeItem("userresult");
        }

        function WriteNewMessageCancel() {
            $("#discovernewfriendDialog").dialog('close');
        }

        function SearchUser(selecteditems, genderlist) {
            //if (selecteditems != '') { //remove selection as per meeting dec 04, 2014
            //$('.spinner').show();
            var json = { Type: 'MakeNewFriends', Items: selecteditems, CityID: $('#ddlCity').val(), Name: $('#txtSearch').val(), Genders: genderlist };
            $.ajax
                ({
                    type: "POST",
                    url: "../Handler/SearchHandler.ashx",
                    data: json, //"selecteditem=" + selecteditems,
                    success: function (data) {

                        var data1 = $.parseJSON(data);
                        var result = "";
                        if (data1 == null) {
                            result = $('#hdnNoUserFound').val();
                            $("#results").empty();
                            $("#results").append('<ul>' + result + '</ul>');
                            return;
                        }

                        //sessionStorage.setItem("userresult",data1.length)
                        var selectedUser = "";
                        var count = 0;
                        var shouldIncreaseNativeUsersList = false;
                        $.each(data1, function (i, obj) {
                            if (count == 0)
                                shouldIncreaseNativeUsersList = obj.ShouldIncreaseNativeUsersList;
                            if (count <= 50)
                                selectedUser += obj.UserID + ",";

                            count = count + 1;
                            result += ("<li class='liUser' data-userid='{3}'><input type='checkbox' style='float:left;position:absolute;margin-left:5px;' class='chkSelectUser' data-userid='{3}'><div id='auth_img'><img src='{0}'></div>" +
                                "<div id='rest'><span>{1}</span><br/><span>{2}</span><br/><br/><br/></div>" +
                                "<div style='clear:both;'></div><div style='float:left;width:80%;font-weight:bold;'><span>{4}</span></div></li>").stringformat("../Images/avatar/" + obj.Avatar, obj.FirstName, obj.Address, obj.UserID, '');
                        });
                        sessionStorage.setItem("selectedUser", selectedUser)
                        
                        $("#results").empty();
                        $("#results").append('<ul>' + result + '</ul>');
                        //add it back as per franks email 12/07/2015
                        $('.liUser').click(function () { SelectUser(this); }); //- remove selection as per meeting dec 04, 2014
                        var counter = 0;
                        $(".chkSelectUser").each(function () {
                            var cnt = 3;
                            //$(el).siblings().find("#chkSelectUser").prop('checked', false);
                            //if (shouldIncreaseNativeUsersList) {
                            if ($("#hdnLanguage").val() == "ja-JP") {
                                cnt = 5;
                            }
                            if (counter == cnt)
                                return false;


                            $(this).prop('checked', true);
                            counter++;

                        });
                        $('.chkSelectUser').click(function (e) { e.stopPropagation(); });
                    }
                });
            //}
            //else {

            //    $("#results").html("");
            //}

            //$('.spinner').hide();
            return false;
        }

        function BlockElement() {
            $.blockUI({
                message: '<img src="../Images/loading.gif" /> ',
                css: { border: '1px solid white' }
            });
        }

        function UnBlockElement() {
            setTimeout($.unblockUI, 2000);
        }

        function SelectUser(el) {
            if ($('#hdnLevel').val() == 3 && $(el).attr("data-level") != 3) {
                return;
            }
            var userid = $(el).attr('data-userid');
            //$(location).attr('href', '<%=Page.ResolveUrl("~/Student/FriendsRoom")%>' + "?fid=" + userid);

            url = '<%=Page.ResolveUrl("~/Student/MyFriendsRoom")%>' + "?fid=" + userid;
            var windowObjectReference = window.open(url, '_blank');
        }

        function DiscoverNewFriends() {
            if ($('#imgReplyFirst').is(":visible")) {
                location.href = "Mailbox";
                return;
            }
            InitializeDiscoverNewFriendsDialog();
            $("#discovernewfriendDialog").dialog("open");
        }

        function Profile() {
            $(location).attr('href', '<%=Page.ResolveUrl("~/Student/MyRoom")%>');
        }

        function blink() {
            setInterval(function () {
                $("#linkHasMessages").fadeToggle();
            }, 200);
        }
        function DisableNewFriends() {
            //$('#btnDisconverNewFriends').val("");
            $('#imgAddFriends').hide();
            $('#imgReplyFirst').show();
        }

    </script>
    <div id="divVideo" style="display: none;">
        <div id="divFrame">
            <iframe width="600" height="450" src="" frameborder="0" allowfullscreen rel="0&amp;showinfo=0" id="frmVideo"></iframe>
        </div>
        <div id="divchkDontShowVideo">
            <asp:CheckBox ID="chkDontShowVideo" runat="server" ClientIDMode="Static" />&nbsp;<asp:Label ID="lblDontShowVideo" runat="server" ClientIDMode="Static" meta:resourcekey="lblDontShowVideoResource1">Dont't display this video again.</asp:Label>
        </div>
    </div>
   <%-- <div id="divQuickGuide" style="display: none;">
        <div id="divFrameQuickGuide">
            <iframe width="800" height="450" src="" frameborder="0" allowfullscreen rel="0&amp;showinfo=0" id="frmQuickGuide"></iframe>
        </div>
        <div id="divchkDontShowQuickGuide">
            <asp:CheckBox ID="chkDontShowQuickGuide" runat="server" ClientIDMode="Static" />&nbsp;<asp:Label ID="lblDontShowQuickGuide" runat="server" ClientIDMode="Static" meta:resourcekey="lblDontShowQuickGuideResource1">Dont't display this video again.</asp:Label>
            <asp:Label ID="lblQuickGuideOtherInfo" runat="server" ClientIDMode="Static" meta:resourcekey="lblQuickGuideOtherInfoResource1">Can still be accessed from <i class="material-icons help_icon">help</i> Help on the menu bar</asp:Label>
        </div>
    </div>--%>
<%--    <asp:HiddenField ID="hdnCurrentUserID" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnDontShowQuickGuide" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnQuickGuideUrl" runat="server" ClientIDMode="Static" meta:resourcekey="hdnQuickGuideUrlResource1" />--%>
    <asp:HiddenField ID="hdnVideoUrl" runat="server" ClientIDMode="Static" meta:resourcekey="hdnVideoUrlResource1" />
    <asp:HiddenField ID="hdnDontShowVideo" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnLanguage" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnNoUserFound" runat="server" ClientIDMode="Static" meta:resourcekey="hdnNoUserFoundResource1" />
    <asp:HiddenField ID="hdnIsDemo" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnIsLevelDemo" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnNewMessageLabel" runat="server" ClientIDMode="Static" meta:resourcekey="hdnNewMessageLabelResource1" />
    <asp:HiddenField ID="hdnSelectedUsers" runat="server" ClientIDMode="Static"/>
    <asp:HiddenField ID="hdnLevel" runat="server" ClientIDMode="Static" />
    <asp:Label ID="lblContinue" runat="server" meta:resourcekey="hdnContinueResource1" ClientIDMode="Static" Style="display: none;" />
    <asp:Label ID="lblCancel" runat="server" meta:resourcekey="hdnCancelResource1" ClientIDMode="Static" Style="display: none;" />

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Button ID="btnPostback" runat="server" Text="" Style="display: none;" ClientIDMode="Static" OnClick="btnPostback_Click" />
            <asp:HiddenField ID="hdnSelectedTab" runat="server" />
            <div class="Home_left_Container" id="Home_left_Container">
                <div class="AvatarImage_Container" id="AvatarImage_Container">
                    <div class="avatar_profile" id="avatar_profile">
                        <asp:Image ID="imgAvatar" CssClass="avatar_profile_img" runat="server" Width="80px" Height="80px" ImageUrl="~/Images/no_avatar.png" meta:resourcekey="imgAvatar" onclick="Profile();" />
                    </div>
                    <div class="avatar_profile_content" id="avatar_profile_content">
                        <asp:Label ID="lblWelcome" CssClass="avatar_profile_content_text" runat="server" Text="Welcome," meta:resourcekey="lblWelcomeResource1"></asp:Label>
                        <asp:Label ID="lblName" CssClass="avatar_profile_content_text" runat="server" meta:resourcekey="lblNameResource1"></asp:Label>
                        <div class="avatar_profile_content_text2" id="avatar_profile_content_text2">
                            <asp:Localize ID="lblstatement" runat="server" meta:resourcekey="lblstatementResource1" Text="
                                &lt;p&gt;
                                    Choose a friend from the list below to talk to &lt;/p&gt;&lt;p&gt;or click  New Friend to make a new friend
                                &lt;/p&gt;
                            "></asp:Localize>
                        </div>
                    </div>
                    <div class="btnDiscoverNewFriends_container" id="btnDiscoverNewFriends_container">
                        <div class="btndnf_cmd" id="btndnf_cmd">
                            <asp:Label runat="server" ClientIDMode="Static" id="replyfirst" meta:resourcekey="replyfirstResource1" Text="You have many unread messages, please reply first before you can use Make New Friends"></asp:Label>
                            <asp:Button ID="btnDisconverNewFriends" CssClass="btnDiscoverNewFriends" Style="background-image: url('../Images/new/add friends.png'); background-color: Transparent; cursor: pointer; background-repeat: no-repeat; background-position: left; padding-left: 15px; background-size: 300px; text-align: center; display:none;" Height="62px" BorderStyle="None" Width="300px" runat="server" Text="Make New Friends" ClientIDMode="Static" OnClientClick="DiscoverNewFriends(); return false;" meta:resourcekey="btnDisconverNewFriendsResource1" />
                            <asp:ImageButton runat="server" ID="imgReplyFirst" CssClass="imgReplyFirst" ClientIDMode="Static" ImageUrl="~/Images/new/reply.png" AlternateText="Add new Friends" OnClientClick="return false;"/>
                            <asp:ImageButton runat="server" ID="imgAddFriends" CssClass="imgAddFriends" ClientIDMode="Static" ImageUrl="~/Images/AddNewFriends.png" OnClientClick="DiscoverNewFriends(); return false;" AlternateText="Add new Friends" />
                        </div>
                    </div>
                </div>

                <div class="Tabs_Container" id="Tabs_Container">
                    <div id="tabs" style="display: none;">
                        <div class="tabs_menu_container">
                            <ul class="tabs_header" id="tabs_header">
                                <li>
                                    <asp:HyperLink ID="HyperLink2" href="#tab1" runat="server" Text="Friends" meta:resourcekey="HyperLink2Resource1" /></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink1" href="#tab2" runat="server" Text="Online Friends" meta:resourcekey="HyperLink1Resource1" /></li>
                                <li>
                                    <asp:HyperLink ID="HyperLink3" href="#tab3" runat="server" Text="New Palaygo Joiner" meta:resourcekey="HyperLink3Resource1" /></li>
                            </ul>
                        </div>
                        <div class="tab1" id="tab1">
                            <asp:Button ID="btnContinuetab1" CssClass="continue" meta:resourcekey="ContinueTabResource1" runat="server" Style="float: right;" ClientIDMode="Static" OnClientClick="return SendToAllFriends('2');" />
                            <div style="clear: both;"></div>
                            <asp:Repeater ID="rptFriends" runat="server" ClientIDMode="Static">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="divUsers" class="userBlock" onclick="SelectUser(this);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>">
                                        <div style="float: left;">
                                            <asp:Image CssClass="tab1-img-avatar" ID="imgAvatar" runat="server" Width="65px" Height="65px" ImageUrl='<%# Eval("Avatar") %>' meta:resourcekey="imgAvatarResource2" />
                                        </div>
                                        <div style="float: left; margin-left: 10px;">
                                            <span class="tab1-name"><%#Eval("UserName") %><br />
                                                <%#Eval("FirstName") %></span><br />
                                            <span class="tab1-add"><%#Eval("Address") %></span><br />
                                            <span class="tab1-stat">
                                                <asp:Image ID="imgStatus" runat="server" ImageUrl='<%# Eval("StatusImage") %>' meta:resourcekey="imgAvatarResource2" /><%# Eval("OnlineStatusText") %></span><br />
                                        </div>
                                        <%--  <div style="float:right;">
                                                <span><asp:Image CssClass="tab-mail-image" ID="Image1" runat="server" ImageUrl="~/Images/mail.png" Width="21px" Height="14px"  meta:resourcekey="imgAvatarResource2" /><%# Eval("MessageCount") %></span><br />
                                            </div>--%>
                                        <div style='clear: both;'></div>
                                        <div>
                                            <asp:Image ID="Image2" CssClass="imglike" runat="server" ImageUrl='<%# Eval("LikeImage") %>' Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="imgAvatarResource2" />
                                            <asp:Label ID="lblLikeCount" CssClass="likecount" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblLikeCountResource2"><%#Eval("LikeCount") %></asp:Label>
                                            <span style="text-wrap: normal; word-wrap: break-word; font-style: italic; font-weight: bold;"><%#Eval("StatusText") %></span>
                                            <asp:Label ID="lblStatusDate" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblStatusDateResource2"><%#Eval("StatusDateText") %></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab2" id="tab2">
                            <asp:Button ID="btnContinuetab0" CssClass="continue" meta:resourcekey="ContinueTabResource1" runat="server" Style="float: right;" ClientIDMode="Static" OnClientClick="return SendToAllFriends('1');" />
                            <div style="clear: both;"></div>
                            <asp:Repeater ID="rptOnlineFriends" runat="server" ClientIDMode="Static">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="divUsers" class="userBlock" role="button" onclick="SelectUser(this);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>">
                                        <div style="float: left;">
                                            <asp:Image CssClass="tab1-img-avatar" ID="imgAvatar" runat="server" Width="65px" Height="65px" ImageUrl='<%# Eval("Avatar") %>' meta:resourcekey="imgAvatarResource2" />
                                        </div>
                                        <div style="padding-left: 8px; float: left;">
                                            <span class="tab1-name"><%#Eval("UserName") %><br />
                                                <%#Eval("FirstName") %> </span>
                                            <br />
                                            <span class="tab1-add"><%#Eval("Address") %></span><br />
                                            <span class="tab1-stat">
                                                <asp:Image ID="imgStatus" runat="server" ImageUrl='../Images/online.png' meta:resourcekey="imgAvatarResource2" />Online Now</span><br />
                                        </div>
                                        <%--  <div class="tab-mail-image" style="float:right;">
                                                <span><asp:Image CssClass="tab-mail-image" ID="Image1" runat="server" ImageUrl="~/Images/mail.png" Width="21px" Height="14px"  meta:resourcekey="imgAvatarResource2" /><%# Eval("MessageCount") %></span><br />
                                            </div>--%>
                                        <div style='clear: both;'></div>
                                        <div>
                                            <asp:Image ID="Image2" CssClass="imglike" runat="server" ImageUrl='<%# Eval("LikeImage") %>' Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="imgAvatarResource2" />
                                            <asp:Label ID="lblLikeCount" CssClass="likecount" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblLikeCountResource1"><%#Eval("LikeCount") %></asp:Label>
                                            <span style="text-wrap: normal; word-wrap: break-word; font-style: italic; font-weight: bold;"><%#Eval("StatusText") %></span>
                                            <asp:Label ID="lblStatusDate" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblStatusDateResource1"><%#Eval("StatusDateText") %></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="tab3" id="tab3">
                            <asp:Button ID="btnContinuetab2" CssClass="continue" meta:resourcekey="ContinueTabResource1" runat="server" Style="float: right;" ClientIDMode="Static" OnClientClick="return SendToAllFriends('3');" />
                            <div style="clear: both;"></div>
                            <asp:Repeater ID="rptNew" runat="server" ClientIDMode="Static">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="divUsers" class="userBlock" role="button" onclick="SelectUser(this);" data-userid="<%# Eval("UserID") %>" data-firstname="<%# Eval("FirstName") %>">
                                        <div style="float: left;">
                                            <asp:Image CssClass="tab1-img-avatar" ID="imgAvatar" runat="server" Width="65px" Height="65px" ImageUrl='<%# Eval("Avatar") %>' meta:resourcekey="imgAvatarResource2" />
                                        </div>
                                        <div style="float: left; margin-left: 10px;">
                                            <span class="tab1-name"><%#Eval("UserName") %><br />
                                                <%#Eval("FirstName") %></span><br />
                                            <spa class="tab1-add" n><%#Eval("Address") %></spa>
                                            <br />
                                            <span class="tab1-stat">
                                                <asp:Image ID="imgStatus" runat="server" ImageUrl='<%# Eval("StatusImage") %>' meta:resourcekey="imgAvatarResource2" /><%# Eval("OnlineStatusText") %></span><br />
                                        </div>
                                        <%-- <div style="float:right;">
                                                <span><asp:Image CssClass="tab-mail-image" ID="Image1" runat="server" ImageUrl="~/Images/mail.png" Width="21px" Height="14px"  meta:resourcekey="imgAvatarResource2" /><%# Eval("MessageCount") %></span><br />
                                            </div>--%>
                                        <div style='clear: both;'></div>
                                        <div>
                                            <asp:Image ID="Image2" CssClass="imglike" runat="server" ImageUrl='<%# Eval("LikeImage") %>' Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="imgAvatarResource2" />
                                            <asp:Label ID="lblLikeCount" CssClass="likecount" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblLikeCountResource3"><%#Eval("LikeCount") %></asp:Label>
                                            <span style="text-wrap: normal; word-wrap: break-word; font-style: italic; font-weight: bold;"><%#Eval("StatusText") %></span>
                                            <asp:Label ID="lblStatusDate" runat="server" Visible='<%# Eval("StatusText") != null %>' meta:resourcekey="lblStatusDateResource3"><%#Eval("StatusDateText") %></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                    <div class="Search_Container" id="Search_Container">
                        <img src="../Images/new/news.png" class="imgNews" />
                        <div class="new_notice_content">
                            <asp:Label ID="lblNotice" runat="server" meta:resourcekey="lblNoticeResource1"></asp:Label>
                        </div>

                    </div>
                </div>

            </div>
            <div id="discovernewfriendDialog" class="discovernewfriendDialog" style="display: none; overflow: hidden;">
                <div style="border-bottom-style: ridge; border-bottom-width: 1px; border-bottom-color: #e1dcdc;">
                    <asp:ImageButton ID="btnWriteNewMessage" ImageUrl="~/Images/new/send many.png" CssClass="btnWriteNewMessage_home" runat="server" ClientIDMode="Static"  OnClientClick="WriteNewMessage();" OnClick="btnWriteNewMessage_Click" />
                    <img id="btnCancel" class="btnCancel_home" onclick="WriteNewMessageCancel(); return false;" src="../Images/new/cancel.png" />
                    <%--<asp:Button ID="btnWriteNewMessage" CssClass="btnWriteNewMessage_home" runat="server" Text="Send mail to all below users" meta:resourcekey="btnWriteNewMessageResource1" ClientIDMode="Static" BorderStyle="None" Style="text-align: center;" OnClientClick="WriteNewMessage();" OnClick="btnWriteNewMessage_Click"/>--%>
                    <%--<asp:Button ID="btnCancel" runat="server" Text="Cancel" ClientIDMode="Static" CssClass="btnCancel_home" Height="62px" Width="150px" meta:resourcekey="btnCancelResource1" OnClientClick="WriteNewMessageCancel(); return false;" />--%>
                    <asp:Label ID="lblComment" runat="server" ClientIDMode="Static" meta:resourcekey="lblCommentResource1" Style="text-align: center; display: block;"></asp:Label>
                </div>
                <div id="results" style="overflow: scroll; height: 300px;">
                </div>
                <div style="border-top-style: ridge; border-top-width: 1px; border-top-color: #e1dcdc;">
                    <asp:Label ID="lblSearchTitle" runat="server" ClientIDMode="Static" Text="Search" Style="text-align: center; display: block;" Font-Size="Large" Font-Bold="true"></asp:Label>
                    <asp:CheckBoxList ID="chkInterestGroup" CssClass="CheckboxList" CellPadding="5" CellSpacing="5" runat="server" DataTextField="InterestName" DataValueField="InterestID" ClientIDMode="Static" RepeatDirection="Horizontal" BorderColor="Control" BorderStyle="Solid" BorderWidth="1px" Width="100%" meta:resourcekey="chkInterestGroupResource1"></asp:CheckBoxList>
                    <div class="country_city_search" id="country_city_search">
                        <div class="container_country_city" id="container_country_city">
                            <div class="container_country" id="container_country" style="display: none;">
                                <asp:Label ID="lblCountry" CssClass="container_country_city_lbl" runat="server" Text="Country" AssociatedControlID="ddlCountry" meta:resourcekey="lblCountryResource1"></asp:Label>
                                <asp:DropDownList ID="ddlCountry" CssClass="slctCountry" runat="server" Width="100px" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged" AutoPostBack="True" meta:resourcekey="ddlCountryResource1"></asp:DropDownList>
                            </div>
                            <div class="container_city" id="container_city">
                                <asp:Label ID="lblCity" CssClass="container_country_city_lbl" runat="server" Text="City" AssociatedControlID="ddlCity" meta:resourcekey="lblCityResource1"></asp:Label>
                                <asp:DropDownList ID="ddlCity" CssClass="slctCity" runat="server" Width="100px" meta:resourcekey="ddlCityResource1" ClientIDMode="Static"></asp:DropDownList>
                            </div>
                            <div class="search_email_name" id="search_email_name">
                                <asp:Label ID="lblSearchName" CssClass="search_email_name_lbl" runat="server" Text="Email or Name" AssociatedControlID="txtSearch" meta:resourcekey="lblSearchNameResource1"></asp:Label>
                                <div class="se_container" id="se_container">
                                    <div class="txtsearch_container" id="txtsearch_container">
                                        <asp:TextBox ID="txtSearch" CssClass="txtsearch_box" runat="server" Width="350px" meta:resourcekey="txtSearchResource1" ClientIDMode="Static"></asp:TextBox>
                                        <asp:ImageButton CssClass="home-search-btn" ID="imgSearch" BackColor="Transparent" BorderColor="Transparent" ImageUrl="~/Images/SearchF.png" runat="server" Width="12px" Height="13px" ClientIDMode="Static" meta:resourcekey="ImageButton1Resource1" style="display:none;" />
                                    </div>
                                </div>
                            </div>
                            <div>
                                <asp:CheckBoxList ID="chkGenderList" runat="server" ClientIDMode="Static" CssClass="CheckboxList">
                                    <asp:ListItem Text="Male" Value="Male" meta:resourcekey="chkMaleResource1"></asp:ListItem>
                                    <asp:ListItem Text="Female" Value="Female" meta:resourcekey="chkFemaleResource1"></asp:ListItem>
                                </asp:CheckBoxList>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="Home_Right_Container" id="Home_Right_Container">
                <asp:LinkButton ID="linkHasMessages" runat="server" Visible="false" Style="margin-top: -30px; font-size: 12pt !important; color: #808080;" CssClass="avatar_profile_content_text" Text="You have received new messages! Letʼs reply!" PostBackUrl="~/Student/MailBox.aspx" meta:resourcekey="linkHasMessagesResource1" ClientIDMode="Static"></asp:LinkButton>
                <div style="margin-top: 10px;text-align: center;">
                    
                    <div class="starCountContainer">
                        <img src="../Images/like_star.png" style="margin-top: -20px;float:left;" />
                        <%--<span class="avatar_profile_content_text" style="position: absolute; font-weight: bold;">!</span>--%>
                        <asp:Label ID="lblStar" runat="server" Style="float: left; font-size: 12pt !important;" CssClass="avatar_profile_content_text" Text="You have " meta:resourcekey="lblHasMessagesResource1" ClientIDMode="Static" />
                        <asp:Label ID="lblStartCount" runat="server"  Text="0" ClientIDMode="Static" />
                    </div>
                </div>

                <div class="New_Notice_Container" id="New_Notice_Container">
                    <div id="divNews" class="divNews">
                        <img src="../Images/new/ranking.png" class="imgRanking" />
<%--                        <div class="Tnews_notice_lbl">
                            <asp:Label ID="lblRankingLabel" runat="server" meta:resourcekey="lblRankingLabelResource1" Text="Ambassador Ranking"></asp:Label>
                            <asp:HyperLink ID="lblJapanNewsLabel" CssClass="Tnews_notice_lbl" BackColor="Transparent" runat="server" meta:resourcekey="lblJapanNewsLabelResource1" Visible="false">HyperLink</asp:HyperLink>
                        </div>--%>
                        <div class="Tnew_notice_content">
                            <div>
                                <asp:Repeater ID="rptRanking" runat="server">
                                    <HeaderTemplate>
                                        <table style='text-align: center; width: 100%;' id="tblRanking">
                                            <th>
                                                <asp:Label ID="lblRankLabel" runat="server" Text="Rank" meta:resourcekey="lblRankLabelResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblAvatar" runat="server" Text=""></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblUsernameLabel" runat="server" Text="Name" meta:resourcekey="lblUsernameLabelResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblSchoolCodeLabel" runat="server" Text="Code" meta:resourcekey="lblSchoolCodeLabelResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblCountryLabel" runat="server" Text="Country" meta:resourcekey="lblCountryLabelResource1"></asp:Label></th>
                                            <th>
                                                <asp:Label ID="lblCountLabel" runat="server" Text="Count" meta:resourcekey="lblCountLabelResource1"></asp:Label></th>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr class="rowrankselect" onclick="SelectAmbassador(this);" data-userid="<%#Eval("UserID") %>" data-flag="<%#Eval("Flag") %>" data-level="<%#Eval("LevelID") %>">
                                            <td><%#Eval("Ranking") %><span data-ranking="<%#Eval("Ranking") %>" class="scr"></span></td>
                                            <td>
                                                <img src="../Images/avatar/<%#Eval("Avatar") %>" style="width: 32px; height: 32px;" /></td>
                                            <td><span class="spanUserName"><%#Eval("FirstName") %><span></td>
                                            <td><span class="spanSchoolCode"><%#Eval("SchoolCode") %><span></td>
                                            <td>
                                                <img style="width: 24px; height: 24px;" src="../images/<%#Eval("Flag") %>" alt="" /></td>
                                            <td><%#Eval("Points") %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate></table></FooterTemplate>

                                </asp:Repeater>
                            </div>
                            <asp:Label ID="lblNews" runat="server" meta:resourcekey="lblNewsResource1" Visible="false"></asp:Label>
                        </div>
                        <%--</div>
                    <div id="divImportantNotice" class="divImportantNotice">--%>
                        <%--                        <div class="news_notice_lbl">
                            <asp:HyperLink ID="lblNoticeLabel" CssClass="news_notice_lbl" BackColor="Transparent" runat="server" meta:resourcekey="lblNoticeLabelResource1">HyperLink</asp:HyperLink>
                        </div>
                        <div class="new_notice_content">
                            <asp:Label ID="lblNotice" runat="server" meta:resourcekey="lblNoticeResource1"></asp:Label>
                        </div>--%>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
