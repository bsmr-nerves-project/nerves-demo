{% extends "base.tpl" %}

{% block title %}Embedded Erlang Control Demo{% endblock %}

{% block content %}
<h2>Embedded Erlang Control Demo</h2>

<p>onoff is set to {{ onoff }}.</p>
<p>Try setting fields below:</p>

{% if error %}
    <div class="error">
        <p>Something happened: {{error}}</p>
    </div>
{% endif %}
<form action="{{ url.base }}" method="post">
{% autoescape on %}
    <label for="onoff">On or off:</label>
    {% if onoff == "true" %}
        <input type="checkbox" name="onoff" checked="true" />
    {% else %}
        <input type="checkbox" name="onoff" />
    {% endif %}
    <input type="submit" value="Do it!" />
{% endautoescape %}
</form>

{% endblock %}

