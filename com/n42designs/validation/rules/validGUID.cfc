<cfcomponent name="validGUID" extends="_rule" output="false" hint="I test that a value is a valid GUID">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('GUID',arguments.value) />
	</cffunction>
	
</cfcomponent>