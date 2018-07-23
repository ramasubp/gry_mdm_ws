(:: pragma bea:global-element-parameter parameter="$mASTERDATA_CUSTOMER1" element="ns0:MASTERDATA_CUSTOMER" location="../../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutCustomer" location="../../wsdl/RefDataCustomer.wsdl" ::)

declare namespace ns0 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/REFDATA";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/RefDataCustomer/";

declare function xf:RefDataCustomer($mASTERDATA_CUSTOMER1 as element(ns0:MASTERDATA_CUSTOMER))
    as element(ns1:PutCustomer) {
        let $MASTERDATA_CUSTOMER := $mASTERDATA_CUSTOMER1
        return
            <ns1:PutCustomer>
                {
                    let $PARTY := $MASTERDATA_CUSTOMER/ns0:PARTY
                    return
                        <ns1:customer>
                            <ns1:CustomerId>{ data($PARTY/ns0:PARTY_ID) }</ns1:CustomerId>
                            <ns1:CustomerName>{ data($PARTY/ns0:PARTY_NAME) }</ns1:CustomerName>
                            <ns1:CustomerCode>{ data($PARTY/ns0:PARTY_NUMBER) }</ns1:CustomerCode>
                            <ns1:CustomerSiteGroups>
                                {
                                    for $CUSTOMER_ACCOUNT in $PARTY/ns0:CUSTOMER_ACCOUNT
                                    return
                                        <ns1:CustomerSiteGroup>
                                            <ns1:SiteGroupId>{ data($CUSTOMER_ACCOUNT/ns0:CUST_ACCOUNT_ID) }</ns1:SiteGroupId>
                                            <ns1:SiteGroupName>{ data($PARTY/ns0:PARTY_NAME) }</ns1:SiteGroupName>
                                            <ns1:CustomerSites>
                                                {
                                                    for $CUSTOMER_SITE in $CUSTOMER_ACCOUNT/ns0:CUSTOMER_SITE
                                                    return
                                                        <ns1:CustomerSite>
                                                            <ns1:SiteId>{ data($CUSTOMER_SITE/ns0:CUST_ACCT_SITE_ID) }</ns1:SiteId>
                                                            <ns1:SiteName>{ data($CUSTOMER_SITE/ns0:SITE_KEY) }</ns1:SiteName>
                                                            <ns1:SiteCode>{ data($CUSTOMER_SITE/ns0:PARTY_SITE_ID) }</ns1:SiteCode>
                                                            <ns1:IsCurrent>true</ns1:IsCurrent>
                                                            <ns1:IsVisitEnabled>true</ns1:IsVisitEnabled>
                                                            <ns1:IsSendVisitEmail>true</ns1:IsSendVisitEmail>
                                                            <ns1:UseAddressAsSiteName>true</ns1:UseAddressAsSiteName>
                                                            <ns1:ScheduleGroup>1</ns1:ScheduleGroup>
                                                            <ns1:CustomerType>2</ns1:CustomerType>
                                                            <ns1:Address>
                                                                <ns1:AddressLine1>{ data($CUSTOMER_SITE/ns0:ADDRESS1) }</ns1:AddressLine1>
                                                                {
                                                                    for $ADDRESS2 in $CUSTOMER_SITE/ns0:ADDRESS2
                                                                    return
                                                                        <ns1:AddressLine2>{ data($ADDRESS2) }</ns1:AddressLine2>
                                                                }
                                                                {
                                                                    for $ADDRESS3 in $CUSTOMER_SITE/ns0:ADDRESS3
                                                                    return
                                                                        <ns1:AddressLine3>{ data($ADDRESS3) }</ns1:AddressLine3>
                                                                }
                                                                <ns1:Town>{ data($CUSTOMER_SITE/ns0:CITY) }</ns1:Town>
                                                                <ns1:County>{ data($CUSTOMER_SITE/ns0:COUNTY) }</ns1:County>
                                                                <ns1:Country>{ data($CUSTOMER_SITE/ns0:COUNTRY) }</ns1:Country>
                                                                (:<ns1:Country>United Kingdom</ns1:Country> :)
                                                                {
                                                                    for $POSTAL_CODE in $CUSTOMER_SITE/ns0:POSTAL_CODE
                                                                    return
                                                                        <ns1:PostCode>{ data($POSTAL_CODE) }</ns1:PostCode>
                                                                }
                                                            </ns1:Address>
                                                        </ns1:CustomerSite>
                                                }
                                            </ns1:CustomerSites>
                                        </ns1:CustomerSiteGroup>
                                }
                            </ns1:CustomerSiteGroups>
                        </ns1:customer>
                }
            </ns1:PutCustomer>
};

declare variable $mASTERDATA_CUSTOMER1 as element(ns0:MASTERDATA_CUSTOMER) external;

xf:RefDataCustomer($mASTERDATA_CUSTOMER1)
