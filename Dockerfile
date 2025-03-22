FROM quay.io/astronomer/astro-runtime:12.7.1
# Set the working directory
WORKDIR /usr/local/airflow

# Copy requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Set environment variables (if needed)
ENV AIRFLOW__CORE__LOAD_EXAMPLES=False

# Expose the port Airflow webserver runs on
EXPOSE 8080

# Set the default command to start Airflow
CMD ["bash", "-c", "airflow db upgrade && airflow webserver & airflow scheduler"]