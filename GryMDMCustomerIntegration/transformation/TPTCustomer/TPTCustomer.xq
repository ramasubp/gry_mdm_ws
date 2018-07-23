(:: pragma bea:global-element-parameter parameter="$MASTERDATA_CUSTOMER" element="ns0:MASTERDATA_CUSTOMER" location="../../xsd/GryEbizCustomer.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutCompany" location="../../wsdl/TPTCustomer.wsdl" ::)

declare namespace ns0 = "http://schema.greenergy.com/ApplicationObjects/Ebiz/ABO/AR/Customer";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTCustomer/";

declare function xf:TPTCustomer($MASTERDATA_CUSTOMER as element(ns0:MASTERDATA_CUSTOMER))
    as element(ns1:PutCompany) {
        let $MASTERDATA_CUSTOMER := $MASTERDATA_CUSTOMER
        return
            <ns1:PutCompany>
                {
                    let $PARTY := $MASTERDATA_CUSTOMER/ns0:PARTY
                    return
                        <ns1:company>
                            <ns1:CompanyId>{ data($PARTY/ns0:PARTY_ID) }</ns1:CompanyId>
                            <ns1:ParentCompanyId>0</ns1:ParentCompanyId>
                            <ns1:CompanyName>{ substring($PARTY/ns0:PARTY_NAME,1,50) }</ns1:CompanyName>
                            <ns1:CompanyCode>{ substring($PARTY/ns0:PARTY_NAME,1,20) }</ns1:CompanyCode>
                            <ns1:CompanyLegalName>{ substring($PARTY/ns0:PARTY_NAME,1,50) }</ns1:CompanyLegalName>
                        </ns1:company>
                }
            </ns1:PutCompany>
};

declare variable $MASTERDATA_CUSTOMER as element(ns0:MASTERDATA_CUSTOMER) external;

xf:TPTCustomer($MASTERDATA_CUSTOMER)
