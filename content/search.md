---
title: "Search Results"
sitemap:
  priority : 0.1
layout: "search"
---

This file exists solely to respond to `/search` URL with the related `search` layout template.
No content shown here is rendered, all content is based in the template `layouts/_default/search.html` backed by `static/js/search.js`.

Setting a very low sitemap priority will tell search engines that this content is not important.

This implementation uses Fuse.js and mustache.js.