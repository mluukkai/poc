```mermaid
sequenceDiagram
    participant entry
    participant riskData
    participant countryRisks
    participant countryRouter

    entry->>riskData: getRiskData(data)
    riskData ->>+ riskData: getMultilateralRisks(countries, formData)
    riskData ->> countryRouter: getCountryData
    riskData ->> countryRisks: getCountryRisks
    riskData ->>- riskData

```

```mermaid
sequenceDiagram
    participant browser
    participant server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/notes
    activate server
    server-->>browser: HTML document
    deactivate server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/main.css
    activate server
    server-->>browser: the css file
    deactivate server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/main.js
    activate server
    server-->>browser: the JavaScript file
    deactivate server

    Note right of browser: The browser starts executing the JavaScript code that fetches the JSON from the server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/data.json
    activate server
    server-->>browser: [{ "content": "HTML is easy", "date": "2023-1-1" }, ... ]
    deactivate server

    Note right of browser: The browser executes the callback function that renders the notes

    browser-->>server: POST https://studies.cs.helsinki.fi/exampleapp/new_note
    Note right of browser: The user creates a new note on the page

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/notes
    activate server
    server-->>browser: The browser reloads HTML document...
    deactivate server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/main.css
    activate server
    server-->>browser: ...and reloads the css file...
    deactivate server

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/main.js
    activate server
    server-->>browser: ...as well as the JavaScript file also...
    deactivate server

    Note right of browser: ...after which the JavaScript code fetching the JSON from the server is executed again

    browser->>server: GET https://studies.cs.helsinki.fi/exampleapp/data.json
    activate server
    server-->>browser: [{ "content": "HTML is easy", "date": "2023-1-1" }, ... ]
    deactivate server
```
