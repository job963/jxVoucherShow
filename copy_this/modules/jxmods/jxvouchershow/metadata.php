<?php
/**
 * Metadata version
 */
$sMetadataVersion = '1.1';
 
/**
 * Module information
 */
$aModule = array(
    'id'           => 'jxvouchershow',
    'title'        => 'jxVoucherShow - Anzeige der erzeugten Gutscheine',
    'description'  => array(
                        'de' => 'Anzeige der erzeugten Gutschein und deren Verwendung.',
                        'en' => 'Display of created vouchers and their use.'
                        ),
    'thumbnail'    => 'jxvouchershow.png',
    'version'      => '0.1',
    'author'       => 'Joachim Barthel',
    'url'          => 'https://github.com/job963/jxvouchershow',
    'email'        => 'jobarthel@gmail.com',
    'extend'       => array(
						),
    'files'        => array(
						'jx_voucherserie_show'     			=> 'jxmods/jxvouchershow/application/controllers/admin/jx_voucherserie_show.php'
						),
    'templates' => array(
						'jx_voucherserie_show.tpl' 			=> 'jxmods/jxvouchershow/application/views/admin/tpl/jx_voucherserie_show.tpl',
						'jx_voucherserie_showdetails.tpl' 	=> 'jxmods/jxvouchershow/application/views/admin/tpl/jx_voucherserie_showdetails.tpl'
						)
);