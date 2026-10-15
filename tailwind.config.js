// Compiles the Tailwind classes used across the site into assets/css/styles.css.
// Rebuild after adding or changing any Tailwind class (including class
// strings inside the inline <script>s, which are scanned too):
//   npx -y tailwindcss@3.4.19 -i tailwind.input.css -o assets/css/styles.css --minify
module.exports = {
    content: ['./index.html', './privacy-policy.html'],
    theme: {
        extend: {
            fontFamily: { sans: ['"Plus Jakarta Sans"', 'system-ui', 'sans-serif'] },
        },
    },
};
