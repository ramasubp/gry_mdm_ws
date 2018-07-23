(:: pragma bea:global-element-parameter parameter="$putCustomer1" element="ns1:PutCustomer" location="../../wsdl/RefDataCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/REFDATA";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/RefDataFetchOSBXRefs/";

declare function xf:RefDataFetchOSBXRefs($putCustomer1 as element(ns1:PutCustomer))
    as element(ns0:InputParameters) {
        let $PutCustomer := $putCustomer1
        return
            <ns0:InputParameters>
                <ns0:P_FETCH_OSB_XREFS>
                    {
                        for $customer in $PutCustomer/ns1:customer
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($customer/ns1:CustomerId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>RefData</ns0:P_TARGETSYS>
								<ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
					{
                        for $CustomerSiteGroup in $PutCustomer//ns1:CustomerSiteGroup
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($CustomerSiteGroup/ns1:SiteGroupId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>RefData</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
					{
                        for $CustomerSite in $PutCustomer//ns1:CustomerSite
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($CustomerSite/ns1:SiteId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>RefData</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                </ns0:P_FETCH_OSB_XREFS>
            </ns0:InputParameters>
};

declare variable $putCustomer1 as element(ns1:PutCustomer) external;

xf:RefDataFetchOSBXRefs($putCustomer1)