// Wait for the whole page to load so that the whole DOM is available.
window.onload = function() {
    // Parse the URL params.
    var searchParams = new URLSearchParams(location.search);
    var searchQuery = searchParams.get("q");

    if (searchQuery) {
        executeSearch(searchQuery);
    } else {
        // User didn't type anything into search box.
        document.getElementById('search-result').innerHTML = "<p>Morate upisati riječ ili frazu koju želite pretraživati.</p>";
    }
}

// Prepare and send HTTP GET request and wait for the response.
// After response is received, parse it into JSON object, and do the fuzzy search against this JSON object.
function executeSearch(searchQuery) {
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var jsonResponse = JSON.parse(request.responseText);
            // Configuration for fuse.js.
            var fuseOptions = {
                shouldSort: true,
                threshold: 0.0,
                tokenize:true,
                location: 0,
                distance: 100,
                maxPatternLength: 32,
                minMatchCharLength: 1,
                keys: [
                    {
                        name: "title",
                        weight: 0.8
                    },
                    {
                        name: "contents",
                        weight: 0.5
                    },
                    {
                        name: "tags",
                        weight: 0.4
                    },
                    {
                        name: "categories",
                        weight: 0.3
                    }
                ]
            };
            var fuse = new Fuse(jsonResponse, fuseOptions);
            var result = fuse.search(searchQuery);
            if (result.length > 0) {
                populateResults(result);
            } else {
                document.getElementById('search-result').innerHTML = "<p>Nema rezultata pretrage</p>";
            }
        }
    };
    request.open("GET", "/index.json");
    request.send();
}

// Fill the DOM object with filtered JSON results.
function populateResults(result) {
    // Get a DOM object that holds template.
    var templateDefinition = document.getElementById('search-result-template').innerHTML;

    // Configure custom delimiters for mustache.js as the default ones are in collision with Hugo.
    var customTags = [ '@@', '@@' ];

    // Let the mustache.js parse the template to gain more speed during the rendering.
    Mustache.parse(templateDefinition, customTags);

    // Iterate over JSON result and let mustache.js populate the placeholder values from HTML template.
    // Insert populated HTML template into the DOM.
    var searchResultObject = document.getElementById('search-result');
    for (var key in result) {
        var rendered = Mustache.render(templateDefinition, {link: result[key].permalink, title: result[key].title});
        searchResultObject.innerHTML += rendered;
    }
}