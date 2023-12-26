**Understanding Nodes in AST**

Each code element, be it a variable, function, or string, is represented as a node in the Abstract Syntax Tree (AST). For example, `**identifier**` represents variable names, while `function` pertains to functions.

**Node Matching**

Encapsulate a node type in parentheses to match it. For example, `**(identifier)**` matches all identifiers in your code.

**Attribute Specification**

Use `**:**` to specify node attributes. For instance, `**(identifier name: ‘myFunction’)**` targets identifiers named ‘**myFunction**’.

**Capturing Patterns**

Apply `**@**` to name a capture pattern. For example, `**(identifier) @variable_name**` captures all identifiers and tags them as `**variable_name**`.

**Child and Parent Commands**

Use `**child:**` or `**parent:**` to define node relationships. For example, `**(assignment_expression left: (identifier) @variable)**` finds variables on the left side of an assignment expression.

**Complex Combinations**

Combine different node types for more intricate queries. For instance, `**(function_declaration name: (identifier) @function_name)**` captures specific function declarations.

**Operators for Flexibility**

Leverage operators like `|` for ‘or’ and `&` for ‘and’. For example, `**(identifier name: ‘functionA’ | name: ‘functionB’)**` finds identifiers named either ‘functionA’ or ‘functionB’.

**Lists and Arrays**

Utilize `[]` for specifying a list or an array. For example, `**(array (string) @string_array)**` targets arrays of strings.

**Test Your Queries**

Always test your queries to ensure they accurately identify desired patterns in JavaScript code. The Tree-Sitter documentation provides more insights and examples for advanced query constructions.

Here are 10 practical examples of queries for `**jsluice**` to extract interesting data from JavaScript files:

1. Extract all function names

> jsluice query -q “(function_declaration name: (identifier) @function_name)” your_file.js

2. Find all variables declared

> jsluice query -q “(variable_declarator id: (identifier) @variable)” your_file.js

3. Identify all strings used

> jsluice query -q “(string) @string_value” your_file.js

4. Locate all API calls

> jsluice query -q “(call_expression function: (member_expression) @api_call)” your_file.js

5. Detect usage of ‘eval’

> jsluice query -q “(call_expression function: (identifier name: ‘eval’))” your_file.js

6. Find all assignments to ‘window.location’

> jsluice query -q “(assignment_expression left: (member_expression object: (identifier name: ‘window’) property: (property_identifier name: ‘location’)))” your_file.js

7. Extract all event listeners

> jsluice query -q “(call_expression function: (member_expression property: (property_identifier name: ‘addEventListener’))) @event_listener” your_file.js

8. Find usage of localStorage

> jsluice query -q “(member_expression object: (identifier name: ‘localStorage’))” your_file.js

9. Discover all XMLHttpRequests

> jsluice query -q “(new_expression callee: (identifier name: ‘XMLHttpRequest’))” your_file.js

10. Identify all inline scripts in an HTML file

> jsluice query -q “(script_element)” your_file.html

Each of these queries targets a specific aspect of JavaScript code that could reveal valuable insights during analysis, such as identifying potential vulnerabilities or understanding the code structure.

**Patterns**
```json
[  
    {  
        "name": "AWSAccessKey",  
        "value": "AKIA[0-9A-Z]{16}"  
    },  
    {  
        "name": "AWSSecretKey",  
        "value": "[0-9a-zA-Z/+]{40}"  
    },  
    {  
        "name": "FacebookAccessToken",  
        "value": "EAACEdEose0cBA[0-9A-Za-z]+"  
    },  
    {  
        "name": "GoogleAPIKey",  
        "value": "AIza[0-9A-Za-z\\-_]{35}"  
    },  
    {  
        "name": "GitHubAccessToken",  
        "value": "[a-zA-Z0-9_-]*:[a-zA-Z0-9_\\-]+@github\\.com"  
    },  
    {  
        "name": "TwitterBearerToken",  
        "value": "AAAAAAAAAAAAAAAAAAAAA[0-9A-Za-z%]+"  
    },  
    {  
        "name": "SlackToken",  
        "value": "xox[baprs]-[0-9a-zA-Z]{10,48}"  
    },  
    {  
        "name": "HerokuAPIKey",  
        "value": "[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"  
    }   
]```
