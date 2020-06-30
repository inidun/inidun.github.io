---
layout: splash
# classes: wide
classes:
  - landing
  - dark-theme
permalink: /frontpage/
author_profile: false
title: "Front page"
header:
    image: /images/front_page_tmp.jpg

feature_row:
  - # image_path: /assets/images/unsplash-gallery-image-1-th.jpg
    # alt: "placeholder image 1"
    title: "Blog"
    excerpt: "To put blog posts here I must expand on `feature_row` in `_includes`. Also: Buttons have been right aligned. Yay!"
    url: "#test-link"
    btn_label: "other button style..."
    btn_class: "btn--small align-right"
  - # image_path: /assets/images/unsplash-gallery-image-2-th.jpg
    # alt: "placeholder image 2"
    title: "Colors"
    excerpt: "Change color to `color:rgba(0,139,248,1)` to get that nice UNESCO feel"
    url: "#test-link"
    btn_label: "Read More"
    btn_class: "btn--inverse align-right"
  - # image_path: /assets/images/unsplash-gallery-image-3-th.jpg
    title: "Footer"
    excerpt: "Either override footer or add logos another way."

---

# Welcome to the project of {{ site.title }}
{: .text-justify}

<i class="fas fa-exclamation-circle"></i> This is **only** a quick mockup. Starting to get a hang of this. Maybe the image should be less wide.
{: .notice}

<i class="fas fa-bell"></i> Hey! Someone should push the updated `Dockerfile` to <i class="fab fa-github"></i> GitHub. This is slooooow.
{: .notice--danger}

This research project uses large-scale digital text analysis to explore thousands of documents produced by the United Nations Educational, Scientific and Cultural Organization (UNESCO) from its foundation in 1945 to 2015. The purpose of this project is to use the vast quantity of texts produced by this global institution to understand how “international ideas,” core concepts that define the terms of international debate, developed and changed over time. Focusing on how concepts related to culture and communication affected and were affected by decolonization, our approach will shed light on the intellectual history of the process by which international society became global.

Funded by the [Swedish Research Council (Vetenskapsrådet)](https://www.vr.se/english), the project is run by Benjamin Martin (Department of History of Science and Ideas, Uppsala University) in collaboration Fredrik Norén (Umeå University) and systems developers at [Humlab Umeå](https://www.umu.se/en/humlab/). Learn more about the project here, and don't hesitate to [get in touch](mailto:benjamin.martin@idehist.uu.se) with comments, questions, or suggestions.

{% include feature_row %}
