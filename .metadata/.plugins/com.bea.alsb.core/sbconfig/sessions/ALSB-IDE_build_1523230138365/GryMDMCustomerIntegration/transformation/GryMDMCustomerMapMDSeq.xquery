<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$mASTERDATA_CUSTOMER1" element="ns1:MASTERDATA_CUSTOMER" location="../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../../GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns1:MASTERDATA_CUSTOMER" location="../xsd/GryEbizCustomer.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/BulkUpdateMasterData";
declare namespace ns1 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/ReMapMasterDataSeq/";

declare function xf:ReMapMasterDataSeq($mASTERDATA_CUSTOMER1 as element(ns1:MASTERDATA_CUSTOMER),
    $outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:MASTERDATA_CUSTOMER) {
        <ns1:MASTERDATA_CUSTOMER>
            <ns1:MessageHeader>{ $mASTERDATA_CUSTOMER1/ns1:MessageHeader/@* , $mASTERDATA_CUSTOMER1/ns1:MessageHeader/node() }</ns1:MessageHeader>
            {
                for $PARTY in $mASTERDATA_CUSTOMER1/ns1:PARTY
                return
                    <ns1:PARTY>
                        <ns1:PARTY_ID>{ data($outputParameters1/ns0:P_MDM_MASTER_DATA_BULK_REQ/ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM[ns0:P_MASTER_DATA/text() = $PARTY/ns1:PARTY_ID/text() and ns0:P_MASTER_SEQ = "1"]/ns0:P_MASTER_DATA_SEQ) }</ns1:PARTY_ID>
                        <ns1:PARENT_PARTY_ID>{ data($PARTY/ns1:PARENT_PARTY_ID) }</ns1:PARENT_PARTY_ID>
                        <ns1:PARENT_PARTY_NUMBER>{ data($PARTY/ns1:PARENT_PARTY_NUMBER) }</ns1:PARENT_PARTY_NUMBER>
                        <ns1:PARENT_PARTY_NAME>{ data($PARTY/ns1:PARENT_PARTY_NAME) }</ns1:PARENT_PARTY_NAME>
                        <ns1:PARTY_NUMBER>{ data($PARTY/ns1:PARTY_NUMBER) }</ns1:PARTY_NUMBER>
                        <ns1:PARTY_NAME>{ data($PARTY/ns1:PARTY_NAME) }</ns1:PARTY_NAME>
                        
                        <ns1:STREET_NAME>{ data($PARTY/ns1:STREET_NAME) }</ns1:STREET_NAME>
                        <ns1:HOUSE_NUMBER>{ data($PARTY/ns1:HOUSE_NUMBER) }</ns1:HOUSE_NUMBER>
                        <ns1:TOWN>{ data($PARTY/ns1:TOWN) }</ns1:TOWN>
                        <ns1:COUNTY>{ data($PARTY/ns1:COUNTY) }</ns1:COUNTY>
                        <ns1:POSTAL_CODE>{ data($PARTY/ns1:POSTAL_CODE) }</ns1:POSTAL_CODE>
                        <ns1:EMAIL>{ data($PARTY/ns1:EMAIL) }</ns1:EMAIL>
                        <ns1:PHONE>{ data($PARTY/ns1:PHONE) }</ns1:PHONE>
                        {
                            for $PARTY_TAX_REFERENCE in $PARTY/ns1:PARTY_TAX_REFERENCE
                            return
                                <ns1:PARTY_TAX_REFERENCE>{ data($PARTY_TAX_REFERENCE) }</ns1:PARTY_TAX_REFERENCE>
                        }
                        <ns1:ESSO_DEALER_FLAG>{ data($PARTY/ns1:ESSO_DEALER_FLAG) }</ns1:ESSO_DEALER_FLAG>
                        {
                            for $CUSTOMER_ACCOUNT in $PARTY/ns1:CUSTOMER_ACCOUNT
                            return
                                <ns1:CUSTOMER_ACCOUNT>
                                    <ns1:CUST_ACCOUNT_ID>{ data($outputParameters1/ns0:P_MDM_MASTER_DATA_BULK_REQ/ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM[ns0:P_MASTER_DATA/text() = $CUSTOMER_ACCOUNT/ns1:CUST_ACCOUNT_ID/text()and ns0:P_MASTER_SEQ = "2"]/ns0:P_MASTER_DATA_SEQ) }</ns1:CUST_ACCOUNT_ID>
                                    <ns1:PARTY_ID>{ data($CUSTOMER_ACCOUNT/ns1:PARTY_ID) }</ns1:PARTY_ID>
                                    <ns1:CUSTOMER_ACCOUNT_NUMBER>{ data($CUSTOMER_ACCOUNT/ns1:CUSTOMER_ACCOUNT_NUMBER) }</ns1:CUSTOMER_ACCOUNT_NUMBER>
                                    <ns1:CUSTOMER_CLASS>{ data($CUSTOMER_ACCOUNT/ns1:CUSTOMER_CLASS) }</ns1:CUSTOMER_CLASS>
                                    <ns1:CUSTOMER_TYPE>{ data($CUSTOMER_ACCOUNT/ns1:CUSTOMER_TYPE) }</ns1:CUSTOMER_TYPE>
                                    <ns1:PROFILE_CLASS>{ data($CUSTOMER_ACCOUNT/ns1:PROFILE_CLASS) }</ns1:PROFILE_CLASS>
                                    {
                                        for $CREDIT_CLASSIFICATION in $CUSTOMER_ACCOUNT/ns1:CREDIT_CLASSIFICATION
                                        return
                                            <ns1:CREDIT_CLASSIFICATION>{ data($CREDIT_CLASSIFICATION) }</ns1:CREDIT_CLASSIFICATION>
                                    }
                                    {
                                        for $CREDIT_LIMIT_AMOUNT in $CUSTOMER_ACCOUNT/ns1:CREDIT_LIMIT_AMOUNT
                                        return
                                            <ns1:CREDIT_LIMIT_AMOUNT>{ data($CREDIT_LIMIT_AMOUNT) }</ns1:CREDIT_LIMIT_AMOUNT>
                                    }
                                    <ns1:CREDIT_LIMIT_CURRENCY>{ data($CUSTOMER_ACCOUNT/ns1:CREDIT_LIMIT_CURRENCY) }</ns1:CREDIT_LIMIT_CURRENCY>
                                    {
                                        for $CUSTOMER_SITE in $CUSTOMER_ACCOUNT/ns1:CUSTOMER_SITE
                                        return
                                            <ns1:CUSTOMER_SITE>
                                                <ns1:CUST_ACCT_SITE_ID>{ data($outputParameters1/ns0:P_MDM_MASTER_DATA_BULK_REQ/ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM[ns0:P_MASTER_DATA/text() = $CUSTOMER_SITE/ns1:CUST_ACCT_SITE_ID/text()and ns0:P_MASTER_SEQ = "3"]/ns0:P_MASTER_DATA_SEQ) }</ns1:CUST_ACCT_SITE_ID>
                                                <ns1:CUST_ACCOUNT_ID>{ data($CUSTOMER_SITE/ns1:CUST_ACCOUNT_ID) }</ns1:CUST_ACCOUNT_ID>
                                                <ns1:PARTY_SITE_ID>{ data($CUSTOMER_SITE/ns1:PARTY_SITE_ID) }</ns1:PARTY_SITE_ID>
                                                <ns1:PARTY_SITE_NUMBER>{ data($CUSTOMER_SITE/ns1:PARTY_SITE_NUMBER) }</ns1:PARTY_SITE_NUMBER>
                                                <ns1:PARTY_SITE_NAME>{ data($CUSTOMER_SITE/ns1:PARTY_SITE_NAME) }</ns1:PARTY_SITE_NAME>
                                                <ns1:OPERATING_UNIT>{ data($CUSTOMER_SITE/ns1:OPERATING_UNIT) }</ns1:OPERATING_UNIT>
                                                <ns1:BILL_TO_FLAG>{ data($CUSTOMER_SITE/ns1:BILL_TO_FLAG) }</ns1:BILL_TO_FLAG>
                                                <ns1:SHIP_TO_FLAG>{ data($CUSTOMER_SITE/ns1:SHIP_TO_FLAG) }</ns1:SHIP_TO_FLAG>
                                                <ns1:ADDRESS1>{ data($CUSTOMER_SITE/ns1:ADDRESS1) }</ns1:ADDRESS1>
                                                {
                                                    for $ADDRESS2 in $CUSTOMER_SITE/ns1:ADDRESS2
                                                    return
                                                        <ns1:ADDRESS2>{ data($ADDRESS2) }</ns1:ADDRESS2>
                                                }
                                                {
                                                    for $ADDRESS3 in $CUSTOMER_SITE/ns1:ADDRESS3
                                                    return
                                                        <ns1:ADDRESS3>{ data($ADDRESS3) }</ns1:ADDRESS3>
                                                }
                                                {
                                                    for $POSTAL_CODE in $CUSTOMER_SITE/ns1:POSTAL_CODE
                                                    return
                                                        <ns1:POSTAL_CODE>{ data($POSTAL_CODE) }</ns1:POSTAL_CODE>
                                                }
                                                {
                                                    for $CITY in $CUSTOMER_SITE/ns1:CITY
                                                    return
                                                        <ns1:CITY>{ data($CITY) }</ns1:CITY>
                                                }
                                                {
                                                    for $COUNTY in $CUSTOMER_SITE/ns1:COUNTY
                                                    return
                                                        <ns1:COUNTY>{ data($COUNTY) }</ns1:COUNTY>
                                                }
                                                <ns1:COUNTRY>{ data($CUSTOMER_SITE/ns1:COUNTRY) }</ns1:COUNTRY>
                                                <ns1:EMAIL>{ data($CUSTOMER_SITE/ns1:EMAIL) }</ns1:EMAIL>
                                                <ns1:PHONE>{ data($CUSTOMER_SITE/ns1:PHONE) }</ns1:PHONE>
                                                <ns1:SCHEDULE_GROUP>{ data($CUSTOMER_SITE/ns1:SCHEDULE_GROUP) }</ns1:SCHEDULE_GROUP>                                               
                                                <ns1:SITE_KEY>{ data($CUSTOMER_SITE/ns1:SITE_KEY) }</ns1:SITE_KEY>
                                                {
                                                    for $CUSTOMER_SITE_USE in $CUSTOMER_SITE/ns1:CUSTOMER_SITE_USE
                                                    return
                                                        <ns1:CUSTOMER_SITE_USE>
                                                            <ns1:SITE_USE_ID>{ data($outputParameters1/ns0:P_MDM_MASTER_DATA_BULK_REQ/ns0:P_MDM_MASTER_DATA_BULK_REQ_ITEM[ns0:P_MASTER_DATA/text() = $CUSTOMER_SITE_USE/ns1:SITE_USE_ID/text() and ns0:P_MASTER_SEQ = "4"]/ns0:P_MASTER_DATA_SEQ) }</ns1:SITE_USE_ID>
                                                            <ns1:CUST_ACCT_SITE_ID>{ data($CUSTOMER_SITE_USE/ns1:CUST_ACCT_SITE_ID) }</ns1:CUST_ACCT_SITE_ID>
                                                            <ns1:SITE_USE_CODE>{ data($CUSTOMER_SITE_USE/ns1:SITE_USE_CODE) }</ns1:SITE_USE_CODE>
                                                            <ns1:SITE_USE_KEY>{ data($CUSTOMER_SITE_USE/ns1:SITE_USE_KEY) }</ns1:SITE_USE_KEY>
                                                            <ns1:SITE_PRIMARY_FLAG>{ data($CUSTOMER_SITE_USE/ns1:SITE_PRIMARY_FLAG) }</ns1:SITE_PRIMARY_FLAG>
                                                            <ns1:SITE_CODE>{ data($CUSTOMER_SITE_USE/ns1:SITE_CODE) }</ns1:SITE_CODE>
                                                            {
                                                                for $PRIMARY_RECEIPT_METHOD in $CUSTOMER_SITE_USE/ns1:PRIMARY_RECEIPT_METHOD
                                                                return
                                                                    <ns1:PRIMARY_RECEIPT_METHOD>{ data($PRIMARY_RECEIPT_METHOD) }</ns1:PRIMARY_RECEIPT_METHOD>
                                                            }
                                                            {
                                                                for $PAYMENT_TERM in $CUSTOMER_SITE_USE/ns1:PAYMENT_TERM
                                                                return
                                                                    <ns1:PAYMENT_TERM>{ data($PAYMENT_TERM) }</ns1:PAYMENT_TERM>
                                                            }
                                                        </ns1:CUSTOMER_SITE_USE>
                                                }
                                            </ns1:CUSTOMER_SITE>
                                    }
                                </ns1:CUSTOMER_ACCOUNT>
                        }
                    </ns1:PARTY>
            }
        </ns1:MASTERDATA_CUSTOMER>
};

declare variable $mASTERDATA_CUSTOMER1 as element(ns1:MASTERDATA_CUSTOMER) external;
declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:ReMapMasterDataSeq($mASTERDATA_CUSTOMER1,
    $outputParameters1)]]></con:xquery>
    <con:dependency location="../xsd/GryEbizCustomer.xsd">
        <con:schema ref="GryMDMCustomerIntegration/xsd/GryEbizCustomer"/>
    </con:dependency>
    <con:dependency location="../../GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/BulkUpdateMasterData_sp"/>
    </con:dependency>
</con:xqueryEntry>