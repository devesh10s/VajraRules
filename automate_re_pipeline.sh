#!/bin/bash

# Set variables
GIT_REPO_URL="https://github.com/devesh10s/VajraRules.git"
GIT_REPO_PATH="/home/vajra/RuleEngine_Pipeline/"
DUMP_FILE="fleet_tables.dump"
DATABASE_NAME="fleet"
DATABASE_USER="vajra"
DATABASE_PASSWORD="${DATABASE_PASSWORD}"
DATABASE_HOST="localhost"
DATABASE_PORT="5432"
SQL_FILE_PATH="${GIT_REPO_PATH}/insert_statements.sql"
PYTHON_SCRIPT_PATH="/home/vajra/generate_insert_query.py"
DUMP_FILE_URL="https://raw.githubusercontent.com/devesh10s/VajraRules/main/fleet_tables.dump"


# GitHub credentials (ensure these are set as environment variables)
GITHUB_USERNAME="${GITHUB_USERNAME}"
GITHUB_TOKEN="${GITHUB_TOKEN}"

# Clone the repository with authentication
echo "Cloning the repository..."
git clone https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/devesh10s/VajraRules.git $GIT_REPO_PATH

# Navigate to the repository path
cd $GIT_REPO_PATH

# Download the fleet_tables.dump file
echo "Downloading the fleet_tables.dump file..."
curl -o $GIT_REPO_PATH/$DUMP_FILE $DUMP_FILE_URL

# Restore the SQL dump file into the database
echo "Restoring the SQL dump file..."
export PGPASSWORD=$DATABASE_PASSWORD
# Restore the SQL dump file into the database clean and restore
#pg_restore -U $DATABASE_USER -h $DATABASE_HOST -p $DATABASE_PORT -d $DATABASE_NAME -F c --clean $GIT_REPO_PATH/$DUMP_FILE

pg_restore -U $DATABASE_USER -h $DATABASE_HOST -p $DATABASE_PORT -d $DATABASE_NAME -F c --data-only $GIT_REPO_PATH/$DUMP_FILE


# Check if psycopg2 is installed, and install if not
if ! python3 -c "import psycopg2" &> /dev/null; then
    echo "psycopg2 not found. Installing..."
    pip3 install psycopg2-binary
fi

# Run the Python script to generate insert queries
echo "Running the Python script..."
python3 $PYTHON_SCRIPT_PATH

# Commit and push the insert_statements.sql file back to the repository with authentication
echo "Pushing the updated insert_statements.sql to the repository..."
cd $GIT_REPO_PATH
git add insert_statements.sql
git commit -m "Update insert_statements.sql"
git push https://${GITHUB_USERNAME}:${GITHUB_TOKEN}@github.com/devesh10s/VajraRules.git

# Clean up
echo "Cleaning up..."
rm -rf $GIT_REPO_PATH

echo "Task completed successfully."
