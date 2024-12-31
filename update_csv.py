import csv

input_file = "hospitals.csv"  
output_file = "cleaned_hospitals.csv"  # The output file with updated data

# Map old column names to new column names
column_mapping = {
    "Hospital Name": "hospital_name",
    "Address": "address",
    "Size (Beds)": "size",
    "Type": "type",
    "Emergency Services": "emergency_service",
    "Year of Accreditation": "accreditation_year"
}

# Function to convert Yes/No to 1/0 for the boolean column in MySQL
def convert_emergency_service(value):
    if value.strip().lower() == "yes":
        return 1
    elif value.strip().lower() == "no":
        return 0
    else:
        return None  # Handle unexpected values

# Read the input file and create the output file
with open(input_file, "r", newline="", encoding="windows-1252") as infile, open(output_file, "w", newline="", encoding="utf-8") as outfile:
    reader = csv.DictReader(infile, delimiter=",")  # Comma-delimited input

    # Map the column names to the new ones
    updated_fieldnames = [column_mapping.get(col, col) for col in reader.fieldnames]

    writer = csv.DictWriter(outfile, fieldnames=updated_fieldnames)
    writer.writeheader()

    for row in reader:
        # Update the row data
        updated_row = {
            "hospital_name": row.get("Hospital Name", "").strip(),
            "address": row.get("Address", "").strip(),
            "size": row.get("Size (Beds)", "").strip(),
            "type": row.get("Type", "").strip(),
            "emergency_service": convert_emergency_service(row.get("Emergency Services", "")),
            "accreditation_year": row.get("Year of Accreditation", "").strip()
        }
        writer.writerow(updated_row)

print(f"File successfully created: {output_file}")
