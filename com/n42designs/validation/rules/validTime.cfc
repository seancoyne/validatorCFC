<cfcomponent name="validTime" extends="_rule" output="false" hint="I test that a value is a valid Time">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('time',arguments.value) />
	</cffunction>
	
</cfcomponent>