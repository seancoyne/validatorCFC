<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: noZeroLengthString Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string has at least one character

--->
<cfcomponent name="noZeroLengthString" extends="_rule" output="false" hint="I Test that a string has at least one character">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isSimpleValue(arguments.value) and len(trim(arguments.value)) />
	</cffunction>
	
</cfcomponent>