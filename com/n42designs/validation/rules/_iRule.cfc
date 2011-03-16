<cfinterface displayname="iRule" hint="ValidatorCFC rules">

	<cffunction name="init" displayname="init" description="initialize this rule" hint="Initializes the rule" access="public" output="false" returntype="_rule">

	</cffunction>

	<cffunction name="validate" displayname="validate" description="validates the value" hint="Validates the value" access="public" output="false" returntype="boolean">
		<cfargument name="value" displayName="value" type="any" hint="The value to test" required="true" />

	</cffunction>

</cfinterface>