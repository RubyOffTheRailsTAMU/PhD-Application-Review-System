# Server API Authentication

### **Enhanced Authentication Flow Using Signed JWT**

### 1. **User Authentication via Google OAuth:**

- User attempts to access the Application Review System.
- The system redirects the user to Google's OAuth endpoint.
- After successful authentication with Google, the user is redirected back to the Application Review System with an authentication code.
- The system exchanges this code for an authentication token from Google.

### 2. **System-generated JWT Issuance:**

- After successful Google authentication, the system queries its database to fetch user roles and other relevant details.
- The system generates a JWT (JSON Web Token) which includes:
    - The user's role and other details.
    - A timestamp of when the JWT was issued.
    - An expiration time for the JWT.
- The system signs this JWT with its private key.

### 3. **User Interacts with TAMU Server:**

- With the signed JWT, the user can now make requests to the TAMU server.
- The TAMU server will extract the JWT from the request headers.
- Using the public counterpart of the key used to sign the JWT, the TAMU server verifies its authenticity.

### 4. **User Information from JWT:**

- After verifying the JWT's signature, the TAMU server extracts user details from it. This can include roles and other identifiers.
- Based on the user's role, the TAMU server determines what actions the user is authorized to perform.

### 5. **TAMU Server Response:**

- If the user's JWT is valid and their role permits the requested action, the TAMU server processes the request.
- If there's an issue with the JWT or the user's permissions, the TAMU server responds with an error.

### 6. **Token Expiry and Renewal:**

- JWTs have an expiration time to ensure security.
- If a user's token is expired, their request to the TAMU server will be denied.
- The Application Review System can either prompt the user to re-authenticate or automatically attempt to issue a new JWT if the user's session is still valid.
- If using refresh tokens, when the JWT expires, the system can use the refresh token to obtain a new JWT without requiring the user to log in again.

### 7. **Logout and Token Revocation:**

- When a user logs out, the Application Review System can mark the user's session as ended.
- If you implement a token blacklist, you can add the JWT to it, ensuring it can't be used again.
- For added security, tokens can be short-lived, and token revocation mechanisms can be implemented to handle scenarios like user logout or detected suspicious activity.

### 8. **Token Security Best Practices:**

- **Store Tokens Securely:** If you're storing any tokens (like refresh tokens), they should be stored securely. This can be in HttpOnly cookies, encrypted in the database, or other secure storage mechanisms.
- **Use HTTPS:** Ensure all communication, especially those containing tokens, is done over HTTPS. This protects against token interception and man-in-the-middle attacks.

### 9. **Implementation Details:**

- **JWT Libraries:** Use established JWT libraries like 'ruby-jwt' for Ruby on Rails to handle the creation, signing, and verification of JWTs.
- **HTTPS Configuration:** Ensure the TAMU server and Application Review System are configured with valid SSL certificates. For Ruby on Rails, the 'rails force_ssl' method can help enforce HTTPS.
- **Error Handling:** Implement comprehensive error handling in both systems. This ensures user-friendly messages are displayed for issues like token expiration, invalid permissions, or general errors.