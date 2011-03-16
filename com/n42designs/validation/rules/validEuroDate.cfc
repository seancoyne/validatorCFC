<cfcomponent name="validEuroDate" extends="_rule" output="false" hint="I test that a value is a valid European date">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('EuroDate',arguments.value) />
	</cffunction>
	
</cfcomponent>