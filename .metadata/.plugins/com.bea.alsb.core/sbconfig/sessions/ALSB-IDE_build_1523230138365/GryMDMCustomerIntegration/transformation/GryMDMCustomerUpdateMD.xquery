<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$mASTERDATA_CUSTOMER1" element="ns1:MASTERDATA_CUSTOMER" location="../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/BulkUpdateMasterData";
declare namespace ns1 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/BulkUpdateMasterData/";

declare function xf:BulkUpdateMasterData($mASTERDATA_CUSTOMER1 as element(ns1:MASTERDATA_CUSTOMER))
    as element(ns0:InputParameters) {
        let $MASTERDATA_CUSTOMER := $mASTERDATA_CUSTOMER1
        return
            <ns0:InputParameters>
                <ns0:P_MDM_MASTER_DATA_BULK_REQ>


                   
                  	{
                    for $PARTY in $MASTERDATA_CUSTOMER/ns1:PARTY
                    return
 							<ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
	                        	<ns0:P_MASTER_DATA_SEQ>0</ns0:P_MASTER_DATA_SEQ>
                            	<ns0:P_MASTER_SEQ>1</ns0:P_MASTER_SEQ>
                            	<ns0:P_MASTER_DATA>{ data($PARTY/ns1:PARTY_ID) }</ns0:P_MASTER_DATA>
                           		<ns0:P_TARGET_ALIAS>{ data($PARTY/ns1:PARTY_NAME) }</ns0:P_TARGET_ALIAS>
                        	</ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
               		}
                	{
                    for $CUSTOMER_ACCOUNT in $MASTERDATA_CUSTOMER//ns1:CUSTOMER_ACCOUNT
                    return
                        <ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                            <ns0:P_MASTER_DATA_SEQ>0</ns0:P_MASTER_DATA_SEQ>
                            <ns0:P_MASTER_SEQ>2</ns0:P_MASTER_SEQ>
                            <ns0:P_MASTER_DATA>{ data($CUSTOMER_ACCOUNT/ns1:CUST_ACCOUNT_ID) }</ns0:P_MASTER_DATA>
                            <ns0:P_TARGET_ALIAS>{ data($CUSTOMER_ACCOUNT/ns1:CUSTOMER_ACCOUNT_NUMBER) }</ns0:P_TARGET_ALIAS>
                        </ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                	}
                	
                	{
                    for $CUSTOMER_SITE in $MASTERDATA_CUSTOMER//ns1:CUSTOMER_SITE
                    return
                        <ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                            <ns0:P_MASTER_DATA_SEQ>0</ns0:P_MASTER_DATA_SEQ>
                            <ns0:P_MASTER_SEQ>3</ns0:P_MASTER_SEQ>
                            <ns0:P_MASTER_DATA>{ data($CUSTOMER_SITE/ns1:CUST_ACCT_SITE_ID) }</ns0:P_MASTER_DATA>
                            <ns0:P_TARGET_ALIAS>{ data($CUSTOMER_SITE/ns1:SITE_KEY) }</ns0:P_TARGET_ALIAS>
                        </ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                	}
                	
                	{
                    for $CUSTOMER_SITE_USE in $MASTERDATA_CUSTOMER//ns1:CUSTOMER_SITE_USE
                    return
                        <ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                            <ns0:P_MASTER_DATA_SEQ>0</ns0:P_MASTER_DATA_SEQ>
							<ns0:P_MASTER_SEQ>4</ns0:P_MASTER_SEQ>
                            <ns0:P_MASTER_DATA>{ data($CUSTOMER_SITE_USE/ns1:SITE_USE_ID) }</ns0:P_MASTER_DATA>
							<ns0:P_TARGET_ALIAS>{ data($CUSTOMER_SITE_USE/ns1:SITE_USE_KEY) }</ns0:P_TARGET_ALIAS>
                        </ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM>
                	}
			  </ns0:P_MDM_MASTER_DATA_BULK_REQ>
            </ns0:InputParameters>
};

declare variable $mASTERDATA_CUSTOMER1 as element(ns1:MASTERDATA_CUSTOMER) external;

xf:BulkUpdateMasterData($mASTERDATA_CUSTOMER1)]]></con:xquery>
    <con:dependency location="../xsd/GryEbizCustomer.xsd">
        <con:schema ref="GryMDMCustomerIntegration/xsd/GryEbizCustomer"/>
    </con:dependency>
    <con:dependency location="../../GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp"/>
    </con:dependency>
</con:xqueryEntry>