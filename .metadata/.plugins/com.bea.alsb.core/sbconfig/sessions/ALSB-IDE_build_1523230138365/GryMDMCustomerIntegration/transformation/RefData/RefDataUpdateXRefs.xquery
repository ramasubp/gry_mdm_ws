<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$putCustomer1" element="ns0:PutCustomer" location="../../wsdl/RefDataCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$putCustomerResponse1" element="ns0:PutCustomerResponse" location="../../wsdl/RefDataCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://schema.greenergy.com/MDM/clients/REFDATA";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/UpdateOSBXRefs";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/RefDataUpdateXRefs/";

declare function xf:RefDataUpdateXRefs($putCustomer1 as element(ns0:PutCustomer),
    $putCustomerResponse1 as element(ns0:PutCustomerResponse))
    as element(ns1:InputParameters) {
        let $PutCustomer := $putCustomer1,
            $PutCustomerResponse := $putCustomerResponse1
        return
            <ns1:InputParameters>
                <ns1:P_UPDATE_OSB_XREFS>
                
                    {
                        for $customer in $PutCustomer/ns0:customer
                        return
                            <ns1:P_UPDATE_OSB_XREFS_ITEM>
                                <ns1:P_MDSEQ>{ data($customer/ns0:CustomerId) }</ns1:P_MDSEQ>
                                <ns1:P_TARGETSYS>RefData</ns1:P_TARGETSYS>
                                <ns1:P_TARGETXREF>{ data($PutCustomerResponse/ns0:PutCustomerResult/ns0:Customer/ns0:CustomerId) }</ns1:P_TARGETXREF>
                            </ns1:P_UPDATE_OSB_XREFS_ITEM>
                    }
                    
                    {
                        for $CustomerSiteGroup at $pos in $PutCustomer/ns0:customer/ns0:CustomerSiteGroups/ns0:CustomerSiteGroup
                        return
                            <ns1:P_UPDATE_OSB_XREFS_ITEM>
                                <ns1:P_MDSEQ>{ data($CustomerSiteGroup/ns0:SiteGroupId) }</ns1:P_MDSEQ>
                                <ns1:P_TARGETSYS>RefData</ns1:P_TARGETSYS>
                                <ns1:P_TARGETXREF>{ data($PutCustomerResponse//ns0:CustomerSiteGroup[$pos]/ns0:SiteGroupId) }</ns1:P_TARGETXREF>
                            </ns1:P_UPDATE_OSB_XREFS_ITEM>
                    }
                    
                    {
                        for $CustomerSite at $pos in $PutCustomer//ns0:CustomerSite
                        return
                            <ns1:P_UPDATE_OSB_XREFS_ITEM>
                                <ns1:P_MDSEQ>{ data($CustomerSite/ns0:SiteId) }</ns1:P_MDSEQ>
                                <ns1:P_TARGETSYS>RefData</ns1:P_TARGETSYS>
                                <ns1:P_TARGETXREF>{ data($PutCustomerResponse//ns0:CustomerSite[$pos]/ns0:SiteId) }</ns1:P_TARGETXREF>
                            </ns1:P_UPDATE_OSB_XREFS_ITEM>
                    }
                    
                    
                    
                    
                    
                </ns1:P_UPDATE_OSB_XREFS>
            </ns1:InputParameters>
};

declare variable $putCustomer1 as element(ns0:PutCustomer) external;
declare variable $putCustomerResponse1 as element(ns0:PutCustomerResponse) external;

xf:RefDataUpdateXRefs($putCustomer1,
    $putCustomerResponse1)]]></con:xquery>
    <con:dependency location="../../wsdl/RefDataCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/RefDataCustomer"/>
    </con:dependency>
    <con:dependency location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp"/>
    </con:dependency>
</con:xqueryEntry>