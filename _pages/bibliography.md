---
layout: single
permalink: /bibliography/
author_profile: true
title: Bibliography
---
A bibliography of research works related to this research project is available as a [Zotero group library](https://www.zotero.org/groups/2505327/inidun).
 Please visit this (you do not need to be a Zotero user) and feel free to make suggestions or additions.

{% include figure image_path="/images/PHOTO0000003958.jpg" alt="Image of UNESCO book bus, Colombia 1955. Photo credit: UNESCO. Collection of UNESCO Archives." caption="Image of UNESCO book bus, Colombia 1955. Photo credit: UNESCO. Collection of UNESCO Archives." %}

## Bibliography

<ul style="font-size: small; list-style-type: circle;">
{% capture my_include %}{% include biblio.html %}{% endcapture %}
{{ my_include | markdownify  | replace: "<p>", "<li>" | replace: "</p>", "</li>" }}
</ul>
