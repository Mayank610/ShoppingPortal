<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ManageOnlineCurior.aspx.cs" Inherits="ManageOnlineCurior" Title="OnlineCourier" EnableEventValidation="false" %>

<%@ Register Src="~/CCExcelExport.ascx" TagName="ExcelExportPopup" TagPrefix="EE" %>
<%@ Register Src="~/CCConfirmationPopup.ascx" TagName="ConfirmationPopup" TagPrefix="CP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .lblGrid {
            display: block;
        }

        .lblPaymentMade {
            color: red;
        }

        .lblPaymentRecived {
            color: seagreen;
        }


        .lnkDelivered {
            background-color: #72e46a !important;
        }

            .lnkDelivered:hover {
                background-color: #72e46a !important;
            }

        .lnkRefused {
            background-color: #e46a6a !important;
        }

            .lnkRefused:hover {
                background-color: #e46a6a !important;
            }

        .lnkNoData {
            background-color: #b8b6ff !important;
        }

            .lnkNoData:hover {
                background-color: #b8b6ff !important;
            }

        .lblLocation {
            color: #a0a0a0;
        }

        .lblTitle {
            margin-left: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="lnkSaveTraking" />
            <asp:PostBackTrigger ControlID="lnkRefreshValue" />
        </Triggers>
        <ContentTemplate>
            <asp:Label ID="lbltabHeight1" runat="server" CssClass="lbltabHeight1 hidden" Text="151"></asp:Label>
            <asp:Label ID="lbltabHeightSmall1" runat="server" CssClass="lbltabHeightSmall1 hidden"
                Text="190"></asp:Label>
            <asp:Label ID="lblOnlineCourierId" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblOnlineCourierValueId" runat="server" Visible="false"></asp:Label>
            <asp:Panel ID="pnlOnlineCourier" runat="server" class="row">
                <div class="page-header clearfix">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 p0">
                        <div class="btn-group">
                            <asp:LinkButton ID="lnkAdd" ToolTip="Add (alt+n)" runat="server" OnClick="lnkAdd_OnClick"
                                CssClass="lnkAdd btn btngroup btn-add tooltips" data-toggle="tooltip">
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
                        <asp:GridView ID="grdOnlineCourier" AllowPaging="false" runat="server" OnRowDataBound="grdOnlineCourier_OnRowDataBound"
                            OnSelectedIndexChanged="grdOnlineCourier_OnSelectedIndexChanged" AutoGenerateColumns="False"
                            class="table table-bordered table-hover nomargin selectonrowclick rowloader fixheader">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" CssClass="" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="OnlineCourierId" HeaderText="OnlineCourierId" HeaderStyle-CssClass="hide"
                                    ItemStyle-CssClass="hide" />
                                <asp:BoundField DataField="eStatus" HeaderText="eStatus" HeaderStyle-CssClass="hide"
                                    ItemStyle-CssClass="hide" />
                                <asp:TemplateField HeaderText="Sheet">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkEditOnlineCourier" CssClass="lnkEditOnlineCourier" OnClick="lnkEditOnlineCourier_OnClick"
                                            runat="server"></asp:LinkButton>
                                        <asp:Label ID="lblOnlineCourierDate" runat="server" CssClass="lblGrid"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Payment">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaymentMade" runat="server" CssClass="lblPaymentMade lblGrid"></asp:Label>
                                        <asp:Label ID="lblPaymentRecived" runat="server" CssClass="lblPaymentRecived lblGrid"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Order">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalOrder" runat="server" CssClass="lblGrid"></asp:Label>
                                        <asp:Label ID="lblTotalQuantity" runat="server" CssClass="lblGrid"></asp:Label>
                                        <asp:Label ID="lblTotalAmount" runat="server" CssClass="lblGrid"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Del Order">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTotalDelOrder" runat="server" CssClass="lblGrid"></asp:Label>
                                        <asp:Label ID="lblTotalDelQuantity" runat="server" CssClass="lblGrid"></asp:Label>
                                        <asp:Label ID="lblTotalDelAmount" runat="server" CssClass="lblGrid"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Description" HeaderText="Description" />
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
            </asp:Panel>
            <asp:Panel ID="pnlOnlineCourierValue" runat="server" class="row">
                <div class="page-header clearfix">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 p0">
                        <div class="btn-group">
                            <asp:LinkButton ID="lnkOnlineCourier" ToolTip="Back to OnlineCourier" runat="server" OnClick="lnkOnlineCourier_OnClick"
                                CssClass="btn btngroup btn-extra1 clickloader tooltips" data-toggle="tooltip">
                            <i class="fa fa-chevron-left"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="btn-group">
                            <asp:LinkButton ID="lnkRefreshValue" ToolTip="Refresh" runat="server" OnClick="lnkRefreshValue_OnClick"
                                CssClass="btn btngroup btn-refresh tooltips clickloader" data-toggle="tooltip">
                            <i class="fa fa-refresh"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="btn-group">
                            <asp:LinkButton ID="lnkSaveTraking" ToolTip="Save Data" runat="server" OnClick="lnkSaveTraking_OnClick"
                                CssClass="btn btngroup btn-add tooltips clickloader" data-toggle="tooltip">
                            <i class="fa fa-save"></i>
                            </asp:LinkButton>
                        </div>
                        <div class="btn-group">
                            <span class="lblTitle lblDelivered"></span>
                            <span class="lblTitle lblRefused"></span>
                            <span class="lblTitle lblPending"></span>
                            <br />
                            <span class="lblTitle lblTotalAmount">Amount : 110</span>
                            <span class="lblTitle lblTotalQuantity">Quantity : 110</span>
                        </div>
                        <div class="btn-group pull-right mr-5">
                            <asp:LinkButton ID="lnkExcelExport" ToolTip="Excel Export" runat="server" OnClick="lnkExcelExport_OnClick"
                                CssClass="lnkExcelExport btn btngroup btn-export tooltips" data-toggle="tooltip">
                            <i class="fa fa-file-excel-o"></i>
                            </asp:LinkButton>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 search div-master-search div-master-search-xs">
                        <asp:Label ID="lblCountValue" ToolTip="Count" runat="server" Text="10" CssClass="pull-left mr-5 btn btn-icon btn-total tooltips"
                            data-toggle="tooltip">
                        </asp:Label>
                        <div class="input-group">
                            <asp:TextBox ID="txtSearchValue" runat="server" CssClass="form-control master-search"
                                OnChange="addRegionLoader('divloader')" AutoPostBack="true" OnTextChanged="ControlValue_CheckedChanged"
                                placeholder="Search..."></asp:TextBox>
                            <a note-colspan="note-colspan-class" class="tooltips input-group-addon aShowSearch btn btn-master-search ml5"
                                data-original-title="Search" data-toggle="tooltip"><i note-colspan="note-colspan-class"
                                    class="fa fa-chevron-down"></i></a>
                        </div>
                    </div>
                    <div note-colspan="note-colspan-class" class="search-tools divShowSearch note-colspan-class">
                        <asp:Panel ID="Panel1" runat="server" DefaultButton="lnkSearchValue" class="divsearchloader"
                            note-colspan="note-colspan-class">
                            <div class="padbm" note-colspan="note-colspan-class">
                                <asp:DropDownList ID="ddlOrderStatus" runat="server" CssClass="form-control"
                                    note-colspan="note-colspan-class">
                                </asp:DropDownList>
                            </div>
                            <div class="padbm text-right" note-colspan="note-colspan-class">
                                <asp:LinkButton ID="lnkSearchValue" note-colspan="note-colspan-class" OnClientClick="addRegionLoader('divloader')"
                                    OnClick="ControlValue_CheckedChanged" class="btn btn-warning btnsearch" runat="server"><i class="fa fa-filter"></i> Filter</asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="page-content col-md-12 divtable divloader">
                    <div class="table-responsive tabHeight1 fixheight2">
                        <asp:GridView ID="grdOnlineCourierValue" AllowPaging="false" runat="server" OnRowDataBound="grdOnlineCourierValue_OnRowDataBound"
                            OnSelectedIndexChanged="grdOnlineCourierValue_OnSelectedIndexChanged" AutoGenerateColumns="False"
                            class="tblOnlineCourierValue table table-bordered table-hover nomargin fixheader">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="hide" ItemStyle-CssClass="hide">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSelect" CssClass="" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="TrakingId">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrakingId" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate>
                                        <asp:Label ID="lblAmount" runat="server" CssClass="lblAmount"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="lblQuantity" runat="server" CssClass="lblQuantity"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Traking Info">
                                    <ItemTemplate>
                                        <asp:Label ID="lblTrakingInfo" runat="server" CssClass="lblGrid"></asp:Label>
                                        <asp:Label ID="lblLocation" runat="server" CssClass="lblGrid lblLocation"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Order Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblOnlineCourierValueId" runat="server" Visible="false"></asp:Label>
                                        <asp:TextBox ID="txtOrderStatus" runat="server" CssClass="txtOrderStatus hide"></asp:TextBox>
                                        <a class="btn btn-raised btn-default aOrderStatus aDelivered" orderstatus="3">Delivered</a>
                                        <a class="btn btn-raised btn-default aOrderStatus aRefused" orderstatus="2">Refused</a>
                                        <a class="btn btn-raised btn-default aOrderStatus aNoData" orderstatus="1">No Data</a>
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
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="popup" runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
            <asp:PostBackTrigger ControlID="btnSaveAndNew" />
        </Triggers>
        <ContentTemplate>
            <asp:LinkButton ID="lnkFakeConfirmation" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="popupConfirmation" runat="server" DropShadow="false"
                PopupControlID="pnlConfirmation" BehaviorID="PopupBehaviorID1" TargetControlID="lnkFakeConfirmation"
                BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlConfirmation" CssClass="modal-content zoomIn modal-confirmation col-xs-12 col-sm-12 col-md-12 p0"
                Style="display: none" runat="server">
                <CP:ConfirmationPopup ID="Confirmationpopup" runat="server" />
            </asp:Panel>
            <asp:LinkButton ID="lnkFackOnlineCourier" runat="server"></asp:LinkButton>
            <cc1:ModalPopupExtender ID="popupOnlineCourier" runat="server" DropShadow="false" BehaviorID="PopupBehaviorID3"
                PopupControlID="pnlpopupOnlineCourier" TargetControlID="lnkFackOnlineCourier" BackgroundCssClass="modalBackground">
            </cc1:ModalPopupExtender>
            <asp:Panel ID="pnlpopupOnlineCourier" runat="server" DefaultButton="btnSave" CssClass="modelpopup col-lg-6 col-md-6 col-sm-8 col-xs-12 p0"
                Style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content darkmodel">
                        <div class="modal-header bg-black">
                            <button type="button" class="ClosePopup close">
                                ×</button>
                            <h4 class="modal-title">
                                <asp:Label ID="lblPopupTitle" runat="server">Online Courier</asp:Label></h4>
                        </div>
                        <div class="modal-body divloaderOnlineCourier checkvalidOnlineCourierDetail">
                            <div class="form-horizontal">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Name<span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtOnlineCourierName" CssClass="form-control" ZValidation="e=blur|v=IsRequired|m=OnlineCourier Name"
                                                runat="server" MaxLength="50" placeholder="Enter OnlineCourier"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Date<span class="text-danger">*</span>
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtDate" CssClass="form-control datepicker" ZValidation="e=blur|v=IsDate|m=Date"
                                                runat="server" placeholder="Enter Date"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Payment Made
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtPaymentMade" CssClass="form-control" runat="server" placeholder="Enter Payment Made"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Payment Recived
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtPaymentRecived" CssClass="form-control" runat="server" placeholder="Enter Payment Recived"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Description
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:TextBox ID="txtDescription" TextMode="MultiLine" CssClass="form-control" runat="server" placeholder="Enter Description"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-lg-3 col-md-3 col-sm-4 control-label">
                                            Upload Sheet
                                        </label>
                                        <div class="col-lg-8 col-md-8 col-sm-7">
                                            <asp:FileUpload ID="fuSheet" CssClass="form-control" runat="server" />
                                            <span>Column- TrakingId, CarrierId, Amount, Quantity</span>
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
    <asp:LinkButton ID="lnkFakeExcelExport" runat="server"></asp:LinkButton>
    <cc1:ModalPopupExtender ID="popupExcelExport" runat="server" DropShadow="false" PopupControlID="pblExcelExport"
        BehaviorID="PopupBehaviorID4" TargetControlID="lnkFakeExcelExport" BackgroundCssClass="modalBackground">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pblExcelExport" CssClass="modelpopup col-lg-3 col-md-3 col-sm-6 col-xs-12 p0"
        Style="display: none" runat="server">
        <EE:ExcelExportPopup ID="ExcelExport" runat="server" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="script" runat="Server">

    <script type="text/javascript">
        function AddControl() {
            if ($(".lnkAdd").attr("class") != undefined) {
			    <%= Page.ClientScript.GetPostBackEventReference(lnkAdd, String.Empty) %>;
                ShowPopupAndLoader(3, "divloaderOnlineCourier");
                return true;
            }
        }

        function EditControl() {
            if ($(".lnkEdit").attr("class") != undefined) {
                if (IsValidRowSelection()) {
			        <%= Page.ClientScript.GetPostBackEventReference(lnkEdit, String.Empty) %>;
                    ShowPopupAndLoader(3, "divloaderOnlineCourier");
                    return true;
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
                ShowPopupAndLoader(3, "divloaderOnlineCourier");
                return true;
            });

            $(".lnkEdit").click(function () {
                ShowPopupAndLoader(3, "divloaderOnlineCourier");
                return true;
            });

            $(".lnkEditOnlineCourier").click(function () {
                ShowPopupAndLoader(3, "divloaderOnlineCourier");
                return true;
            });

            $(".btnSave").click(function () {
                if (CheckValidation("checkvalidOnlineCourierDetail")) {
                    addLoader('btnSave');
                    return true;
                }
                else {
                    return false;
                }
            });

            $(".btnSaveAndNew").click(function () {
                if (CheckValidation("checkvalidOnlineCourierDetail")) {
                    addLoader('btnSaveAndNew');
                    return true;
                }
                else {
                    return false;
                }
            });

            $(".lnkExcelExport").click(function () {
                ShowPopupAndLoader(4, "divloaderexport");
                return true;
            });

            $(".aOrderStatus").click(function () {
                var txtOrderStatus = $(this).parent().find(".txtOrderStatus");
                txtOrderStatus.val($(this).attr("orderstatus"));

                SetData();
            });

            SetData();
            function SetData() {
                var TotalDelivered = 0, TotalPending = 0, TotalRefused = 0;
                var TotalAmount = 0;
                var TotalQuantity = 0;

                $(".tblOnlineCourierValue tbody tr").each(function () {
                    var txtOrderStatus = $(this).find(".txtOrderStatus");

                    var aDelivered = $(this).find(".aDelivered");
                    var aRefused = $(this).find(".aRefused");
                    var aNoData = $(this).find(".aNoData");

                    var lblAmount = $(this).find(".lblAmount");
                    var lblQuantity = $(this).find(".lblQuantity");

                    var OrderStatus = parseInt(txtOrderStatus.val());
                    if (isNaN(OrderStatus))
                        OrderStatus = 1;

                    aDelivered.removeClass("lnkDelivered");
                    aRefused.removeClass("lnkRefused");
                    aNoData.removeClass("lnkNoData");

                    if (OrderStatus == 1) {
                        TotalPending = TotalPending + 1;
                        aNoData.addClass("lnkNoData");
                    }
                    else if (OrderStatus == 2) {
                        TotalRefused = TotalRefused + 1;
                        aRefused.addClass("lnkRefused");
                    }
                    else if (OrderStatus == 3) {
                        TotalDelivered = TotalDelivered + 1;
                        aDelivered.addClass("lnkDelivered");

                        var Amount = parseFloat(lblAmount.text());
                        if (isNaN(Amount))
                            Amount = 0;

                        var Quantity = parseInt(lblQuantity.text());
                        if (isNaN(Quantity))
                            Quantity = 0;

                        TotalAmount = TotalAmount + Amount;
                        TotalQuantity = TotalQuantity + Quantity;
                    }

                });



                $(".lblDelivered").html("Delivered : <b>" + TotalDelivered + "</b>");
                $(".lblRefused").html("Refused : <b>" + TotalRefused + "</b>");
                $(".lblPending").html("Pending : <b>" + TotalPending + "</b>");

                $(".lblTotalAmount").html("Amount : <b>" + TotalAmount + "</b>");
                $(".lblTotalQuantity").html("Quantity : <b>" + TotalQuantity + "</b>");

            }
        }

    </script>

</asp:Content>
