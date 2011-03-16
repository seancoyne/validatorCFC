<cfcomponent name="validUSDate" extends="_rule" output="false" hint="I test that a value is a valid US date">

	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isValid('usdate',arguments.value) />
	</cffunction>
	
</cfcomponent>