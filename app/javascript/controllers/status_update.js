import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    changeStatus(status, taskId, element) {
        // Here, you would add the AJAX or fetch call to update the task status on the server
        // Once the status is updated on the server, you can then update the UI as needed
    
        // Example using fetch (you should handle errors and edge cases appropriately)
        fetch(`/tasks/${taskId}`, {
            method: 'PATCH',
            headers: {
                'Content-Type': 'application/json',
                // Add other headers as needed, such as CSRF token header
            },
            body: JSON.stringify({ status: status })
        })
        .then(response => response.json())
        .then(data => {
            // Update UI based on response
            if (data.success) {
                // Example: Update the status badge text and class
                const badge = element.closest('.card-body').querySelector('.badge');
                badge.textContent = status.charAt(0).toUpperCase() + status.slice(1); // Convert to Title Case
                badge.className = 'badge ' + data.newBadgeClass; // Update badge class based on server response
            } else {
                // Handle error (could display an error message, revert UI changes, etc.)
            }
        });
    }
}


