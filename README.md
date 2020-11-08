# Very thin client

A proof-of-concept web client that aims to be thinner than existing front-end pages. **Made as a joke** (mostly).

## TO RUN
TBD

## Background
Modern webpages have rather 'thick' frontend payloads that use JavaScript to fetch data from an API endpoint and compose the eventual HTML output, meaning that most of the work of 'rendering' the HTML is done client-side. An example might in vue.js might be:

```html
<tr v-for"item in items">
  <td>{{ item.name }}</td>
  <td>{{ item.price }}</td>
</tr>

<script>
new Vue({
  // ...
  mounted() {
    fetch(/* ...api stuff... */)
    .then(res => res.json())
    .then(data => this.items = data.items)
  }
});
</script>
```

On the other hand, webpages with simpler frontends won't have such JavaScript payloads to 'render' data; instead, the server fetches the data and composes the HTML all by itself, then sends the complete HTML back to the client. Instead of the JS above, such a site might send down this:

```html
<tr>
  <td>Standing fan, white</td>
  <td>$69.99</td>
</tr>
```

But can we go one level deeper? Browsers have long been plagued with rendering issues caused by inconsistent
implementations of positioning features, fancy experimental stying and such provided by CSS. 

And ultimately, just like how JavaScript gives the browser instructions on how to compose data for thicker clients,
HTML and CSS give the browser instructions on how to position stuff on the page.

_What if we did that server-side?_ That's what the very-thin-client does.

## Architecture
It's still a work in progress, but this repo consists of two things: a simple web server with a thin HTML frontend, and the intermediate rendering server.

The web server is just a Rails app that keeps track of a series of counters. You can increment and decrement the counters, but there's no text input anywhere; just click buttons.

The intermediate server is a Sinatra server working with Selenium Webdriver to 'render' webpages; it starts off at a webpage, takes screenshots, and sends it back to the user, along with *very minimal* HTML to place an imagemap on the screenshot.

When a user clicks on the image, the browser will send the clicked coordinates to the server. The webdriver will then "click" at the specified coordinates, wait for a bit (or until the page loads), take another screenshot, and send it back.
