<?xml version="1.0" encoding="UTF-8"?>
<con:xqueryEntry xmlns:con="http://www.bea.com/wli/sb/resources/config">
    <con:xquery><![CDATA[(:: pragma bea:global-element-parameter parameter="$gryOFMLogger1" element="ns0:GryOFMLogger" location="../xsd/GryOFMLogger.xsd" ::)
(:: pragma bea:global-element-return element="ns0:GryOFMLogger" location="../xsd/GryOFMLogger.xsd" ::)

declare namespace ns0 = "http://greenergy.com/OFM/GryOFMLogger";
declare namespace xf = "http://tempuri.org/GryOFMLogger/transformation/EmptyTransformation/";

declare function xf:EmptyTransformation($gryOFMLogger1 as element(ns0:GryOFMLogger),
    $HostName as xs:string,
    $ManagedServerName as xs:string,
    $DomainName as xs:string)
    as element(ns0:GryOFMLogger) {
        <ns0:GryOFMLogger>
            <ns0:FlowID>
                {
                    if (exists($gryOFMLogger1/ns0:FlowID)) then
                        (data($gryOFMLogger1/ns0:FlowID))
                    else 
                        ()
                }
</ns0:FlowID>
            <ns0:ComponentInstanceID>
                {
                    if (exists($gryOFMLogger1/ns0:ComponentInstanceID)) then
                        (data($gryOFMLogger1/ns0:ComponentInstanceID))
                    else 
                        ()
                }
</ns0:ComponentInstanceID>
            <ns0:TransactionID>
                {
                    if (exists($gryOFMLogger1/ns0:TransactionID)) then
                        (data($gryOFMLogger1/ns0:TransactionID))
                    else 
                        ()
                }
</ns0:TransactionID>
            <ns0:ApplicationName>
                {
                    if (exists($gryOFMLogger1/ns0:ApplicationName)) then
                        (data($gryOFMLogger1/ns0:ApplicationName))
                    else 
                        ()
                }
</ns0:ApplicationName>
            <ns0:LoggerDateTime>
            { 
                    if (exists($gryOFMLogger1/ns0:LoggerDateTime)) then
                        (
                        
                       	 if (data($gryOFMLogger1/ns0:LoggerDateTime)='') then
                       	 	(fn:current-dateTime()
                        	)
                        	else
                        	(data($gryOFMLogger1/ns0:LoggerDateTime)
                       		 ) 
                        )
                    else 
                        (fn:current-dateTime())       
            }
</ns0:LoggerDateTime>
            <ns0:ProcessStatus>
                {
                    if (exists($gryOFMLogger1/ns0:ProcessStatus)) then
                        (data($gryOFMLogger1/ns0:ProcessStatus))
                    else 
                        ()
                }
</ns0:ProcessStatus>
            <ns0:DisplayMessage>
                {
                    if (exists($gryOFMLogger1/ns0:DisplayMessage)) then
                        (data($gryOFMLogger1/ns0:DisplayMessage))
                    else 
                        ()
                }
</ns0:DisplayMessage>
            <ns0:HostServerName>
                {
                    if (exists($gryOFMLogger1/ns0:HostServerName)) then
                        (                      
                            if (data($gryOFMLogger1/ns0:HostServerName)='') then
                        	(data($HostName)
                       		)
                        	else
                        	(data($gryOFMLogger1/ns0:HostServerName)
                        	)                                          
                        )
                    else 
                        (data($HostName))
                }
</ns0:HostServerName>
            <ns0:ManagedServerName>
                {
                    if (exists($gryOFMLogger1/ns0:ManagedServerName)) then
                        (
                        	if (data($gryOFMLogger1/ns0:ManagedServerName)='') then
                        	(
                        	data($ManagedServerName)
                        	)
                        	else
                        	(data($gryOFMLogger1/ns0:ManagedServerName)
                        	)                      
                         )
                    else  (data($ManagedServerName))
                }
</ns0:ManagedServerName>
            <ns0:DomainName>
                {
                    if (exists($gryOFMLogger1/ns0:DomainName)) then
                        (
                        	if (data($gryOFMLogger1/ns0:DomainName)='') then
                        	(data($DomainName)
                        	)
                        	else
                        	(data($gryOFMLogger1/ns0:DomainName)
                        	)
                        )
                    else 
                        (data($DomainName))
                }
</ns0:DomainName>
            <ns0:Platform>
                {
                    if (exists($gryOFMLogger1/ns0:Platform)) then
                        (
                        	if (data($gryOFMLogger1/ns0:Platform)='') then 
                        	(data('OSB')
                        	)
                        	else
                        	(
                        	data($gryOFMLogger1/ns0:Platform)
                        	)   
                        )
                    else 
                        (data('OSB'))
                }
</ns0:Platform>
            <ns0:Source>
                {
                    if (exists($gryOFMLogger1/ns0:Source)) then
                        (data($gryOFMLogger1/ns0:Source))
                    else 
                        ()
                }
</ns0:Source>
            <ns0:Destination>
                {
                    if (exists($gryOFMLogger1/ns0:Destination)) then
                        (data($gryOFMLogger1/ns0:Destination))
                    else 
                        ()
                }
</ns0:Destination>
            <ns0:Payload>
                {
                    if (exists($gryOFMLogger1/ns0:Payload)) then
                        (data($gryOFMLogger1/ns0:Payload))
                    else 
                        ()
                }
</ns0:Payload>
            <ns0:Headers>
                {
                    if (exists($gryOFMLogger1/ns0:Headers)) then
                        (data($gryOFMLogger1/ns0:Headers))
                    else 
                        ()
                }
</ns0:Headers>
            <ns0:Key>
                {
                    if (exists($gryOFMLogger1/ns0:Key)) then
                        (data($gryOFMLogger1/ns0:Key))
                    else 
                        ()
                }
</ns0:Key>
            <ns0:CustomField1>
                {
                    if (exists($gryOFMLogger1/ns0:CustomField1)) then
                        (data($gryOFMLogger1/ns0:CustomField1))
                    else 
                        ()
                }
</ns0:CustomField1>
            <ns0:CustomField2>
                {
                    if (exists($gryOFMLogger1/ns0:CustomField2)) then
                        (data($gryOFMLogger1/ns0:CustomField2))
                    else 
                        ()
                }
</ns0:CustomField2>
            <ns0:CustomField3>
                {
                    if (exists($gryOFMLogger1/ns0:CustomField3)) then
                        (data($gryOFMLogger1/ns0:CustomField3))
                    else 
                        ()
                }
</ns0:CustomField3>
            <ns0:CustomField4>
                {
                    if (exists($gryOFMLogger1/ns0:CustomField4)) then
                        (data($gryOFMLogger1/ns0:CustomField4))
                    else 
                        ()
                }
</ns0:CustomField4>
            <ns0:CustomField5>
                {
                    if (exists($gryOFMLogger1/ns0:CustomField5)) then
                        (data($gryOFMLogger1/ns0:CustomField5))
                    else 
                        ()
                }
</ns0:CustomField5>
        </ns0:GryOFMLogger>
};

declare variable $gryOFMLogger1 as element(ns0:GryOFMLogger) external;
declare variable $HostName as xs:string external;
declare variable $ManagedServerName as xs:string external;
declare variable $DomainName as xs:string external;



xf:EmptyTransformation($gryOFMLogger1,
$HostName,
$ManagedServerName,
$DomainName)]]></con:xquery>
    <con:dependency location="../xsd/GryOFMLogger.xsd">
        <con:schema ref="GryOFMLogger/xsd/GryOFMLogger"/>
    </con:dependency>
</con:xqueryEntry>