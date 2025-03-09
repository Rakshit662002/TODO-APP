

# **📝 To-Do List Application**  

A simple **To-Do List** application built using **ColdFusion (CFML)** with a **PostgreSQL** database. This project allows users to **add, update, and delete tasks** in a structured and efficient way.

---

## **🚀 Features**
✔ **Add tasks** with a user-friendly form  
✔ **View all tasks** in a sorted order  
✔ **Mark tasks as completed**  
✔ **Delete unnecessary tasks**  
✔ **Styled UI with CSS for a better experience**  

---

## **📂 Project Structure**
```
/todoproject
│── /cfm                     # ColdFusion (CFML) templates  
│── /components              # CF components for business logic  
│── /styles                  # CSS for styling  
│── /database                # Database scripts and configuration  
│── index.cfm                # Main page listing tasks  
│── add_task.cfm             # Form to add a new task  
│── tasks.cfc                # ColdFusion component (CFC) for task operations  
│── README.md                # Project documentation  
```

---

## **⚙️ Setup Instructions**  

### **🔹 1. Install ColdFusion Server**  
Ensure you have **Adobe ColdFusion** or **Lucee (Open Source CFML Engine)** installed.

### **🔹 2. Set Up the Database**  
Use **MYSQL** or **MySQL** and create a `tasks` table:  
```sql
CREATE TABLE tasks (
    id SERIAL PRIMARY KEY,
    task VARCHAR(255) NOT NULL,
    completed CHAR(1) DEFAULT 'N'
);
```

### **🔹 3. Configure ColdFusion Data Source**  
- Go to **ColdFusion Administrator → Data Sources**  
- Create a new data source **"todo_db"**  
- Select **PostgreSQL** and enter the database details  

---

## **💻 Usage**
1️⃣ Open `index.cfm` in your browser to view tasks.  
2️⃣ Use **"Add Task"** form to create a new task.  
3️⃣ Click **"Mark as Completed"** to update the status.  
4️⃣ Use **"Delete"** to remove tasks.  

---

## **📌 Example Code Snippets**

### **🔹 Fetching Tasks (tasks.cfc)**
```coldfusion
<cffunction name="getTasks" access="public" returntype="array">
    <cfquery name="getTasksQuery" datasource="todo_db">
        SELECT id, task, completed FROM tasks ORDER BY id DESC
    </cfquery>
    <cfset tasks = []>
    <cfloop query="getTasksQuery">
        <cfset arrayAppend(tasks, { "id" = getTasksQuery.id, "task" = getTasksQuery.task, "completed" = getTasksQuery.completed })>
    </cfloop>
    <cfreturn tasks>
</cffunction>
```

### **🔹 Adding a New Task (add_task.cfm)**
```coldfusion
<cfinclude template="tasks.cfc">
<cfset taskObj = createObject("component", "tasks")>

<cfif structKeyExists(form, "task")>
    <cfset newTaskId = taskObj.addTask(trim(form.task))>
    <p>Task added successfully! Task ID: <strong>#newTaskId#</strong></p>
</cfif>
```

---

## **🎨 UI Styling (styles.css)**
```css
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    text-align: center;
}
.container {
    width: 400px;
    margin: 50px auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
```

---

## **📜 License**
This project is open-source under the **MIT License**.  

---

## **📧 Contact**
For any issues or feature requests, feel free to open an **Issue** or reach out to me.

Happy coding! 🚀
