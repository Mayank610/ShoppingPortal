<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManageCallType.aspx.cs" Inherits="ManageCallType" Title="Call Type" EnableEventValidation="false" %>

<%@ Register Src="~/CCConfirmationPopup.ascx" TagName="ConfirmationPopup" TagPrefix="CP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Label ID="lbltabHeight1" runat="server" CssClass="lbltabHeight1 hidden" Text="151"></asp:Label>
            <asp:Label ID="lbltabHeightSmall1" runat="server" CssClass="lbltabHeightSmall1 hidden"
                Text="190"></asp:Label>
            <asp:Label ID="lblFirmId" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblCallTypeId" runat="server" Visible="false"></asp:Label>
            <div class="row">
                <div class="page-header clearfix">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 p0">
                        <div class="btn-group">
                            <asp:LinkButton ID="lnkAdd" ToolTip="Add (alt+n)" runat="server" OnClick="lnkAdd_OnClick"
                                CssClass="lnkAdd btn btngroup btn-add" data-toggle="tooltip">
                            <i class="fa fa-plus"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkEdit" ToolTip="Edit (alt+u)" allowon="1" runat="server" OnClick="lnkEdit_OnClick"
                                CssClass="lnkEdit btn btngroup btn-edit tooltips" data-toggle="tooltip">
                            <i class="fa fa-edit"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkActive" ToolTip="Active (alt+a)" allowon="1" runat="server"
                                OnClick="lnkActive_OnClick" CssClass="lnkActive btn btngroup btn-active tooltips clickloader"
                                data-toggle="tooltip">
                            <i class="fa fa-check"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDeactive" ToolTip="Deactive (alt+r)" allowon="1" runat="server"
                                OnClick="lnkDeactive_OnClick" CssClass="lnkDeactive btn btngroup btn-deactive tooltips clickloader"
                                data-toggle="tooltip">
                            <i class="fa fa-ban"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" ToolTip="Delete (alt+x)" allowon="1" runat="server"
                                OnClick="lnkDelete_OnClick" CssClass="lnkDelete btn btngroup btn-delete tooltips clickloader"
                                data-toggle="tooltip">
                            <i class="fa fa-trash-o"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="lnkRefresh" ToolTip="Refresh" runat="server" OnClick="lnkRefresh_OnClick"
                                CssClass="btn btngroup btn-refresh tooltips clickloader" data-toggle="tooltip">
                            <i class="fa fa-refresh"></i>
                            </asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 search div-master-search div-master-search-xs">
                        <asp:Label ID="lblCount" ToolTip="Count" runat="server" Text="10" CssClass="pull-left mr-5 btn btn-icon btn-total tooltips"
                            data-toggle="tooltip">
                        </asp:Label>
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control master-search"
                                OnChange="addRegionLoader('divloader')" AutoPostBack="true" OnTextChanged="Control_CheckedChanged"
                                placeholder="Search..."></asp:TextBox>
                            <a note-colspan="note-colspan-class" class="tooltips input-group-addon aShowSearch btn btn-master-search ml5"
                                data-original-title="Search" data-toggle="tooltip"><i note-colspan="note-colspan-class"
                                    class="fa fa-chevron-down"></i></a>
                        </div>
                    </div>
                    <div note-colspan="note-colspan-class" class="search-tools divShowSearch note-colspan-class">
                        <asp:Panel ID="pnlSearch" runat="server" DefaultButton="lnkSearch" class="divsearchloader"
                            note-colspan="note-colspan-class">
                            <div class="col-md-6 col-sm-6 col-xs-6 col-sm-6 searchchk" note-colspan="note-colspan-class">
                                <div class="checkbox-custom" note-colspan="note-colspan-class">
                                    <asp:CheckBox ID="chkActive" runat="server" note-colspan="note-colspan-class" CssClass="chk"
                                        Checked="true" Text="Active" />
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-6 col-sm-6 searchchk" note-colspan="note-colspan-class">
                                <div class="checkbox-custom" note-colspan="note-colspan-class">
                                    <asp:CheckBox ID="chkDeactive" runat="server" note-colspan="note-colspan-class" CssClass="chk"
                                        Text="Deactive" />
                                </div>
                            </div>
                            <div class="padbm text-right" note-colspan="note-colspan-class">
                                <asp:LinkButton ID="lnkSearch" note-colspan="note-colspan-class" OnClientClick="addRegionLoader('divloader')"
                                    OnClick="Control_CheckedChanged" class="btn btn-warning btnsearch" runat="server"><i class="fa fa-filter"></i> Filter</asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="page-content col-md-12 divtable divloader">
                    <div class="table-responsive tabHeight1 fixheight2">
                        <asp:GridView ID="grdCallType" AllowPaging="false" runat="server" OnRowDataBound="grdCallType_OnRowDataBound"
                            OnSelectedIndexChanged="grdCallType_OnSelectedIndexChanged" AutoGenerateColumns="False"
                            class="table table-bordered table-hover nomargin selectonrowclick rowloader fixheader">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" CssClass="" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="CallTypeId" HeaderText="CallTypeId" HeaderStyle-CssClass="hide"
                                    ItemStyle-CssClass="hide" />
                                <asp:BoundField DataField="eStatus" HeaderText="eStatus" HeaderStyle-CssClass="hide"
                                    ItemStyle-CssClass="hide" />
                                <asp:TemplateField HeaderText="Call Type">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEditCallType" CssClass="lnkEditCallType" OnClick="lnkEditCallType_OnClick"
                                            runat="server"></asp:LinkButton>
                                        <asp:Literal ID="ltrCallType" runat="server"></asp:Literal>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center text-danger">
                                    <br />
                                    <i class="fa fa-4x fa-smile-o"></i>
                                    <h3>Sorry, No Data Found.</h3>
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                    <div id="divPaging" runat="server" class="col-md-12 col-sm-12 col-xs-12 div-paging">
                        <asp:LinkButton ID="lnkFirst" OnClick="lnkFirst_Click" OnClientClick="addRegionLoader('divloader')"
                            runat="server" ToolTip="First Page" CssClass="fa fa-fast-backward btn-paging tooltips"></asp:LinkButton>
                        <asp:LinkButton ID="lnkPrev" OnClick="lnkPrev_Click" OnClientClick="addRegionLoader('divloader')"
                            runat="server" ToolTip="Previous Page" CssClass="fa fa-backward btn-paging tooltips"></asp:LinkButton>
                        <asp:TextBox ID="txtGotoPageNo" Text="1" runat="server" CssClass="txt-paging" OnTextChanged="txtGotoPageNo_OnTextChange"
                            OnChange="addRegionLoader('divloader')" AutoPostBack="true"></asp:TextBox>
                        <asp:LinkButton ID="lnkNext" OnClick="lnkNext_Click" OnClientClick="addRegionLoader('divloader')"
                            runat="server" ToolTip="Next Page" CssClass="fa fa-forward btn-paging tooltips"></asp:LinkButton>
                        <asp:LinkButton ID="lnkLast" OnClick="lnkLast_Click" OnClientClick="addRegionLoader('divloader')"
                            runat="server" ToolTip="Last Page" CssClass="fa fa-fast-forward btn-paging tooltips"></asp:LinkButton>
                        <asp:DropDownList ID="ddlRecordPerPage" runat="server" CssClass="ddlNotSearch ml-5 ddl-paging"
                            AutoPostBack="True" OnChange="addRegionLoader('divloader')" OnSelectedIndexChanged="ddlRecordPerPage_LoadMember">
                        </asp:DropDownList>
                        <span class="lbl-paging">Records / Page</span>
                        <label class="pull-right mt2 lbl-paging hidden-xs">
                            <asp:Literal ID="ltrTotalContent" runat="server"></asp:Literal>
                        </label>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="popup" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <cc1:ModalPopupExtender ID="popupConfirmation" runat="server" DropShadow="false"
                PopupControlID="pnlConfirmation" BehaviorID="PopupBehaviorID1" TargetControlID="lnkFakeConfirmation"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:LinkButton ID="lnkFakeConfirmation" runat="server"></asp:LinkButton>
            <asp:Panel ID="pnlConfirmation" CssClass="modal-content zoomIn modal-confirmation col-xs-12 col-sm-12 col-md-12 p0"
                Style="display: none" runat="server">
                <CP:ConfirmationPopup ID="Confirmationpopup" runat="server" />
            </asp:Panel>

            <asp:LinkButton ID="lnkFackCallType" runat="server"> </asp:LinkButton>
            <cc1:ModalPopupExtender ID="popupCallType" runat="server" DropShadow="false" BehaviorID="PopupBehaviorID2"
                PopupControlID="pnlpopupCallType" TargetControlID="lnkFackCallType" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlpopupCallType" runat="server" DefaultButton="btnSave" CssClass="modelpopup col-lg-6 col-md-6 col-sm-8 col-xs-12 p0"
                Style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content darkmodel">
                        <div class="modal-header bg-black">
                            <button type="button" class="ClosePopup close">
                                ×</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblPopupTitle" runat="server">Call Type</asp:Label></h4>
                        </div>
                        <div class="modal-body divloaderCallType checkvalidCallTypeDetail">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Call Type<span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtCallTypeName" CssClass="form-control" ZValidation="e=blur|v=IsRequired|m=Call Type Name"
                                                runat="server" MaxLength="50" placeholder="Enter Call Type"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            SMS Text
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtSMSText" CssClass="form-control" TextMode="MultiLine" runat="server" placeholder="Enter SMS Text"></asp:TextBox>
                                            <div class="checkbox-custom">
                                                <asp:CheckBox ID="chkSendSMS" runat="server" CssClass="chk" Checked="true" Text="Send SMS" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="ClosePopup btn btn-raised btn-default">
                                Cancel</button>
                            <asp:Button ID="btnSave" OnClick="btnSave_OnClick" runat="server" CssClass="btnSave btn btn-raised btn-black"
                                Text="Save" />
                            <asp:Button ID="btnSaveAndNew" OnClick="btnSaveAndNew_OnClick" runat="server"
                                CssClass="btnSaveAndNew btn btn-raised btn-black" Text="Save & New" />
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">
    <script type="text/javascript">
        function AddControl() {
            if ($(".lnkAdd").attr("class") != undefined) {
			    <%= Page.ClientScript.GetPostBackEventReference(lnkAdd, String.Empty) %>;
                ShowPopupAndLoader(2, "divloaderCallType");
                return true;
            }
            else {
                return false;
            }
        }

        function EditControl() {
            if ($(".lnkEdit").attr("class") != undefined) {
                if (IsValidRowSelection()) {
			        <%= Page.ClientScript.GetPostBackEventReference(lnkEdit, String.Empty) %>;
                    ShowPopupAndLoader(2, "divloaderCallType");
                    return true;
                }
                else {
                    return false;
                }
            }
            else {
                return false;
            }
        }

        function ActiveControl() {
            if ($(".lnkActive").attr("class") != undefined) {
                addLoader('lnkActive');
			    <%= Page.ClientScript.GetPostBackEventReference(lnkActive, String.Empty) %>;
            }
        }

        function DeactiveControl() {
            if ($(".lnkDeactive").attr("class") != undefined) {
                addLoader('lnkDeactive');
			    <%= Page.ClientScript.GetPostBackEventReference(lnkDeactive, String.Empty) %>;
            }
        }

        function DeleteControl() {
            if ($(".lnkDelete").attr("class") != undefined) {
                addLoader('lnkDelete');
			    <%= Page.ClientScript.GetPostBackEventReference(lnkDelete, String.Empty) %>;
            }
        }

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(Checkpostback);
        jQuery(function () {
            Checkpostback();
        });
        function Checkpostback() {
            $(".lnkAdd").click(function () {
                ShowPopupAndLoader(2, "divloaderCallType");
                return true;
            });

            $(".lnkEdit").click(function () {
                ShowPopupAndLoader(2, "divloaderCallType");
                return true;
            });

            $(".lnkEditCallType").click(function () {
                ShowPopupAndLoader(2, "divloaderCallType");
                return true;
            });

            $(".btnSave").click(function () {
                if (CheckValidation("checkvalidCallTypeDetail")) {
                    addLoader('btnSave');
                    return true;
                }
                else {
                    return false;
                }
            });

            $(".btnSaveAndNew").click(function () {
                if (CheckValidation("checkvalidCallTypeDetail")) {
                    addLoader('btnSaveAndNew');
                    return true;
                }
                else {
                    return false;
                }
            });
        }

    </script>
</asp:Content>
