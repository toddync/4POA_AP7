const htmlElement = document.documentElement;

const __FRANKEN__ = JSON.parse(
     localStorage.getItem("__FRANKEN__") || "{}"
);

if (
	__FRANKEN__.mode === "dark" ||
    (
		!__FRANKEN__.mode &&
    	window.matchMedia("(prefers-color-scheme: dark)").matches
	)
) {
	htmlElement.classList.add("dark");
} else {
	htmlElement.classList.remove("dark");
}
  
htmlElement.classList.add(__FRANKEN__.theme || "uk-theme-neutral");
htmlElement.classList.add(__FRANKEN__.radii || "uk-radii-md");
htmlElement.classList.add(__FRANKEN__.shadows || "uk-shadows-sm");
htmlElement.classList.add(__FRANKEN__.font || "uk-font-sm");
htmlElement.classList.add(__FRANKEN__.chart || "uk-chart-daylight");
  
let links = ["https://cdn.jsdelivr.net/npm/franken-ui@2.1.0-next.18/dist/css/utilities.min.css", "https://cdn.jsdelivr.net/npm/franken-ui@2.1.0-next.18/dist/css/core.min.css"]
links.forEach(link => {
	let linkElement = document.createElement("link");
    linkElement.rel = "stylesheet";
    linkElement.href = link;
    document.head.appendChild(linkElement);
})
