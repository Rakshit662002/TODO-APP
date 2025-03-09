<cfinclude template="tasks.cfc">
<cfset taskObj = createObject("component", "tasks")>

<cfif structKeyExists(url, "id") AND isNumeric(url.id)>
    <cfset taskId = url.id>

    <cfset taskObj.updateTask(taskId)>
    <p>Task marked as complete!</p>
<cfelse>
    <p>Error: Task ID is missing or invalid.</p>
</cfif>

<a href="index.cfm">Back to To-Do List</a>
