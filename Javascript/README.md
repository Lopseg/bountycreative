

1. **Identificar chamadas de API**:
   ```bash
   jsluice query -q "(call_expression function: (member_expression) @api_call)" seu_arquivo.js
   ```

2. **Localizar URLs em literais de string**:
   ```bash
   jsluice query -q "(string) @string_value" seu_arquivo.js | grep 'http'
   ```

3. **Encontrar comentários que possam conter informações sensíveis**:
   ```bash
   jsluice query -q "(comment) @comment" seu_arquivo.js
   ```

4. **Buscar por padrões de chaves API**:
   ```bash
   jsluice secrets seu_arquivo.js | jq 'select(.kind == "APIKey")'
   ```

5. **Detectar uso de localStorage ou sessionStorage**:
   ```bash
   jsluice query -q "(member_expression property: (property_identifier) @storage)" seu_arquivo.js | grep 'localStorage\|sessionStorage'
   ```

6. **Analisar manipulação do DOM para vulnerabilidades XSS**:
   ```bash
   jsluice query -q "(call_expression function: (member_expression property: (property_identifier) @dom_manipulation))" seu_arquivo.js
   ```

7. **Verificar a presença de inline scripts para CSP bypass**:
   ```bash
   jsluice query -q "(script_element) @inline_script" seu_arquivo.html
   ```

8. **Identificar uso de funções de criptografia ou hash**:
   ```bash
   jsluice query -q "(call_expression function: (identifier) @crypto_function)" seu_arquivo.js | grep 'sha1\|md5\|crypto'
   ```

9. **Localizar uso de variáveis globais**:
   ```bash
   jsluice query -q "(assignment_expression left: (member_expression object: (identifier name: 'window')) @global_var)" seu_arquivo.js
   ```

10. **Detectar manipulação de cookies**:
    ```bash
    jsluice query -q "(member_expression object: (identifier name: 'document') property: (property_identifier name: 'cookie'))" seu_arquivo.js
    ```

11. **Procurar por variáveis não utilizadas**:
    ```bash
    jsluice query -q "(variable_declarator id: (identifier) @unused_var)" seu_arquivo.js
    ```

12. **Detectar event handlers inseguros**:
    ```bash
    jsluice query -q "(assignment_expression left: (member_expression property: (property_identifier) @event_handler))" seu_arquivo.js
    ```

13. **Identificar importações de bibliotecas externas**:
    ```bash
    jsluice query -q "(import_declaration source: (string) @library)" seu_arquivo.js
    ```

14. **Analisar uso de `eval()` e funções similares**:
    ```bash
    jsluice query -q "(call_expression function: (identifier) @eval_use)" seu_arquivo.js | grep 'eval'
    ```

15. **Localizar configurações de CORS**:
    ```bash
    jsluice query -q "(call_expression function: (member_expression property: (property_identifier name: 'setHeader')) @cors_config)" seu_arquivo.js
    ```

16. **Buscar por potenciais senhas hardcoded**:
    ```bash
    jsluice secrets seu_arquivo.js | jq 'select(.kind == "Password")'
    ```

17. **Detectar manipulação de `window.location`**:
    ```bash
    jsluice query -q "(assignment_expression left: (member_expression object: (identifier name: 'window') property: (property_identifier name: 'location')))" seu_arquivo.js
    ```

18. **Procurar por uso de WebSockets**:
    ```bash
    jsluice query -q "(new_expression callee: (identifier name: 'WebSocket'))" seu_arquivo.js
    ```

19. **Identificar uso de `innerHTML`**:
    ```bash
    jsluice query -q "(assignment_expression left: (member_expression property: (property_identifier name: 'innerHTML')))" seu_arquivo.js
    ```

20. **Detectar chamadas AJAX**:
    ```bash
    jsluice query -q "(call_expression function: (member_expression object: (identifier name: '$') property: (property_identifier) @ajax_call))" seu_arquivo.js
    ```

21. **Verificar a presença de `document.write()`**:
    ```bash
    jsluice query -q "(call_expression function: (member_expression object: (identifier name: 'document') property: (property_identifier name: 'write')))" seu_arquivo.js
    ```

22. **Localizar referências a `navigator.geolocation`**:
    ```bash
    jsluice query -q "(member_expression object: (identifier name: 'navigator') property: (property_identifier name: 'geolocation'))" seu_arquivo.js
    ```

23. **Procurar por uso de `postMessage`**:
    ```bash
    jsluice query -q "(call_expression function: (member_expression property: (property_identifier name: 'postMessage')))" seu_arquivo.js
    ```

24. **Detectar uso de `setTimeout` ou `setInterval`**:
    ```bash
    jsluice query -q "(call_expression function: (identifier name: 'setTimeout' | 'setInterval'))" seu_arquivo.js
    ```

25. **Analisar criação de elementos DOM**:
    ```bash
    jsluice query -q "(call_expression function: (member_expression object: (identifier name: 'document') property: (property_identifier name: 'createElement')))" seu_arquivo.js
    ```

26. **Identificar referências a `crypto` (Web Crypto API)**:
    ```bash
    jsluice query -q "(member_expression object: (identifier name: 'window') property: (property_identifier name: 'crypto'))" seu_arquivo.js
    ```

27. **Localizar chamadas a `fetch` com credenciais**:
    ```bash
    jsluice query -q "(call_expression function: (identifier name: 'fetch') arguments: (arguments (object_property key: (identifier name: 'credentials') value: (string))))" seu_arquivo.js
    ```

28. **Procurar por variáveis de ambiente**:
    ```bash
    jsluice query -q "(member_expression object: (identifier name: 'process') property: (property_identifier name: 'env'))" seu_arquivo.js
    ```

29. **Detectar uso de `RegExp`**:
    ```bash
    jsluice query -q "(new_expression callee: (identifier name: 'RegExp'))" seu_arquivo.js
    ```

30. **Analisar manipulação de `history`**:
    ```bash
    jsluice query -q "(member_expression object: (identifier name: 'window') property: (property_identifier name: 'history'))" seu_arquivo.js
    ```
