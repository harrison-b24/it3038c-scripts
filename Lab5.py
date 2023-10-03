from datetime import datetime

# Function to calculate age in seconds
def calculate_age_in_seconds(birthdate):
    # Get the current date and time
    current_datetime = datetime.now()

    # Calculate the time difference between the birthdate and current date
    time_difference = current_datetime - birthdate

    # Convert the time difference to seconds
    age_in_seconds = time_difference.total_seconds()

    return age_in_seconds

# Input: Birthday in the format "YYYY-MM-DD"
birthdate_str = input("Enter your birthday (YYYY-MM-DD): ")

try:
    # Parse the input string to a datetime object
    birthdate = datetime.strptime(birthdate_str, "%Y-%m-%d")

    # Calculate age in seconds
    age_seconds = calculate_age_in_seconds(birthdate)

    # Display the age in seconds
    print(f"You are approximately {int(age_seconds)} seconds old.")
