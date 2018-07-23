(:: pragma bea:global-element-parameter parameter="$mASTERDATA_CUSTOMER1" element="ns2:MASTERDATA_CUSTOMER" location="../../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="ns1:CustomerSite" location="../../wsdl/PortalCustomer.wsdl" ::)

declare namespace ns0 = "http://schemas.datacontract.org/2004/07/TOPCustomerSite";
declare namespace ns2 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace ns1 = "http://tempuri.org/";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/Portal/PortalCustomer/";

declare function xf:PortalCustomer($mASTERDATA_CUSTOMER1 as element(ns2:MASTERDATA_CUSTOMER))
    as element(ns1:CustomerSite) {
        let $MASTERDATA_CUSTOMER := $mASTERDATA_CUSTOMER1
        return
            <ns1:CustomerSite>
                <ns1:Customers>
                    {
                        let $PARTY := $MASTERDATA_CUSTOMER/ns2:PARTY
                        return
                            <ns0:Customer>
                                <ns0:Address>
                                    <ns0:County>{ data($PARTY/ns2:COUNTY) }</ns0:County>
                                    <ns0:HouseNumber>{ data($PARTY/ns2:HOUSE_NUMBER) }</ns0:HouseNumber>
                                    <ns0:Postcode>{ data($PARTY/ns2:POSTAL_CODE) }</ns0:Postcode>
                                    <ns0:StreetName>{ data($PARTY/ns2:STREET_NAME) }</ns0:StreetName>
                                    <ns0:Town>{ data($PARTY/ns2:TOWN) }</ns0:Town>
                                </ns0:Address>
                                <ns0:ContactInformation>
                                    <ns0:ContactName>{ data($PARTY/ns2:PARTY_NAME) }</ns0:ContactName>
                                    <ns0:Email>{ data($PARTY/ns2:EMAIL) }</ns0:Email>
                                </ns0:ContactInformation>
                                (:: <ns0:ID>{ data($PARTY/ns2:PARTY_ID) }</ns0:ID> ::)
                                <ns0:ID>{ data($PARTY/ns2:CrossRef/ns2:systemRef) }</ns0:ID>
                                <ns0:Inactive>true</ns0:Inactive>
                                <ns0:Name>{ data($PARTY/ns2:PARTY_NAME) }</ns0:Name>
                                <ns0:Sites>
                                    {
                                        for $CUSTOMER_ACCOUNT in $PARTY/ns2:CUSTOMER_ACCOUNT,
                                            $CUSTOMER_SITE in $CUSTOMER_ACCOUNT/ns2:CUSTOMER_SITE
                                        return
                                            <ns0:Site>
                                                <ns0:Address>
                                                    {
                                                        for $COUNTY in $CUSTOMER_SITE/ns2:COUNTY
                                                        return
                                                            <ns0:County>{ data($COUNTY) }</ns0:County>
                                                    }
                                                    <ns0:Postcode>{ data($CUSTOMER_SITE/ns2:POSTAL_CODE) }</ns0:Postcode>
                                                    <ns0:StreetName>{ data($CUSTOMER_SITE/ns2:ADDRESS1) }</ns0:StreetName>
                                                    {
                                                        for $CITY in $CUSTOMER_SITE/ns2:CITY
                                                        return
                                                            <ns0:Town>{ data($CITY) }</ns0:Town>
                                                    }
                                                </ns0:Address>
                                                <ns0:ContactInformation>
                                                    {
                                                        for $EMAIL in $CUSTOMER_SITE/ns2:EMAIL
                                                        return
                                                            <ns0:Email>{ data($EMAIL) }</ns0:Email>
                                                    }
                                                    {
                                                        for $PHONE in $CUSTOMER_SITE/ns2:PHONE
                                                        return
                                                            <ns0:PhoneNumber>{ data($PHONE) }</ns0:PhoneNumber>
                                                    }
                                                </ns0:ContactInformation>
                                                <ns0:ID>{ data($CUSTOMER_SITE/ns2:CrossRef/ns2:systemRef) }</ns0:ID>
                                                <ns0:Inactive>1</ns0:Inactive>
                                                <ns0:Name>{ data($CUSTOMER_SITE/ns2:PARTY_SITE_NAME) }</ns0:Name>
                                            </ns0:Site>
                                    }
                                </ns0:Sites>
                            </ns0:Customer>
                    }
                </ns1:Customers>
            </ns1:CustomerSite>
};

declare variable $mASTERDATA_CUSTOMER1 as element(ns2:MASTERDATA_CUSTOMER) external;

xf:PortalCustomer($mASTERDATA_CUSTOMER1)
