<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validXML Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is valid XML

--->
<cfcomponent name="validXML" extends="_rule" output="false" hint="I test that a string is valid XML">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('XML',arguments.value) />
	</cffunction>
	
</cfcomponent>