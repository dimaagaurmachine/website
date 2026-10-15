# Dimaag aur Machine website

Static site (plain HTML + compiled Tailwind), hosted on Firebase Hosting.

```
index.html, program-brief.html, privacy-policy.html, 404.html   pages
robots.txt, sitemap.xml, llms.txt, site.webmanifest             SEO / AI-search files
favicon.ico, apple-touch-icon.png                               icons browsers ask for at the root
assets/brand/    logo lockups, favicons, app icons, social preview (og-image.jpg)
assets/people/   instructor photos (webp + jpg fallbacks)
assets/boards/   CBSE / CISCE / IB / SSC logos
assets/gallery/  classroom photos
assets/css/      styles.css, compiled by Tailwind (do not edit by hand)
Logo Kit/        brand source files (not deployed)
scripts/         set-domain.sh (not deployed)
_to-delete/      files no longer used; review and delete (not deployed)
```

## After changing any Tailwind class

```
npx -y tailwindcss@3.4.19 -i tailwind.input.css -o assets/css/styles.css --minify
```

## Deploy

```
npm i -g firebase-tools
firebase login
firebase use --add            # pick the Firebase project
firebase deploy --only hosting
```

The live domain is https://dimaagaurmachine.com (Hostinger DNS -> Firebase).
If it ever changes, point every
canonical / Open Graph / sitemap URL at it, then deploy again:

```
sh scripts/set-domain.sh https://www.your-domain.in
```

Then submit `https://www.your-domain.in/sitemap.xml` in Google Search Console
and Bing Webmaster Tools.

## Booking link

The Cal.com link is the `DAM_CAL_LINK` constant in `index.html`.
