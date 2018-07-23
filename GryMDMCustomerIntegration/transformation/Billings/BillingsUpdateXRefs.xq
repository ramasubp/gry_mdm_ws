(:: pragma bea:global-element-parameter parameter="$putClient1" element="PutClient" location="../../wsdl/BillingsCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$putClientResponse1" element="PutClientResponse" location="../../wsdl/BillingsCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns4:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd" ::)

declare namespace ns5 = "http://schema.greenergy.com/Billing/RefData/Client";
declare namespace ns0 = "http://schema.greenergy.com/Billing/RefData/InsertClientResponse";
declare namespace ns2 = "http://schema.greenergy.com/Billing/RefData/ClientSite";
declare namespace ns1 = "http://schema.greenergy.com/Billing/RefData/InsertClientSiteResponse";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/BillingsUpdateXRefs/";
declare namespace ns4 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/UpdateOSBXRefs";
declare namespace ns3 = "http://schema.greenergy.com/Billing/RefData/";

declare function xf:BillingsUpdateXRefs($putClient1 as element(PutClient),
    $putClientResponse1 as element(PutClientResponse))
    as element(ns4:InputParameters) {
        let $PutClient := $putClient1
        return
            <ns4:InputParameters>
                <ns4:P_UPDATE_OSB_XREFS>
                    {
                        for $Client at $CPos in $PutClient/Clients/Client
                        return
                            <ns4:P_UPDATE_OSB_XREFS_ITEM>
                                <ns4:P_MDSEQ>{ xs:int($Client/ClientId) }</ns4:P_MDSEQ>
                                <ns4:P_TARGETSYS>Billings</ns4:P_TARGETSYS>
                                <ns4:P_TARGETXREF>{ data($putClientResponse1/Clients/Client[$CPos]/ClientId) }</ns4:P_TARGETXREF>
                            </ns4:P_UPDATE_OSB_XREFS_ITEM>
                    }
					{
                        for $Client at $CPOS in $PutClient/Clients/Client,
                            $ClientSite at $CSPOS in $Client/ClientSite
                        return
                            <ns4:P_UPDATE_OSB_XREFS_ITEM>
                                <ns4:P_MDSEQ>{ xs:int($ClientSite/ClientSiteId) }</ns4:P_MDSEQ>
                                <ns4:P_TARGETSYS>Billings</ns4:P_TARGETSYS>
                                <ns4:P_TARGETXREF>{ data($putClientResponse1/Clients/Client[$CPOS]/ClientSite[$CSPOS]/ClientSiteId) }</ns4:P_TARGETXREF>
                            </ns4:P_UPDATE_OSB_XREFS_ITEM>
                    }
                    {
                        for $Client at $Clientpos in $PutClient/Clients/Client,
                            $ClientSite at $ClientSitepos in $Client/ClientSite,
                            $ClientSiteUse at  $ClientSiteUsepos in $ClientSite/ClientSiteUseGroup/ClientSiteUse
                        return
                            <ns4:P_UPDATE_OSB_XREFS_ITEM>
                                <ns4:P_MDSEQ>{ xs:int($ClientSiteUse/ClientSiteUseId) }</ns4:P_MDSEQ>
                                <ns4:P_TARGETSYS>Billings</ns4:P_TARGETSYS>
                                <ns4:P_TARGETXREF>{ data($putClientResponse1/Clients/Client[$Clientpos]/ClientSite[$ClientSitepos]/ClientSiteUseGroup/ClientSiteUse[$ClientSiteUsepos]/ClientSiteUseId) }</ns4:P_TARGETXREF>
                            </ns4:P_UPDATE_OSB_XREFS_ITEM>
                    }
                </ns4:P_UPDATE_OSB_XREFS>
            </ns4:InputParameters>
};

declare variable $putClient1 as element(PutClient) external;
declare variable $putClientResponse1 as element(PutClientResponse) external;

xf:BillingsUpdateXRefs($putClient1,
    $putClientResponse1)