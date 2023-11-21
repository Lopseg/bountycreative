# Ideas for Testing Checkout Systems

## Enhanced Original Tests

1. **Increase in Installment Value**: Test increasing the value of the `installments` parameter in the checkout request for extreme values such as `11000` or `11000.00`.

2. **Discount and Free Shipping Handling**: Add products to the cart until you get a free shipping discount, copy the value of the `discounts/coupons` parameter (if it exists), remove the products and finalize the purchase using the copied parameter .

3. **Modification of Payment Method**: Attempt to modify the payment method to one that is not displayed by the user interface, in order to identify errors in server-side validation.

4. **Manipulation of Benefits of Discounted Products**: Activate benefits of a discounted product, proceed to checkout, and in the meantime, send a request to remove the discounted item from the cart, then finalize the purchase .

5. **Negative Product Quantity**: Send payment request with product quantity defined as a negative value.

6. **Negative Payment Amount**: Trying to make a payment with a negative amount.

7. **Payment with Fractional Values**: Send payment request with values less than 1 and greater than zero (ex: `0.01`), testing vulnerabilities in processing fractional values.

8. **Atypical Data Injection into Payment Parameters**: Test sending atypical values such as `TRUE`, `NULL`, `{"__proto__":*/1/0/}` in parameters such as discount, installments and payment details.

9. **Race Condition with Payment via Pix**: Make two purchases simultaneously, paying only once, to test the occurrence of a race condition when generating payment codes via Pix.

10. **Privilege Escalation on Request Status Change**: Test the request status change from customer to administrator, investigating Forced Browsing vulnerabilities.

11. **Mass Assignment on Order Status and Value Parameters**: Experiment with mass changing parameters that affect order status and value, looking for security holes.

12. **Assigning Payment to Other Users**: Trying to assign a payment made to a user other than the one who made the purchase.

13. **Use of Another User's Card Identifier**: Submit a payment request using another user's saved card identifier.

## New Test Ideas

14. **Overflow Test in Numeric Fields**: Try to insert very large values in numeric fields, such as number of products, to test the overflow treatment.

15. **SQL Injection into Input Fields**: Insert SQL commands into text fields, such as delivery address or user name, to check whether the system is vulnerable to SQL Injection.

16. **Cross-Site Scripting (XSS) in Request Comments**: Inserting malicious scripts into text areas such as request comments, testing for XSS vulnerabilities.

17. **Code Injection into Address Fields**: Attempting to insert commands or scripts into delivery address fields to test for unwanted code execution.

18. **Price Manipulation via Element Inspection**: Change product prices by inspecting and modifying page elements.

19. **Two-Factor Authentication Test**: Attempt to bypass two-factor authentication, if present, during the checkout process.

20. **Malicious File Upload**: Test file uploads in any part of the checkout process that allows uploads, looking for code execution vulnerabilities.

21. **Order Forgery with CSRF**: Creating a false order in the name of another user, exploiting Cross-Site Request Forgery (CSRF) vulnerabilities.

22. **Reuse of Session Tokens**: Test whether session tokens are reused after logout, indicating poor session management.

23. **Exploitation of Deserialization Vulnerabilities**: Send maliciously modified objects in requests, testing for deserialization vulnerabilities.

24. **Bypass Purchase Limits**: Trying to bypass limits imposed on the quantity of items that can be purchased.

25. **Sensitive Data Exposure Testing**: Check whether sensitive data, such as credit card information, is exposed during the checkout process.

26. **Malicious Dependency Injection**: Test whether the system allows the injection of external dependencies that could compromise security.

27. **Captcha Bypass**: Trying to bypass captcha mechanisms during the checkout process.

28. **Flaw Exploitation in Third-Party APIs**: Test for vulnerabilities in third-party APIs integrated into the checkout process.

29. **Manipulation of Coupons and Promotional Codes**: Trying to use coupons and promotional codes in unforeseen ways to obtain undue discounts.

30. **Load and Stress Test**: Place orders at high frequency to test robustnessz of the system under heavy load.

31. **Checking Logs for Sensitive Information**: Check whether system logs contain sensitive information that should not be exposed.

32. **Configuration Vulnerability Testing**: Check for configuration flaws that can be exploited during checkout.

33. **Insecure Redirection Test**: Check whether the system allows insecure redirections after completing the order.

34. **Subdomain Flaw Exploitation**: Test for vulnerabilities in subdomains associated with the checkout system.

35. **Cookie Security Testing**: Investigate cookie security and management during the checkout process.

36. **Password Policy Assessment**: Test the robustness of password policies in the registration or login process during checkout.

37. **Access Control Bypass**: Trying to access restricted areas of the checkout process without the appropriate permissions.

38. **Network Failure Safety Fallback Test**: Evaluate system behavior under conditions of network failure or disconnection.

39. **Malicious HTTP Header Injection**: Send modified HTTP headers to test the system's robustness against manipulation.

40. **CORS Configuration Analysis**: Test Cross-Origin Resource Sharing (CORS) configurations to identify possible security flaws.

41. **Session Manipulation Resilience Testing**: Attempting to manipulate or hijack sessions to test the security and resilience of the system.

42. **Exploitation of Inconsistencies on Multiple Platforms**: Test the system on different platforms and devices to identify inconsistencies that can be exploited.

43. **Analysis of Third-Party Security Policies**: Investigate the security policies of third-party services integrated into the checkout process.
