import csv

input_file = "Patients.csv"  
output_file = "cleaned_patients.csv"  # The output file with updated data

# Map old column names to new column names
column_mapping = {
    "PatientID": "patient_id",
    "FirstName": "first_name",
    "LastName": "last_name",
    "DateOfBirth": "date_of_birth",
    "Address": "address",
    "DoctorID": "doctor_id"
}

# Function to format the date into MySQL-compatible format (YYYY-MM-DD)
def format_date(date):
    try:
        day, month, year = date.split("-")
        return f"19{year}-{month.zfill(2)}-{day.zfill(2)}" if len(year) == 2 else f"{year}-{month.zfill(2)}-{day.zfill(2)}"
    except Exception as e:
        print(f"Error formatting date: {date}, error: {e}")
        return None

# Read the input file and create the output file
with open(input_file, "r", newline="", encoding="utf-8") as infile, open(output_file, "w", newline="", encoding="utf-8") as outfile:
    reader = csv.DictReader(infile, delimiter="\t")  # Tab-delimited input

    # Map the column names to the new ones
    updated_fieldnames = [column_mapping.get(col, col) for col in reader.fieldnames]

    writer = csv.DictWriter(outfile, fieldnames=updated_fieldnames)
    writer.writeheader()

    for row in reader:
        # Update the row data
        updated_row = {
            "patient_id": row.get("PatientID", "").strip(),
            "first_name": row.get("FirstName", "").strip(),
            "last_name": row.get("LastName", "").strip(),
            "date_of_birth": format_date(row.get("DateOfBirth", "").strip()),
            "address": row.get("Address", "").strip(),
            "doctor_id": row.get("DoctorID", "").strip()
        }
        writer.writerow(updated_row)

print(f"File successfully created: {output_file}")
