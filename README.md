
# Triggers and Table Operations  - MySQL Assignment 

## Overview  
This project contains MySQL scripts to create a **teachers management system** with constraints and triggers for data validation and logging.  

## Features  
- **Create Table:** `teachers` table with fields `id`, `name`, `subject`, `experience`, and `salary`.  
- **Data Insertion:** Inserts 8 sample records into the `teachers` table.  
- **Triggers:**  
  1. **BEFORE INSERT Trigger:** Prevents inserting a negative salary.  
  2. **AFTER INSERT Trigger:** Logs new entries in the `teacher_log` table.  
  3. **BEFORE DELETE Trigger:** Prevents deletion of teachers with more than 10 years of experience.  
  4. **AFTER DELETE Trigger:**  Logs new entries in the `teacher_log` table when  row is deleted from teacher table.
     

## Triggers  

### 1. **BEFORE INSERT Trigger: `before_insert_teacher`**  
- Prevents inserting a teacher with a **negative salary**.  
- Raises an error: `"Salary cannot be negative"`.  

### 2. **AFTER INSERT Trigger: `after_insert_teacher`**  
- Logs newly inserted teachers into the `teacher_log` table.  
- Stores `teacher_id`, action description, and timestamp.  

### 3. **BEFORE DELETE Trigger: `before_delete_teacher`**  
- Prevents deleting teachers with **more than 10 years of experience**.  
- Raises an error: `"Cannot delete a teacher with more than 10 years of experience"`.

### 3. **AFTER  DELETE Trigger: `after_delete_teacher`**  
- Logs new entries in the `teacher_log` table when  row is deleted from teacher table.

  
## Usage  
1. Run the provided SQL scripts in **MySQL Workbench** or any MySQL database.  
2. Test insertions, deletions, and logging functionality.  

## License  
This project is for educational purposes.  


