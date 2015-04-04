<?php
/**
 *    This file is part of the module jxVoucherShow for OXID eShop Community Edition.
 *
 *    The module jxVoucherShow for OXID eShop Community Edition is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    The module jxVoucherShow for OXID eShop Community Edition is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with OXID eShop Community Edition.  If not, see <http://www.gnu.org/licenses/>.
 *
 * @link      https://github.com/job963/jxVoucherShow
 * @license   http://www.gnu.org/licenses/gpl-3.0.html GPL v3 or later
 * @copyright (C) 2015 Joachim Barthel
 * @author    Joachim Barthel <jobarthel@gmail.com>
 *
 */

class jx_voucherserie_show extends oxAdminDetails {

    protected $_sThisTemplate = "jx_voucherserie_show.tpl";

    /**
     * Displays all vouchers of this series
     */
    public function render() 
	{
		parent::render();

		$sVoucherserieId = $this->getEditObjectId();
		
        $sVoucherId = oxRegistry::getConfig()->getRequestParameter("voucherid");
		if ( $sVoucherId ) {
			$sWhere = " v.oxid = '{$sVoucherId}' ";
            $this->_sThisTemplate = "jx_voucherserie_showdetails.tpl";
        }
		else {
			$sWhere = "v.oxvoucherserieid = '{$sVoucherserieId}' ";
		}
		
		$sSql = "SELECT IF(v.oxdateused='0000-00-00',1,0) AS oxactive, v.oxid, v.oxdateused, v.oxvouchernr, v.oxdiscount, s.oxdiscounttype, v.oxuserid, "
						. "o.oxbillfname AS oxfname, o.oxbilllname AS oxlname, o.oxbillstreet AS oxstreet, o.oxbillstreetnr AS ostreetnr, o.oxbillzip AS oxzip, o.oxbillcity AS oxcity, "
						. "o.oxordernr, o.oxorderdate, o.oxtotalordersum, o.oxcurrency , v.oxvoucherserieid "
					. "FROM oxvouchers v "
					//. "LEFT JOIN oxuser u ON (v.oxuserid = u.oxid) "
					. "LEFT JOIN oxorder o ON (v.oxorderid = o.oxid) "
					. "LEFT JOIN oxvoucherseries s ON (v.oxvoucherserieid = s.oxid) "
					. "WHERE {$sWhere} "
					. "ORDER BY oxactive DESC, v.oxdateused DESC, v.oxvouchernr ";
		
		//echo $sSql.'<hr>';
		$oDb = oxDb::getDb( oxDB::FETCH_MODE_ASSOC );
		$rs = $oDb->Execute($sSql);
		$aVouchers = array();
		while (!$rs->EOF) {
			array_push($aVouchers, $rs->fields);
			$rs->MoveNext();
		}
		
		$this->_aViewData["aVouchers"] = $aVouchers;
		
		return $this->_sThisTemplate;
	}
	
}
