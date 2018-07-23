(:: pragma bea:global-element-parameter parameter="$mASTERDATA_CUSTOMER1" element="ns0:MASTERDATA_CUSTOMER" location="../../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="PutClient" location="../../wsdl/BillingsCustomer.wsdl" ::)

declare namespace ns0 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace ns2 = "http://schema.greenergy.com/Billing/RefData/Client";
declare namespace ns1 = "http://schema.greenergy.com/Billing/RefData/ClientSite";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/BillingsCustomer/";

declare function xf:BillingsCustomer($mASTERDATA_CUSTOMER1 as element(ns0:MASTERDATA_CUSTOMER))
    as element(PutClient) {
        let $MASTERDATA_CUSTOMER := $mASTERDATA_CUSTOMER1
        return
            <PutClient>
                <Clients>
                    {
                        for $PARTY in $MASTERDATA_CUSTOMER/ns0:PARTY,
                            $CUSTOMER_ACCOUNT in $PARTY/ns0:CUSTOMER_ACCOUNT
                        return
                            <Client>
                                <ClientId>{ data($CUSTOMER_ACCOUNT/ns0:CUST_ACCOUNT_ID) }</ClientId>
                                <GreenergySystemName>EBS</GreenergySystemName>
                                <ReferencedName>{ data($PARTY/ns0:PARTY_NAME) }</ReferencedName>
                                <ReferencedId>{ data($CUSTOMER_ACCOUNT/ns0:CUSTOMER_ACCOUNT_NUMBER) }</ReferencedId>
                                {
                                    for $CUSTOMER_SITE in $CUSTOMER_ACCOUNT/ns0:CUSTOMER_SITE
                                    return
                                        <ClientSite>
                                            <ClientSiteId>{ data($CUSTOMER_SITE/ns0:CUST_ACCT_SITE_ID) }</ClientSiteId>
                                            <OrgName>{ data($CUSTOMER_SITE/ns0:OPERATING_UNIT) }</OrgName>
                                            <ClientSiteUseGroup>
                                                {
                                                    for $CUSTOMER_SITE_USE in $CUSTOMER_SITE/ns0:CUSTOMER_SITE_USE
                                                    return
                                                        <ClientSiteUse>
                                                            <ClientSiteUseId>{ data($CUSTOMER_SITE_USE/ns0:SITE_USE_ID) }</ClientSiteUseId>
                                                            <SiteUseCode>{ data($CUSTOMER_SITE_USE/ns0:SITE_USE_CODE) }</SiteUseCode>
                                                            <SiteCode>{ data($CUSTOMER_SITE_USE/ns0:SITE_CODE) }</SiteCode>
                                                        </ClientSiteUse>
                                                }
                                            </ClientSiteUseGroup>
                                        </ClientSite>
                                }
                            </Client>
                    }
                </Clients>
            </PutClient>
};

declare variable $mASTERDATA_CUSTOMER1 as element(ns0:MASTERDATA_CUSTOMER) external;

xf:BillingsCustomer($mASTERDATA_CUSTOMER1)
