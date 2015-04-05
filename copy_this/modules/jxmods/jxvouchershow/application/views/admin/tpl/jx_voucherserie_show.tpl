[{include file="headitem.tpl" title="GENERAL_ADMIN_TITLE"|oxmultilangassign}]

[{ if $readonly}]
    [{assign var="readonly" value="readonly disabled"}]
[{else}]
    [{assign var="readonly" value=""}]
[{/if}]

<script type="text/javascript">
<!--
function changeFnc( fncName )
{
    var langvar = document.myedit.elements['fnc'];
    if (langvar != null )
        langvar.value = fncName;
}
//-->
</script>

<form name="transfer" id="transfer" action="[{ $oViewConf->getSelfLink() }]" method="post">
    [{ $oViewConf->getHiddenSid() }]
    <input type="hidden" name="oxid" value="[{ $oxid }]">
    <input type="hidden" name="cl" value="jx_voucherserie_show">
</form>


<div style="height:100%;">

    <div id="liste" style="border:0px solid gray; padding:4px; [{*height:100%; width:100%;*}]width:59%; height:96%; overflow-y:scroll; float:left;">
        <form name="vouchershow" id="vouchershow" action="[{ $oViewConf->getSelfLink() }]" method="post">
            [{ $oViewConf->getHiddenSid() }]
            <input type="hidden" name="oxid" value="[{ $oxid }]">
            <input type="hidden" name="cl" value="jx_voucherserie_show">
            <input type="hidden" name="fnc" value="">
            <input type="hidden" name="voucherdelid" value="">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                    <td class="listheader first">[{ oxmultilang ident="GENERAL_ACTIVTITLE" }]</td>
                    <td class="listheader">[{ oxmultilang ident="VOUCHERSERIE_MAIN_VOUCHERNUM" }]</td>
                    <td class="listheader" height="15">[{ oxmultilang ident="VOUCHERSERIE_MAIN_DISCOUNT" }]</td>
                    <td class="listheader" height="15">[{ oxmultilang ident="GENERAL_ORDERNUM" }]</td>
                    <td class="listheader">[{ oxmultilang ident="ORDER_LIST_CUSTOMERFNAME" }] [{ oxmultilang ident="ORDER_LIST_CUSTOMERLNAME" }]</td>
                    <td class="listheader" colspan="2">[{ oxmultilang ident="GENERAL_SUMTOTAL" }]</td>
                </tr>
                [{foreach item=aVoucher from=$aVouchers}]
                    [{ cycle values="listitem,listitem2" assign="listclass" }]
                    <tr>
                        <td class="[{ $listclass }][{if $aVoucher.oxactive == "1"}] active[{/if}]" height="15"><div class="listitemfloating">&nbsp</div></td>
                        <td class="[{ $listclass }]"><a href="[{$oViewConf->getSelfLink()}]&cl=jx_voucherserie_show&voucherid=[{$aVoucher.oxid}]" target="jxvouchershow_detail">[{$aVoucher.oxvouchernr}]</a></td>
                        <td class="[{ $listclass }]">[{$aVoucher.oxdiscount}]</td>
                        <td class="[{ $listclass }]">[{$aVoucher.oxordernr}]</td>
                        <td class="[{ $listclass }]">[{$aVoucher.oxfname}] [{$aVoucher.oxlname}]</td>
                        <td class="[{ $listclass }]" width="5%">[{if $aVoucher.oxtotalordersum != ""}][{$aVoucher.oxtotalordersum|string_format:"%.2f"}][{/if}]</td>
                        <td class="[{ $listclass }]" width="1%">
                            [{if $aVoucher.oxactive == "1" && !$readonly}]
                                <a href="#" 
                                   class="delete" id="del.[{$_cnt}]" title="" [{include file="help.tpl" helpid=item_delete}] 
                                   onclick="document.forms.vouchershow.fnc.value='deleteVoucher';
                                            document.forms.vouchershow.voucherdelid.value='[{$aVoucher.oxid}]';
                                            if (confirm('[{ oxmultilang ident="JXMODS_DELETECONFIRM" }]')==true)
                                                document.forms.vouchershow.submit();"></a>
                            [{/if}]
                        </td>
                    </tr>
                [{/foreach}]
            </table>
        </form>
    </div>

    <div style="width:40%;float:left;">
    <fieldset title="Gutschein" style="margin-left:15px; padding-top:15px;">
            <legend>Gutschein</legend>
            <iframe src="[{$oViewConf->getSelfLink()}]&cl=jx_voucherserie_show&voucherid=[{$oxid}]" width="100%" height="250" frameborder="0" name="jxvouchershow_detail" align="left">
            </iframe>
    </fieldset>
    </div>

    <div style="float:right;position:relative;bottom:-40px;padding-right:10px;">
            <a href="https://github.com/job963/jxVoucherShow" target="_blank"><span style="color:gray;">jxVoucherShow</span></a>
    </div>

</div>

[{include file="bottomnaviitem.tpl"}]
[{include file="bottomitem.tpl"}]

