(:: pragma bea:global-element-parameter parameter="$customerSite1" element="ns1:CustomerSite" location="../../wsdl/PortalCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns2:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://schemas.datacontract.org/2004/07/TOPCustomerSite";
declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://tempuri.org/";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/Portal/PortalFetchXRefs/";

declare function xf:PortalFetchXRefs($customerSite1 as element(ns1:CustomerSite))
    as element(ns2:InputParameters) {
        let $CustomerSite := $customerSite1
        return
            <ns2:InputParameters>
                <ns2:P_FETCH_OSB_XREFS>
                     {
                        for $Customer in $CustomerSite/ns1:Customers/ns0:Customer
                        return
                            <ns2:P_FETCH_OSB_XREFS_ITEM>
                                <ns2:P_MDSEQ>{ data($Customer/ns0:ID) }</ns2:P_MDSEQ>
                                <ns2:P_TARGETSYS>RefData</ns2:P_TARGETSYS>
                                <ns2:P_TARGETXREF></ns2:P_TARGETXREF>
                            </ns2:P_FETCH_OSB_XREFS_ITEM>
                    }
                    {
                        for $Site in $CustomerSite//ns0:Site
                        return
                            <ns2:P_FETCH_OSB_XREFS_ITEM>
                                <ns2:P_MDSEQ>{ data($Site/ns0:ID) }</ns2:P_MDSEQ>
                                <ns2:P_TARGETSYS>RefData</ns2:P_TARGETSYS>
                                <ns2:P_TARGETXREF></ns2:P_TARGETXREF>
                            </ns2:P_FETCH_OSB_XREFS_ITEM>
                    }
                </ns2:P_FETCH_OSB_XREFS>
            </ns2:InputParameters>
};

declare variable $customerSite1 as element(ns1:CustomerSite) external;

xf:PortalFetchXRefs($customerSite1)
