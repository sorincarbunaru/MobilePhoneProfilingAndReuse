<?xml version="1.0" encoding="UTF-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2"
    xmlns:sqf="http://www.schematron-quickfix.com/validator/process">
    <!-- Topic ID must be equal to file name -->
    <sch:pattern>
        <sch:rule context="/*[1][contains(@class, ' topic/topic ')]">
            <sch:let name="reqId" value="replace(tokenize(document-uri(/), '/')[last()], '\.dita', '')"/>
            <sch:assert test="@id = $reqId">
                Topic ID must be equal to file name.
            </sch:assert>
            <!--<sqf:fix id="setId">
                <sqf:description>
                    <sqf:title>Set "<sch:value-of select="$reqId"/>" as a topic ID</sqf:title>
                    <sqf:p>The topic ID must be equal to the file name.</sqf:p>
                </sqf:description>
                <sqf:add node-type="attribute" target="id" select="$reqId"/>
            </sqf:fix>-->
        </sch:rule>
    </sch:pattern>
</sch:schema>