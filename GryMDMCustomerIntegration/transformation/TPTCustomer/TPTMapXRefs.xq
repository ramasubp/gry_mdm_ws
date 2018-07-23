(:: pragma bea:global-element-parameter parameter="$putCompany" element="ns1:PutCompany" location="../../wsdl/TPTCustomer.wsdl" ::)
(:: pragma bea:global-element-parameter parameter="$outputParameters" element="ns0:OutputParameters" location="../../../GryMDMCorssReferences/jca/xsd/FetchOSBXRefs_sp.xsd" ::)
(:: pragma bea:global-element-return element="ns1:PutCompany" location="../../wsdl/TPTCustomer.wsdl" ::)

declare namespace ns0 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/FetchOSBXRefs";
declare namespace ns1 = "http://schema.greenergy.com/MDM/clients/TPT";
declare namespace xf = "http://tempuri.org/GryMDMCustomerIntegration/transformation/TPTMapXRefs/";

declare function xf:TPTMapXRefs($putCompany as element(ns1:PutCompany),
    $outputParameters as element(ns0:OutputParameters))
    as element(ns1:PutCompany) {
        <ns1:PutCompany>
            {
                for $company in $putCompany/ns1:company
                return
                    <ns1:company>
                        <ns1:CompanyId>
 							{
                                if (empty($outputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $company/ns1:CompanyId/text()]/ns0:P_TARGETXREF/text())) then
                                    (0)
                                else 
                                    $outputParameters/ns0:P_FETCH_OSB_XREFS/ns0:P_FETCH_OSB_XREFS_ITEM[ns0:P_MDSEQ/text() = $company/ns1:CompanyId/text()]/ns0:P_TARGETXREF/text()
                            }
						</ns1:CompanyId>
                        <ns1:ParentCompanyId>{ data($company/ns1:ParentCompanyId) }</ns1:ParentCompanyId>
                        <ns1:CompanyName>{ data($company/ns1:CompanyName) }</ns1:CompanyName>
                        <ns1:CompanyCode>{ data($company/ns1:CompanyCode) }</ns1:CompanyCode>
                        {
                            for $CompanyLegalName in $company/ns1:CompanyLegalName
                            return
                                <ns1:CompanyLegalName>{ data($CompanyLegalName) }</ns1:CompanyLegalName>
                        }           
                    </ns1:company>
            }
        </ns1:PutCompany>
};

declare variable $putCompany as element(ns1:PutCompany) external;
declare variable $outputParameters as element(ns0:OutputParameters) external;

xf:TPTMapXRefs($putCompany,
    $outputParameters)