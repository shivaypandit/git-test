# Use the official PHP image
FROM php:8.2-apache

# Set maintainer information
LABEL maintainer="your_email@example.com"

# Security best practices: Avoid running as root
RUN useradd -m dockeruser && \
    chown -R dockeruser /var/www/html

# Switch to non-root user
USER dockeruser

# Copy application code
COPY index.php /var/www/html/

# Expose port 80
EXPOSE 80

# Set default command
CMD ["apache2-foreground"]
