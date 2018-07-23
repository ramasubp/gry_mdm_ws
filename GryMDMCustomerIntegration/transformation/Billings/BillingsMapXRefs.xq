(:: pragma bea:global-element-parameter parameter="$PutClientRequest" element="PutClient" location="../../wsdl/BillingsCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$OutputParameters" element="ns0:OutputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)
(:: pragma bea:global-element-return element="PutClient" location="../../wsdl/BillingsCustomer.wsdl" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns2 = "http://schema.greenergy.com/Billing/RefData/Client";
declare namespace ns1 = "http://schema.greenergy.com/Billing/RefData/ClientSite";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/BillingsMapXRefs/";

declare function xf:BillingsMapXRefs($PutClientRequest as element(PutClient),
    $OutputParameters as element(ns0:OutputParameters))
    as element(PutClient) {
        <PutClient>
            <Clients>
                {
                    for $Client in $PutClientRequest/Clients/Client
                    return
                        <Client>
                            <ClientId>
                                {
                                    if (empty($OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $Client/ClientId/text()]/ns0:P_TARGETXREF/text())) then
                                        (0)
                                    else 
                                        $OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $Client/ClientId/text()]/ns0:P_TARGETXREF/text()
                                }
</ClientId>
                            <GreenergySystemName>{ data($Client/GreenergySystemName) }</GreenergySystemName>
                            <ReferencedName>{ data($Client/ReferencedName) }</ReferencedName>
                            <ReferencedId>{ data($Client/ReferencedId) }</ReferencedId>
                            {
                                for $ClientSite in $Client/ClientSite
                                return
                                    <ClientSite>
                                        <ClientSiteId>
                                            {
                                                if (empty($OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $ClientSite/ClientSiteId/text()]/ns0:P_TARGETXREF/text())) then
                                                    (0)
                                                else 
                                                    $OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $ClientSite/ClientSiteId/text()]/ns0:P_TARGETXREF/text()
                                            }
</ClientSiteId>
                                        <OrgName>{ data($ClientSite/OrgName) }</OrgName>
                                        <ClientSiteUseGroup>
                                            {
                                                for $ClientSiteUse in $ClientSite/ClientSiteUseGroup/ClientSiteUse
                                                return
                                                    <ClientSiteUse>
                                                        <ClientSiteUseId>
                                                            {
                                                                if (empty($OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $ClientSiteUse/ClientSiteUseId/text()]/ns0:P_TARGETXREF/text())) then
                                                                    (0)
                                                                else 
                                                                    $OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $ClientSiteUse/ClientSiteUseId/text()]/ns0:P_TARGETXREF/text()
                                                            }
</ClientSiteUseId>
                                                        <SiteUseCode>{ data($ClientSiteUse/SiteUseCode) }</SiteUseCode>
                                                        <SiteCode>{ data($ClientSiteUse/SiteCode) }</SiteCode>
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

declare variable $PutClientRequest as element(PutClient) external;
declare variable $OutputParameters as element(ns0:OutputParameters) external;

xf:BillingsMapXRefs($PutClientRequest,
    $OutputParameters)