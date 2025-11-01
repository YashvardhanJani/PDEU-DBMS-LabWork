# Student Record Management System using File Handling
# File: students.txt
# Each record format: RollNumber,Name,Age,Department

import os

FILE_NAME = "Experiment-01\students.txt"

# Function to check if roll number exists
def roll_exists(roll):
    with open(FILE_NAME, "r") as file:
        for line in file:
            record = line.strip().split(",")
            if record[0] == roll:
                return True
    return False


# 1. CREATE - Add new student record
def add_student():
    roll = input("Enter Roll Number: ").strip()
    if roll_exists(roll):
        print("❌ Roll number already exists! Try again.")
        return

    name = input("Enter Name: ").strip()
    age = input("Enter Age: ").strip()
    dept = input("Enter Department: ").strip()

    with open(FILE_NAME, "a") as file:
        file.write(f"{roll},{name},{age},{dept}\n")

    print("✅ Record added successfully!")


# 2. READ - Display all records
def view_all():
    if not os.path.exists(FILE_NAME) or os.stat(FILE_NAME).st_size == 0:
        print("📂 No records found.")
        return

    print("\n--- Student Records ---\n")
    print(f"{'Roll No.':<10} {'Name':<20} {'Age':<5} {'Department'}")
    print("-" * 50)

    with open(FILE_NAME, "r") as file:
        for line in file:
            roll, name, age, dept = line.strip().split(",")
            print(f"{roll:<10} {name:<20} {age:<5} {dept}")
    print("-" * 50)


# 3. READ (by Roll Number)
def search_student():
    roll = input("Enter Roll Number to search: ").strip()
    found = False

    with open(FILE_NAME, "r") as file:
        for line in file:
            record = line.strip().split(",")
            if record[0] == roll:
                print("\n--- Record Found ---")
                print(f"Roll Number : {record[0]}")
                print(f"Name        : {record[1]}")
                print(f"Age         : {record[2]}")
                print(f"Department  : {record[3]}")
                found = True
                break

    if not found:
        print("❌ Record not found.")


# 4. UPDATE - Modify student record by roll number
def update_student():
    roll = input("Enter Roll Number to update: ").strip()
    updated = False

    if not os.path.exists(FILE_NAME):
        print("❌ File not found.")
        return

    lines = []
    with open(FILE_NAME, "r") as file:
        for line in file:
            record = line.strip().split(",")
            if record[0] == roll:
                print(f"Current Details: {record}")
                name = input("Enter New Name: ").strip()
                age = input("Enter New Age: ").strip()
                dept = input("Enter New Department: ").strip()
                lines.append(f"{roll},{name},{age},{dept}\n")
                updated = True
            else:
                lines.append(line)

    if updated:
        with open(FILE_NAME, "w") as file:
            file.writelines(lines)
        print("✅ Record updated successfully!")
    else:
        print("❌ Record not found.")


# 5. DELETE - Remove student record by roll number
def delete_student():
    roll = input("Enter Roll Number to delete: ").strip()
    deleted = False

    if not os.path.exists(FILE_NAME):
        print("❌ File not found.")
        return

    lines = []
    with open(FILE_NAME, "r") as file:
        for line in file:
            record = line.strip().split(",")
            if record[0] != roll:
                lines.append(line)
            else:
                deleted = True

    with open(FILE_NAME, "w") as file:
        file.writelines(lines)

    if deleted:
        print("🗑️  Record deleted successfully!")
    else:
        print("❌ Record not found.")


# 6. MENU - Main program
def main():
    # Create file if not exists
    if not os.path.exists(FILE_NAME):
        open(FILE_NAME, "w").close()

    while True:
        print("\n===== Student Record Management =====")
        print("1. Add a Student Record")
        print("2. View All Records")
        print("3. Search a Record by Roll Number")
        print("4. Update a Record")
        print("5. Delete a Record")
        print("6. Exit")

        choice = input("Enter your choice (1-6): ")

        if choice == "1":
            add_student()
        elif choice == "2":
            view_all()
        elif choice == "3":
            search_student()
        elif choice == "4":
            update_student()
        elif choice == "5":
            delete_student()
        elif choice == "6":
            print("👋 Exiting program. Goodbye!")
            break
        else:
            print("❌ Invalid choice! Please try again.")


# Run the program
if __name__ == "__main__":
    main()