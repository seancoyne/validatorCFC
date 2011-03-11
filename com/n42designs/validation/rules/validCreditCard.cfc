<!---
Author: Sean Coyne (coyne.sean@gmail.com)
Name: validCreditCard Rule

$Rev$
$Date$
$Author$
$URL$

Tests that a string is a valid Credit Card Number

--->
<cfcomponent name="validCreditCard" extends="_rule" output="false" hint="I test that a string is a valid Credit Card Number">
	
	<cffunction name="init" access="public" output="false" returntype="any">
		<cfreturn this />
	</cffunction>
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="string" required="true" />
		<cfreturn isValid('CreditCard',arguments.value) />
	</cffunction>
	
</cfcomponent>