(:: pragma bea:global-element-parameter parameter="$PutLocation" element="ns1:PutLocation" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$OutputParameters" element="ns0:OutputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutLocation" location="../../wsdl/TPTCustomer.wsdl" ::)

declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTSitesMapXRefs/";

declare function xf:TPTSitesMapXRefs($PutLocation as element(ns1:PutLocation),
    $OutputParameters as element(ns0:OutputParameters))
    as element(ns1:PutLocation) {
        <ns1:PutLocation>
            {
                for $locations in $PutLocation/ns1:locations
                return
                    <ns1:locations>
                        {
                            for $location in $locations/ns1:location
                            return
                                <ns1:location>
                                    <ns1:LocationNum>
                                    { 
                                    if (empty($OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $location/ns1:LocationNum/text()]/ns0:P_TARGETXREF/text()))
                                        then
                                           (0)
                                     else 
                                       $OutputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $location/ns1:LocationNum/text()]/ns0:P_TARGETXREF/text()
                                    }
                                    </ns1:LocationNum>
                                    <ns1:LocationCode>{ data($location/ns1:LocationCode) }</ns1:LocationCode>
                                    <ns1:LocationName>{ data($location/ns1:LocationName) }</ns1:LocationName>
                                    <ns1:ParentAreaName>{ data($location/ns1:ParentAreaName) }</ns1:ParentAreaName>
                                    {
                                        for $City in $location/ns1:City
                                        return
                                            <ns1:City>{ data($City) }</ns1:City>
                                    }
                                    {
                                        for $State in $location/ns1:State
                                        return
                                            <ns1:State>{ data($State) }</ns1:State>
                                    }
                                    {
                                        for $Country in $location/ns1:Country
                                        return
                                            <ns1:Country>{ data($Country) }</ns1:Country>
                                    }
                                    {
                                        for $PostCode in $location/ns1:PostCode
                                        return
                                            <ns1:PostCode>{ data($PostCode) }</ns1:PostCode>
                                    }
                                    {
                                        for $ExternalRef in $location/ns1:ExternalRef
                                        return
                                            <ns1:ExternalRef>{ data($ExternalRef) }</ns1:ExternalRef>
                                    }
                                </ns1:location>
                        }
                    </ns1:locations>
            }
        </ns1:PutLocation>
};

declare variable $PutLocation as element(ns1:PutLocation) external;
declare variable $OutputParameters as element(ns0:OutputParameters) external;

xf:TPTSitesMapXRefs($PutLocation,
    $OutputParameters)