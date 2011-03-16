<cfcomponent name="validUUID" extends="_rule" output="false" hint="I test that a value is a valid UUID">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('UUID',arguments.value) />
	</cffunction>
	
</cfcomponent>