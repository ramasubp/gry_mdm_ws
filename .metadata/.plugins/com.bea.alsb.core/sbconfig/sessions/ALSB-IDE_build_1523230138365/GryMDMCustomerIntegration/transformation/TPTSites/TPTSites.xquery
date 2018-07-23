<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$MASTERDATA_CUSTOMER" element="ns0:MASTERDATA_CUSTOMER" location="../../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutLocation" location="../../wsdl/TPTCustomer.wsdl" ::)

declare namespace ns0 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTCustomerSites/";

declare function xf:TPTCustomerSites($MASTERDATA_CUSTOMER as element(ns0:MASTERDATA_CUSTOMER))
    as element(ns1:PutLocation) {
        let $MASTERDATA_CUSTOMER := $MASTERDATA_CUSTOMER
        return
            <ns1:PutLocation>
                <ns1:locations>
                    {
                        for $PARTY in $MASTERDATA_CUSTOMER/ns0:PARTY,
                            $CUSTOMER_ACCOUNT in $PARTY/ns0:CUSTOMER_ACCOUNT,
                            $CUSTOMER_SITE in $CUSTOMER_ACCOUNT/ns0:CUSTOMER_SITE
                        return
                            <ns1:location>
                                <ns1:LocationNum>{ data($CUSTOMER_SITE/ns0:CUST_ACCT_SITE_ID) }</ns1:LocationNum>
                                <ns1:LocationCode>{ concat(substring(concat($PARTY/ns0:PARTY_NAME , $CUSTOMER_SITE/ns0:PARTY_SITE_NUMBER),1,20) ,'-', substring($CUSTOMER_SITE/ns0:PARTY_SITE_NAME,1,8 ),'-', substring($CUSTOMER_SITE/ns0:POSTAL_CODE,1,8)) }</ns1:LocationCode>
                                <ns1:LocationName>{ concat(substring(concat($PARTY/ns0:PARTY_NAME , $CUSTOMER_SITE/ns0:PARTY_SITE_NUMBER),1,20) ,'-', substring($CUSTOMER_SITE/ns0:PARTY_SITE_NAME,1,8 ),'-', substring($CUSTOMER_SITE/ns0:POSTAL_CODE,1,8)) }</ns1:LocationName>
                                (:<ns1:ParentAreaName>{ data($CUSTOMER_SITE/ns0:CITY) }</ns1:ParentAreaName>:)
                                <ns1:ParentAreaName>United Kingdom</ns1:ParentAreaName>
                                {
                                    for $CITY in $CUSTOMER_SITE/ns0:CITY
                                    return
                                        <ns1:City>{ data($CITY) }</ns1:City>
                                }
                                {
                                    for $COUNTY in $CUSTOMER_SITE/ns0:COUNTY
                                    return
                                        <ns1:State>{ data($COUNTY) }</ns1:State>
                                }
                                (:<ns1:Country>{ data($CUSTOMER_SITE/ns0:COUNTRY) }</ns1:Country>:)
                                <ns1:Country>GBR</ns1:Country>
                                {
                                    for $POSTAL_CODE in $CUSTOMER_SITE/ns0:POSTAL_CODE
                                    return
                                        <ns1:PostCode>{ data($POSTAL_CODE) }</ns1:PostCode>
                                }
                            </ns1:location>
                    }
                </ns1:locations>
            </ns1:PutLocation>
};

declare variable $MASTERDATA_CUSTOMER as element(ns0:MASTERDATA_CUSTOMER) external;

xf:TPTCustomerSites($MASTERDATA_CUSTOMER)]]></con:xquery>
    <con:dependency location="../../xsd/GryEbizCustomer.xsd">
        <con:schema ref="GryMDMCustomerIntegration/xsd/GryEbizCustomer"/>
    </con:dependency>
    <con:dependency location="../../wsdl/TPTCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/TPTCustomer"/>
    </con:dependency>
</con:xqueryEntry>