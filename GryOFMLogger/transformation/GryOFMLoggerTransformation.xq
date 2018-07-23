(:: pragma bea:global-element-parameter parameter="$gryOFMLogger1" element="ns0:GryOFMLogger" location="../xsd/GryOFMLogger.xsd" ::)
(:: pragma bea:global-element-return element="ns1:InputParameters" location="../xsd/Insert_Into_OFM_Log_sp.xsd" ::)

declare namespace ns0 = "http://greenergy.com/OFM/GryOFMLogger";
declare namespace ns1 = "http://xmlns.oracle.com/pcbpel/adapter/db/sp/Insert_Into_OFM_Log";
declare namespace xf = "http://tempuri.org/GryOFMLogger/transformation/GryOFMLoggerTransformation/";

declare function xf:GryOFMLoggerTransformation($gryOFMLogger1 as element(ns0:GryOFMLogger))
    as element(ns1:InputParameters) {
        <ns1:InputParameters>
            <ns1:P_FLOW_ID>{ data($gryOFMLogger1/ns0:FlowID) }</ns1:P_FLOW_ID>
            {
                for $ComponentInstanceID in $gryOFMLogger1/ns0:ComponentInstanceID
                return
                    <ns1:P_COMPONENTINSTANCE_ID>{ data($ComponentInstanceID) }</ns1:P_COMPONENTINSTANCE_ID>
            }
            <ns1:P_TRANSACTION_ID>{ data($gryOFMLogger1/ns0:TransactionID) }</ns1:P_TRANSACTION_ID>
            <ns1:P_APPLICATION_NAME>{ data($gryOFMLogger1/ns0:ApplicationName) }</ns1:P_APPLICATION_NAME>
            {
                for $LoggerDateTime in $gryOFMLogger1/ns0:LoggerDateTime
                return
                    <ns1:P_LOGGER_DATE_TIME>{ data($LoggerDateTime) }</ns1:P_LOGGER_DATE_TIME>
            }
            <ns1:P_PROCESS_STATUS>{ data($gryOFMLogger1/ns0:ProcessStatus) }</ns1:P_PROCESS_STATUS>
            {
                for $DisplayMessage in $gryOFMLogger1/ns0:DisplayMessage
                return
                    <ns1:P_DISPLAY_MESSAGE>{ data($DisplayMessage) }</ns1:P_DISPLAY_MESSAGE>
            }
            {
                for $HostServerName in $gryOFMLogger1/ns0:HostServerName
                return
                    <ns1:P_HOST_SERVER_NAME>{ data($HostServerName) }</ns1:P_HOST_SERVER_NAME>
            }
            {
                for $ManagedServerName in $gryOFMLogger1/ns0:ManagedServerName
                return
                    <ns1:P_MANAGEDSERVERNAME>{ data($ManagedServerName) }</ns1:P_MANAGEDSERVERNAME>
            }
            {
                for $DomainName in $gryOFMLogger1/ns0:DomainName
                return
                    <ns1:P_DOMAIN_NAME>{ data($DomainName) }</ns1:P_DOMAIN_NAME>
            }
            {
                for $Platform in $gryOFMLogger1/ns0:Platform
                return
                    <ns1:P_PLATFORM>{ data($Platform) }</ns1:P_PLATFORM>
            }
            <ns1:P_SOURCE>{ data($gryOFMLogger1/ns0:Source) }</ns1:P_SOURCE>
            <ns1:P_DESTINATION>{ data($gryOFMLogger1/ns0:Destination) }</ns1:P_DESTINATION>
            {
                for $Key in $gryOFMLogger1/ns0:Key
                return
                    <ns1:P_KEY>{ data($Key) }</ns1:P_KEY>
            }
            {
                for $CustomField1 in $gryOFMLogger1/ns0:CustomField1
                return
                    <ns1:P_CUSTOM_FIELD1>{ data($CustomField1) }</ns1:P_CUSTOM_FIELD1>
            }
            {
                for $CustomField2 in $gryOFMLogger1/ns0:CustomField2
                return
                    <ns1:P_CUSTOM_FIELD2>{ data($CustomField2) }</ns1:P_CUSTOM_FIELD2>
            }
            {
                for $CustomField3 in $gryOFMLogger1/ns0:CustomField3
                return
                    <ns1:P_CUSTOM_FIELD3>{ data($CustomField3) }</ns1:P_CUSTOM_FIELD3>
            }
            {
                for $CustomField4 in $gryOFMLogger1/ns0:CustomField4
                return
                    <ns1:P_CUSTOM_FIELD4>{ data($CustomField4) }</ns1:P_CUSTOM_FIELD4>
            }
            {
                for $CustomField5 in $gryOFMLogger1/ns0:CustomField5
                return
                    <ns1:P_CUSTOM_FIELD5>{ data($CustomField5) }</ns1:P_CUSTOM_FIELD5>
            }
            {
                for $Headers in $gryOFMLogger1/ns0:Headers
                return
                    <ns1:P_HEADERS>{ data($Headers) }</ns1:P_HEADERS>
            }
            {
                for $Payload in $gryOFMLogger1/ns0:Payload
                return
                    <ns1:P_PAYLOAD>{ data($Payload) }</ns1:P_PAYLOAD>
            }
        </ns1:InputParameters>
};

declare variable $gryOFMLogger1 as element(ns0:GryOFMLogger) external;

xf:GryOFMLoggerTransformation($gryOFMLogger1)