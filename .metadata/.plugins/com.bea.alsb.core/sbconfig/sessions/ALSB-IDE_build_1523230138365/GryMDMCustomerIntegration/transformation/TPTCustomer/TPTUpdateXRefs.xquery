<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$putCompany" element="ns0:PutCompany" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$putCompanyResponse" element="ns0:PutCompanyResponse" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/UpdateOSBXRefs";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTUpdateXRefs/";

declare function xf:TPTUpdateXRefs($putCompany as element(ns0:PutCompany),
    $putCompanyResponse as element(ns0:PutCompanyResponse))
    as element(ns1:InputParameters) {
        let $PutCompany := $putCompany
        return
            <ns1:InputParameters>
                <ns1:P_UPDATE_OSB_XREFS>
                      {
                        for $company in $PutCompany/ns0:company
                        return
                            <ns1:P_UPDATE_OSB_XREFS_ITEM>
                                <ns1:P_MDSEQ>{ xs:int($company/ns0:CompanyId) }</ns1:P_MDSEQ>
                                <ns1:P_TARGETSYS>TPT</ns1:P_TARGETSYS>
                                <ns1:P_TARGETXREF>{ xs:int($putCompanyResponse/ns0:PutCompanyResult/ns0:Company/ns0:CompanyId) }</ns1:P_TARGETXREF>
                            </ns1:P_UPDATE_OSB_XREFS_ITEM>
                    }               
                

                </ns1:P_UPDATE_OSB_XREFS>
            </ns1:InputParameters>
};

declare variable $putCompany as element(ns0:PutCompany) external;
declare variable $putCompanyResponse as element(ns0:PutCompanyResponse) external;

xf:TPTUpdateXRefs($putCompany,
    $putCompanyResponse)]]></con:xquery>
    <con:dependency location="../../wsdl/TPTCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/TPTCustomer"/>
    </con:dependency>
    <con:dependency location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp"/>
    </con:dependency>
</con:xqueryEntry>