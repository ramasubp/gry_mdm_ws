(:: pragma bea:global-element-parameter parameter="$putClient1" element="PutClient" location="../../wsdl/BillingsCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns0:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns2 = "http://schema.greenergy.com/Billing/RefData/Client";
declare namespace ns1 = "http://schema.greenergy.com/Billing/RefData/ClientSite";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/BillingsFetchXRefs/";

declare function xf:BillingsFetchXRefs($putClient1 as element(PutClient))
    as element(ns0:InputParameters) {
        let $PutClient := $putClient1
        return
            <ns0:InputParameters>
                <ns0:P_FETCH_OSB_XREFS>
                    {
                        for $Client in $PutClient/Clients/Client
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($Client/ClientId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>Billings</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF>0</ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                    {
                        for $ClientSite in $PutClient//ClientSite
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($ClientSite/ClientSiteId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>Billings</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                    {
                        for $ClientSiteUse in $PutClient//ClientSiteUse
                        return
                            <ns0:P_FETCH_OSB_XREFS_ITEM>
                                <ns0:P_MDSEQ>{ xs:int($ClientSiteUse/ClientSiteUseId) }</ns0:P_MDSEQ>
                                <ns0:P_TARGETSYS>Billings</ns0:P_TARGETSYS>
                                <ns0:P_TARGETXREF></ns0:P_TARGETXREF>
                            </ns0:P_FETCH_OSB_XREFS_ITEM>
                    }
                </ns0:P_FETCH_OSB_XREFS>
            </ns0:InputParameters>
};

declare variable $putClient1 as element(PutClient) external;

xf:BillingsFetchXRefs($putClient1)