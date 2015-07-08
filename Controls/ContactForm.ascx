<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactForm.ascx.cs" Inherits="Controls_ContactForm" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>

<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <table class="auto-style1" runat="server" id="FormTable">
            <tr>
                <td colspan="3">Contact form to get in touch</td>
            </tr>
            <tr>
                <td>Name</td>
                <td>
                    <asp:TextBox ID="Name" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" CssClass="ErrorMessage" ErrorMessage="Enter your name">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>EmailAddress</td>
                <td>
                    <asp:TextBox ID="EmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="EmailAddress" CssClass="ErrorMessage" ErrorMessage="Enter a valid e-mail address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="EmailAddress" CssClass="ErrorMessage" ErrorMessage="Enter an e-mail Address">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>ConfirmEmail</td>
                <td>
                    <asp:TextBox ID="ConfirmEmailAddress" runat="server" TextMode="Email"></asp:TextBox>
                </td>
                <td>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="EmailAddress" ControlToValidate="ConfirmEmailAddress" CssClass="ErrorMessage" ErrorMessage="The e-mail addresses don't match">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ConfirmEmailAddress" CssClass="ErrorMessage" ErrorMessage="Confirm the e-mail address">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Phone</td>
                <td>
                    <asp:TextBox ID="PhoneHome" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ClientValidationFunction="validatePhoneNumbers" CssClass="ErrorMessage" Display="Dynamic" ErrorMessage="Enter your home or bysiness phone number" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Work Phone</td>
                <td>
                    <asp:TextBox ID="PhoneBusiness" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Comments</td>
                <td>
                    <asp:TextBox ID="Comments" runat="server" Height="53px" TextMode="MultiLine" Width="280px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Comments" CssClass="ErrorMessage" ErrorMessage="Enter a comment">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="SendButton" runat="server" Text="Send" OnClick="SendButton_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorMessage" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Message" runat="server" Text="Message Sent" Visible="false" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        <div class="PleaseWait">
            Please Wait...
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>
<script>
    function validatePhoneNumbers(source, args) {
        var phoneHome = document.getElementById('<%= PhoneHome.ClientID %>');
    var phoneBusiness = document.getElementById('<%= PhoneBusiness.ClientID %>');
    if (phoneHome.value != '' || phoneBusiness.value != '') {
        args.IsValid = true;
    }
    else {
        args.IsValid = false;
    }
}
</script>