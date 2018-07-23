<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$putLocation" element="ns1:PutLocation" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)

declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTSitesFetchXRefs/";

declare function xf:TPTSitesFetchXRefs($putLocation as element(ns1:PutLocation))
    as element(ns0:InputParameters) {
        let $PutLocation := $putLocation
        return
            <ns0:InputParameters>
                <ns0:P_FETCH_OSB_XREFS>
                    {
                        for $location in $PutLocation/ns1:locations/ns1:location
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($location/ns1:LocationNum) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>TPT</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                </ns0:P_FETCH_OSB_XREFS>
            </ns0:InputParameters>
};

declare variable $putLocation as element(ns1:PutLocation) external;

xf:TPTSitesFetchXRefs($putLocation)]]></con:xquery>
    <con:dependency location="../../wsdl/TPTCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/TPTCustomer"/>
    </con:dependency>
    <con:dependency location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp"/>
    </con:dependency>
</con:xqueryEntry>