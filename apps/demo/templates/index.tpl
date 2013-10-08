{% extends "base.tpl" %}

{% block title %}Nerves Demo{% endblock %}

{% block content %}

{% if error %}
    <div class="error">
        <p>Something bad happened: {{error}}</p>
    </div>
{% endif %}

<h2>Beaglebone LEDs</h2>

<p>led0={{led0}}</p>
<p>led1={{led1}}</p>
<p>led2={{led2}}</p>
<p>led3={{led3}}</p>

<p>Check one or more:</p>

<form action="{{ url.base }}" method="post">
{% autoescape on %}
    <label for="led0">LED 0:</label>
    {% if led0 == "on" %}
        <input type="checkbox" name="led0" checked="true" />
    {% else %}
        <input type="checkbox" name="led0" />
    {% endif %}
    <br>

    <label for="led1">LED 1:</label>
    {% if led1 == "on" %}
        <input type="checkbox" name="led1" checked="true" />
    {% else %}
        <input type="checkbox" name="led1" />
    {% endif %}
    <br>

    <label for="led2">LED 2:</label>
    {% if led2 == "on" %}
        <input type="checkbox" name="led2" checked="true" />
    {% else %}
        <input type="checkbox" name="led2" />
    {% endif %}
    <br>

    <label for="led3">LED 3:</label>
    {% if led3 == "on" %}
        <input type="checkbox" name="led3" checked="true" />
    {% else %}
        <input type="checkbox" name="led3" />
    {% endif %}

    <br>
    <input type="submit" value="Do it!" />
{% endautoescape %}
</form>

{% endblock %}

