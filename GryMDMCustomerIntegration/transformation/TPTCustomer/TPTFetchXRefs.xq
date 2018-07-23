(:: pragma bea:global-element-parameter parameter="$putCompany" element="ns1:PutCompany" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTFetchXRefs/";

declare function xf:TPTFetchXRefs($putCompany as element(ns1:PutCompany))
    as element(ns0:InputParameters) {
        let $PutCompany := $putCompany
        return
            <ns0:InputParameters>
                <ns0:P_FETCH_OSB_XREFS>
                    {
                        for $company in $PutCompany/ns1:company
                            
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($company/ns1:CompanyId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>TPT</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                   
                </ns0:P_FETCH_OSB_XREFS>
            </ns0:InputParameters>
};

declare variable $putCompany as element(ns1:PutCompany) external;

xf:TPTFetchXRefs($putCompany)