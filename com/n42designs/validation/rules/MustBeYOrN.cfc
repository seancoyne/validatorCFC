<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: MustBeYOrN Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is either 'Y' or 'N'

--->
<cfcomponent name="MustBeYOrN" extends="_rule" output="false" hint="I test that a string is either 'Y' or 'N'">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn (arguments.value eq 'Y' or arguments.value eq 'N') />
	</cffunction>
	
</cfcomponent>