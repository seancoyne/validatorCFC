<cfcomponent name="validCreditCard" extends="_rule" output="false" hint="I test that a value is a valid Credit Card Number">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('CreditCard',arguments.value) />
	</cffunction>
	
</cfcomponent>