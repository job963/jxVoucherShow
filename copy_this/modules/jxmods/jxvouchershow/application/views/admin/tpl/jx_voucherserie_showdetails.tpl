[{include file="headitem.tpl" box="none "
    meta_refresh_sec=$refresh
    meta_refresh_url=$oViewConf->getSelfLink()|cat:"&cl=`$sClassDo`&iStart=`$iStart`&fnc=run"
}]

	<table cellspacing="0" cellpadding="0" border="0" width="100%">
		<colgroup>
			<col width="50%">
			<col width="50%">
		</colgroup>
		[{foreach item=aVoucher from=$aVouchers}]
			<tr>
				<td>[{ oxmultilang ident="VOUCHERSERIE_MAIN_VOUCHERNUM" }]</td>
				<td><b>[{ $aVoucher.oxvouchernr }]</b></td>
			</tr>
			<tr>
				<td>Status</td>
				<td>[{if $aVoucher.oxactive == "1"}]
						<span style="color:forestgreen; font-weight:bold;">[{ oxmultilang ident="VOUCHERSERIE_MAIN_AVAILABLE" }]</span>
					[{else}]
						<span style="color:darkred; font-style:italic; font-weight:bold;">[{ oxmultilang ident="VOUCHERSERIE_MAIN_USED" }]</span>
					[{/if}]
				</td>
			</tr>
			
			<tr style="height:6px;">
				<td colspan="2">
				</td>
			</tr>
			
			<tr>
				<td>[{ oxmultilang ident="GENERAL_ORDERNUM" }]</td>
				<td><b>[{ $aVoucher.oxordernr }]</b></td>
			</tr>
			<tr>
				<td>[{ oxmultilang ident="GENERAL_DATE" }]</td>
				<td><b>[{ $aVoucher.oxorderdate }]</b></td>
			</tr>
			
			<tr style="height:6px;">
				<td colspan="2">
				</td>
			</tr>

			<tr>
				<td valign="top">[{ oxmultilang ident="PRICEALARM_MAIN_CUSTOMER" }]</td>
				<td>
					<b>[{$aVoucher.oxfname}] [{$aVoucher.oxlname}][{if $aVoucher.oxlname}]<br />[{/if}]
					[{$aVoucher.oxstreet}] [{$aVoucher.oxstreetnr}][{if $aVoucher.oxlname}]<br />[{/if}]
					[{$aVoucher.oxzip}] [{$aVoucher.oxcity}]</b>
				</td>
			</tr>
			
			<tr style="height:6px;">
				<td colspan="2">
				</td>
			</tr>
			
			<tr>
				<td>[{ oxmultilang ident="GENERAL_VOUCHERS" }]</td>
				<td>
					[{if $aVoucher.oxdiscount != "" }]
						<b>[{ $aVoucher.oxdiscount|string_format:"%.2f" }]
						[{if $aVoucher.oxdiscounttype == "absolute"}]
							[{ $aVoucher.oxcurrency }]
						[{elseif $aVoucher.oxdiscounttype == "percent"}]
							[{ oxmultilang ident="JX_VOUCHER_SHOW_ABSOLUTE" }] 
						[{else}]
						[{/if}]
					[{/if}]</b>
				</td>
			</tr>
			<tr>
				<td>[{ oxmultilang ident="GENERAL_SUMTOTAL" }]</td>
				<td>
					[{if $aVoucher.oxtotalordersum != "" }]
						<b>[{ $aVoucher.oxtotalordersum|string_format:"%.2f" }] [{ $aVoucher.oxcurrency }]</b>
					[{/if}]
				</td>
			</tr>
			<tr>
				<td></td>
				<td></td>
			</tr>
		[{/foreach}]
	</table>
