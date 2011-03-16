<cfcomponent name="validFloat" extends="_rule" output="false" hint="I test that a value is a valid float">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('float',arguments.value) />
	</cffunction>
	
</cfcomponent>