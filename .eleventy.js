module.exports = function (eleventyConfig) {
  eleventyConfig.addPassthroughCopy("styles.css");
  eleventyConfig.addPassthroughCopy("manifest.json");
  eleventyConfig.addPassthroughCopy("icons");
  eleventyConfig.addPassthroughCopy("images");
  eleventyConfig.addPassthroughCopy("fancybox");
  eleventyConfig.addPassthroughCopy("CNAME");
  eleventyConfig.setDynamicPermalinks(false);
};
