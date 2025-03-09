<cfinclude template="tasks.cfc">
<cfset taskObj = createObject("component", "tasks")>

<!--- Fetch tasks --->
<cfset tasks = taskObj.getTasks()>

<h2>Task List</h2>

<cfif arrayLen(tasks) GT 0>
    <cfloop array="#tasks#" index="task">
        <p>
            <cfif task.completed EQ 'Y'>
                <strike>#task.task#</strike> (Completed)
            <cfelse>
                #task.task# (Pending)
            </cfif>
            <a href="update_task.cfm?id=#task.id#">Mark as Complete</a> |
            <a href="delete_task.cfm?id=#task.id#">Delete</a>
        </p>
    </cfloop>
<cfelse>
    <p>No tasks found.</p>
</cfif>

<a href="add_task.cfm">Add New Task</a>
