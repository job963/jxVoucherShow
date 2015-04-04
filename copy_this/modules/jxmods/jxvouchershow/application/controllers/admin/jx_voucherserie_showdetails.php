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

class jx_voucherserie_showdetails extends oxAdminDetails {

    protected $_sThisTemplate = "jx_voucherserie_showdetails.tpl";

    /**
     * Displays all vouchers of this series
     */
    public function render() 
	{
		parent::render();

		$sVoucherserieId = $this->getEditObjectId();
		
		$sSql = "SELECT IF(v.oxdateused='0000-00-00',1,0) AS oxactive, v.oxdateused, v.oxvouchernr, v.oxdiscount, v.oxuserid, u.oxfname, u.oxlname, o.oxordernr, o.oxtotalordersum , v.oxvoucherserieid "
					. "FROM oxvouchers v "
					. "LEFT JOIN oxuser u ON (v.oxuserid = u.oxid) "
					. "LEFT JOIN oxorder o ON (v.oxorderid = o.oxid) "
					. "WHERE v.oxvoucherserieid = '{$sVoucherserieId}' "
					. "ORDER BY v.oxdateused, v.oxvouchernr ";
		
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
