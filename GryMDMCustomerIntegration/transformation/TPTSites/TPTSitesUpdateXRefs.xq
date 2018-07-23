(:: pragma bea:global-element-parameter parameter="$PutLocation" element="ns0:PutLocation" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$PutLocationResponse" element="ns0:PutLocationResponse" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../../../GryMDMCorssReferences/jca/xsd/UpdateOSBXRefs_sp.xsd" ::)

declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/UpdateOSBXRefs";
declare namespace ns0 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTSitesUpdateXRefs/";

declare function xf:TPTSitesUpdateXRefs($PutLocation as element(ns0:PutLocation),
    $PutLocationResponse as element(ns0:PutLocationResponse))
    as element(ns1:InputParameters) {
        let $PutLocation := $PutLocation
        return
            <ns1:InputParameters>
                <ns1:P_UPDATE_OSB_XREFS>
                    {
                        for $location at $pos in $PutLocation/ns0:locations/ns0:location
                        return
                            <ns1:P_UPDATE_OSB_XREFS_ITEM>
                                <ns1:P_MDSEQ>{ xs:int($location/ns0:LocationNum) }</ns1:P_MDSEQ>
                                <ns1:P_TARGETSYS>TPT</ns1:P_TARGETSYS>
                                <ns1:P_TARGETXREF>{ xs:int($PutLocationResponse/ns0:PutLocationResult/ns0:locations/ns0:location[$pos]/ns0:LocationNum) }</ns1:P_TARGETXREF>
                            </ns1:P_UPDATE_OSB_XREFS_ITEM>
                    }
                </ns1:P_UPDATE_OSB_XREFS>
            </ns1:InputParameters>
};

declare variable $PutLocation as element(ns0:PutLocation) external;
declare variable $PutLocationResponse as element(ns0:PutLocationResponse) external;

xf:TPTSitesUpdateXRefs($PutLocation,
    $PutLocationResponse)