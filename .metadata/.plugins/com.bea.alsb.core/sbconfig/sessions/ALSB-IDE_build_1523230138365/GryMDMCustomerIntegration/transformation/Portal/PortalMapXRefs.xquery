<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$customerSite1" element="ns1:CustomerSite" location="../../wsdl/PortalCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters1" element="ns2:OutputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CustomerSite" location="../../wsdl/PortalCustomer.wsdl" ::)

declare namespace ns0 = "http://schemas.datacontract.org/2004/07/TOPCustomerSite";
declare namespace ns2 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://tempuri.org/";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/Portal/PortalMapXRefs/";

declare function xf:PortalMapXRefs($customerSite1 as element(ns1:CustomerSite),
    $outputParameters1 as element(ns2:OutputParameters))
    as element(ns1:CustomerSite) {
        <ns1:CustomerSite>
            {
                for $Customers in $customerSite1/ns1:Customers
                return
                    <ns1:Customers>
                        {
                            for $Customer in $Customers/ns0:Customer
                            return
                                <ns0:Customer>
                                    <ns0:Address>{ $Customer/ns0:Address/@* , $Customer/ns0:Address/node() }</ns0:Address>
                                    <ns0:ContactInformation>{ $Customer/ns0:ContactInformation/@* , $Customer/ns0:ContactInformation/node() }</ns0:ContactInformation>
                                    <ns0:ID>
                                    {
                                    if (empty($outputParameters1/ns2:P_FETCH_OSB_XREFS/ns2:P_FETCH_OSB_XREFS_ITEM[ns2:P_MDSEQ/text() = $Customer/ns0:ID/text()]/ns2:P_TARGETXREF/text())) then
                                    (0)
                                    else 
                                    $outputParameters1/ns2:P_FETCH_OSB_XREFS/ns2:P_FETCH_OSB_XREFS_ITEM[ns2:P_MDSEQ/text() = $Customer/ns0:ID/text()]/ns2:P_TARGETXREF/text()
                                    }
                                    </ns0:ID>
                                    <ns0:Inactive>{ data($Customer/ns0:Inactive) }</ns0:Inactive>
                                    <ns0:Name>{ data($Customer/ns0:Name) }</ns0:Name>
                                    {
                                        for $SchedulingGroup in $Customer/ns0:SchedulingGroup
                                        return
                                            <ns0:SchedulingGroup>{ data($SchedulingGroup) }</ns0:SchedulingGroup>
                                    }
                                    {
                                        for $Sites in $Customer/ns0:Sites
                                        return
                                            <ns0:Sites>
                                                {
                                                    for $Site in $Sites/ns0:Site
                                                    return
                                                        <ns0:Site>
                                                            <ns0:Address>{ $Site/ns0:Address/@* , $Site/ns0:Address/node() }</ns0:Address>
                                                            {
                                                                for $ClosingTime in $Site/ns0:ClosingTime
                                                                return
                                                                    <ns0:ClosingTime>{ data($ClosingTime) }</ns0:ClosingTime>
                                                            }
                                                            <ns0:ContactInformation>{ $Site/ns0:ContactInformation/@* , $Site/ns0:ContactInformation/node() }</ns0:ContactInformation>
                                                            {
                                                                for $DayNameAvailability in $Site/ns0:DayNameAvailability
                                                                return
                                                                    <ns0:DayNameAvailability>{ data($DayNameAvailability) }</ns0:DayNameAvailability>
                                                            }
                                                            <ns0:ID>
                                                            {
                                                            if (empty($outputParameters1/ns2:P_FETCH_OSB_XREFS/ns2:P_FETCH_OSB_XREFS_ITEM[ns2:P_MDSEQ/text() = $Site/ns0:ID/text()]/ns2:P_TARGETXREF/text())) then
                                                            (0)
                                                            else                                                     
                                                            $outputParameters1/ns2:P_FETCH_OSB_XREFS/ns2:P_FETCH_OSB_XREFS_ITEM[ns2:P_MDSEQ/text() = $Site/ns0:ID/text()]/ns2:P_TARGETXREF/text() 
                                                            }
															</ns0:ID>
                                                            {
                                                                for $Inactive in $Site/ns0:Inactive
                                                                return
                                                                    <ns0:Inactive>{ data($Inactive) }</ns0:Inactive>
                                                            }
                                                            <ns0:Name>{ data($Site/ns0:Name) }</ns0:Name>
                                                            {
                                                                for $Notes in $Site/ns0:Notes
                                                                return
                                                                    <ns0:Notes>{ data($Notes) }</ns0:Notes>
                                                            }
                                                            <ns0:OpeningTime>{ data($Site/ns0:OpeningTime) }</ns0:OpeningTime>
                                                            <ns0:OrderType>{ data($Site/ns0:OrderType) }</ns0:OrderType>
                                                            {
                                                                for $Terminals in $Site/ns0:Terminals
                                                                return
                                                                    <ns0:Terminals>{ $Terminals/@* , $Terminals/node() }</ns0:Terminals>
                                                            }
                                                        </ns0:Site>
                                                }
                                            </ns0:Sites>
                                    }
                                </ns0:Customer>
                        }
                    </ns1:Customers>
            }
        </ns1:CustomerSite>
};

declare variable $customerSite1 as element(ns1:CustomerSite) external;
declare variable $outputParameters1 as element(ns2:OutputParameters) external;

xf:PortalMapXRefs($customerSite1,
    $outputParameters1)]]></con:xquery>
    <con:dependency location="../../wsdl/PortalCustomer.wsdl">
        <con:wsdl ref="GryMDMCustomerIntegration/wsdl/PortalCustomer"/>
    </con:dependency>
    <con:dependency location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd">
        <con:schema ref="GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp"/>
    </con:dependency>
</con:xqueryEntry>