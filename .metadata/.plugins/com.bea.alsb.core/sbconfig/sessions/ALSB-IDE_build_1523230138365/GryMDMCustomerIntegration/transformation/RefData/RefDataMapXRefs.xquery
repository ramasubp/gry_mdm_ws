<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$putCustomer1" element="ns1:PutCustomer" location="../../wsdl/RefDataCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns0:OutputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutCustomer" location="../../wsdl/RefDataCustomer.wsdl" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/REFDATA";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/RefDataMapOSBXRefs/";

declare function xf:RefDataMapOSBXRefs($putCustomer1 as element(ns1:PutCustomer),
    $outputParameters1 as element(ns0:OutputParameters))
    as element(ns1:PutCustomer) {
        <ns1:PutCustomer>
            {
                for $customer in $putCustomer1/ns1:customer
                return
                    <ns1:customer>
                        <ns1:CustomerId>
                            {
                                if (empty($outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $customer/ns1:CustomerId/text()]/ns0:P_TARGETXREF/text())) then
                                    (0)
                                else 
                                    $outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $customer/ns1:CustomerId/text()]/ns0:P_TARGETXREF/text()
                            }
</ns1:CustomerId>
                        <ns1:CustomerName>{ data($customer/ns1:CustomerName) }</ns1:CustomerName>
                        {
                            for $CustomerCode in $customer/ns1:CustomerCode
                            return
                                <ns1:CustomerCode>{ data($CustomerCode) }</ns1:CustomerCode>
                        }
                        {
                            for $CustomerSiteGroups in $customer/ns1:CustomerSiteGroups
                            return
                                <ns1:CustomerSiteGroups>
                                    {
                                        for $CustomerSiteGroup in $CustomerSiteGroups/ns1:CustomerSiteGroup
                                        return
                                            <ns1:CustomerSiteGroup>
                                                <ns1:SiteGroupId>
                                                    {
                                                        if (empty($outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $CustomerSiteGroup/ns1:SiteGroupId/text()]/ns0:P_TARGETXREF/text())) then
                                                            (0)
                                                        else 
                                                            $outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $CustomerSiteGroup/ns1:SiteGroupId/text()]/ns0:P_TARGETXREF/text()
                                                    }
</ns1:SiteGroupId>
                                                <ns1:SiteGroupName>{ data($CustomerSiteGroup/ns1:SiteGroupName) }</ns1:SiteGroupName>
                                                {
                                                    for $CustomerSites in $CustomerSiteGroup/ns1:CustomerSites
                                                    return
                                                        <ns1:CustomerSites>
                                                            {
                                                                for $CustomerSite in $CustomerSites/ns1:CustomerSite
                                                                return
                                                                    <ns1:CustomerSite>
                                                                        <ns1:SiteId>
                                                                            {
                                                                                if (empty($outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text()=$CustomerSite/ns1:SiteId/text()]/ns0:P_TARGETXREF/text())) then
                                                                                    (0)
                                                                                else 
                                                                                    $outputParameters1/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text()=$CustomerSite/ns1:SiteId/text()]/ns0:P_TARGETXREF/text()
                                                                            }
</ns1:SiteId>
                                                                        <ns1:SiteName>{ data($CustomerSite/ns1:SiteName) }</ns1:SiteName>
                                                                        <ns1:SiteCode>{ data($CustomerSite/ns1:SiteCode) }</ns1:SiteCode>
                                                                        <ns1:IsCurrent>{ data($CustomerSite/ns1:IsCurrent) }</ns1:IsCurrent>
                                                                        <ns1:IsVisitEnabled>{ data($CustomerSite/ns1:IsVisitEnabled) }</ns1:IsVisitEnabled>
                                                                        <ns1:IsSendVisitEmail>{ data($CustomerSite/ns1:IsSendVisitEmail) }</ns1:IsSendVisitEmail>
                                                                        <ns1:UseAddressAsSiteName>{ data($CustomerSite/ns1:UseAddressAsSiteName) }</ns1:UseAddressAsSiteName>
                                                                        <ns1:ScheduleGroup>{ data($CustomerSite/ns1:ScheduleGroup) }</ns1:ScheduleGroup>
                                                                        <ns1:CustomerType>{ data($CustomerSite/ns1:CustomerType) }</ns1:CustomerType>
                                                                        <ns1:Address>{ $CustomerSite/ns1:Address/@* , $CustomerSite/ns1:Address/node() }</ns1:Address>
                                                                        {
                                                                            for $Phone in $CustomerSite/ns1:Phone
                                                                            return
                                                                                <ns1:Phone>{ data($Phone) }</ns1:Phone>
                                                                        }
                                                                        {
                                                                            for $Email in $CustomerSite/ns1:Email
                                                                            return
                                                                                <ns1:Email>{ data($Email) }</ns1:Email>
                                                                        }
                                                                    </ns1:CustomerSite>
                                                            }
                                                        </ns1:CustomerSites>
                                                }
                                            </ns1:CustomerSiteGroup>
                                    }
                                </ns1:CustomerSiteGroups>
                        }
                    </ns1:customer>
            }
        </ns1:PutCustomer>
};

declare variable $putCustomer1 as element(ns1:PutCustomer) external;
declare variable $outputParameters1 as element(ns0:OutputParameters) external;

xf:RefDataMapOSBXRefs($putCustomer1,
    $outputParameters1)]]></con:xquery>
    <con:dependency location="../../wsdl/RefDataCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/RefDataCustomer"/>
    </con:dependency>
    <con:dependency location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp"/>
    </con:dependency>
</con:xqueryEntry>