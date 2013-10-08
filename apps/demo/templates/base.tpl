{# base template. Name 'base.tpl' reserved. #}<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Embedded Erlang Demo -> {% block title %}{{ meta.title }}{% endblock %}</title>
    <style type="text/css">
/* CSS Reset courtesy of http:///meyerweb.com/eric/tools/css/reset/ */
/* v1.0 | 20080212 */

html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code, del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset,
form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td {
        margin: 0;
        padding: 0;
        border: 0;
        outline: 0;
        font-size: 100%;
        vertical-align: baseline;
        background: transparent;
}
body { line-height: 1; }
ol, ul { list-style: none; }
blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after {
        content: '';
        content: none;
}
/* remember to define focus styles! */
:focus { outline: 0; }

/* remember to highlight inserts somehow! */
ins { text-decoration: none; }
del { text-decoration: line-through; }

/* tables still need 'cellspacing="0"' in the markup */
table { border-collapse: collapse; border-spacing: 0; }

/* Real Styling */
html {
    text-align: center;
    background-color: #f5f5fd; /*#f9f5eb;*/
    color: #333;
    font-family: Trebuchet Ms, Arial;
}
body {
    margin: 0 auto;
    text-align: center;
}

header, footer, article {
    display: block;
    text-align: left;
}

header {
    text-align: center;
    background: #333;
    font-size: 1.3em;
    box-shadow: -0.2em 0 0.2em #111; /* Giving up on a clean scrollbar */
    -moz-box-shadow: -0.2em 0 0.2em #111;
    -webkit-box-shadow: 0 0 0.2em #111;
}

header h1 {
    width: 80%;
    margin: 0 auto;
    text-align: left;
    padding: 0.5em 1.4em;
    font-family: Georgia;
    letter-spacing: 0.2em;
}

header a {
    color: #f9f5eb;
    text-decoration: none;
}

header a:hover {
    text-decoration: underline;
}

article {
    width: 70%;
    margin: 0 auto;
    padding: 2em 0.5em 0.5em;
    color: #666;
}

article a {
    color: #888;
}

article span.date {
    font-family: monospace;
    font-size: 0.9em;
    color: #888;
}

article h2 {
    margin: 0.2em 0;
    font-size: 1.5em;
    color: #69f;
    font-family: Trebuchet MS, Arial;
}

article h3 {
    margin: 1.2em 0 0.4em;
    font-size: 1.2em;
    font-style: italic;
    color: #69f;
    font-family: Trebuchet MS, Arial;
}

article p {
    margin: 1.2em 0 0.4em;
    line-height: 1.4em;
    font-size: 0.9em;
    color: #333;
    font-family: Trebuchet MS, Arial;
}

article dl,
article ul,
article ol {
    margin: 1.2em 0 0.4em 1.5em;
    color: #333;
    font-size: 0.9em;
    line-height: 1.4em;
}

article ul {
    list-style-type: disc;
}

article ol {
    list-style-type: decimal;
}

article ul li {
    padding-left: 0.5em;
}

article dl dt {
    font-style: italic;
    margin-top: 1em;
    color: #666;
}

article dl dd {
    margin-left: 0.7em;
    list-style-type: disc;
}

footer {
    clear: both;
    width: 70%;
    text-align: right;
    margin: 3em auto 0;
    font-size: 0.8em;
}

footer div.contact {
    float: right;
    width: 30%;
}

footer div.contact ul {
    border-top: 0.1em #333 solid;
    margin-bottom: 1em;
}

footer div.contact ul li {
    margin: 0.2em 0;
}

footer div.contact ul li a {
    text-decoration: none;
    color: #666;
}

footer div.contact ul li a:hover {
    text-decoration: underline;
    color: #888;
}

nav {
    margin: 0 auto;
    text-align: right;
    width: 80%;
}
dl dt {
    display: block;
}
dl dd {
    display: inline;
}
a.feedname { underline: none }
    .error { background: #fdd; }
    .unread { background: #dfd; }
    p.date { display: inline; }
    form.markread { display: inline; }
    </style>
  </head>

  <body>
    <header>
          <h1><a href="{{ url.base }}" title="home">Embedded Erlang Demo</a></h1>
    </header>
    {% block nav %}{% endblock %}

    <article>
        {% block content %}
        {% endblock %}
    </article>

    <footer>
          <div class="contact">
          </div>
    </footer>
  </body>
</html>
