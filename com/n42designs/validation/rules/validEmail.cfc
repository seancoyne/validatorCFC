<cfcomponent name="validEmail" extends="_rule" output="false" hint="I test that a value is a valid email address">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('email',arguments.value) />
	</cffunction>
	
</cfcomponent>