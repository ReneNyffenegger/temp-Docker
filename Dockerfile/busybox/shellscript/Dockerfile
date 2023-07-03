# Use BusyBox as the base image
FROM busybox

# Define an ARG (argument) with a default value
ARG MY_ARGUMENT=default-value

# Copy the shell script to the container
COPY script.sh /script.sh

# Set the execute permission for the shell script
RUN chmod +x /script.sh

# Run the shell script with the provided argument
# CMD ["/script.sh", "$MY_ARGUMENT"]                      Variables are not expanded
CMD ["/script.sh", "${MY_ARGUMENT}"]                      Variables are not expanded
