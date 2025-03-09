<cfinclude template="tasks.cfc">
<cfset taskObj = createObject("component", "tasks")>

<cfif structKeyExists(url, "id") AND isNumeric(url.id)>
    <cfset taskId = url.id>
    <cfset deleteSuccess = taskObj.deleteTask(taskId)>

    <cfif deleteSuccess>
        <p>Task deleted successfully!</p>
    <cfelse>
        <p>Error: Task ID does not exist.</p>
    </cfif>
<cfelse>
    <p>Error: Task ID not provided or invalid.</p>
</cfif>

<a href="index.cfm">Back to To-Do List</a>
