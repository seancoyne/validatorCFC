<cfcomponent name="noZeroLengthString" extends="_rule" output="false" hint="I Test that a value has at least one character">
	
	<cffunction name="validate" access="public" returntype="boolean" output="false">
		<cfargument name="value" type="any" required="true" />
		<cfreturn isSimpleValue(arguments.value) and len(trim(arguments.value)) />
	</cffunction>
	
</cfcomponent>