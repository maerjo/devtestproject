const $ = (s) => document.querySelector(s);
const $$ = (s) => Array.from(document.querySelectorAll(s));

// Year
$("#year").textContent = new Date().getFullYear();

// Toggle bio
const toggleBtn = $("#toggle-bio");
const bio = $("#bio");
if (toggleBtn && bio) {
  toggleBtn.addEventListener("click", () => {
    const expanded = toggleBtn.getAttribute("aria-expanded") === "true";
    toggleBtn.setAttribute("aria-expanded", String(!expanded));
    bio.hidden = expanded;
  });
}

// Quick list add
const form = $("#add-form");
const list = $("#quick-list");
if (form && list) {
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    const input = $("#item-input");
    const val = input.value.trim();
    if (!val) return;
    const li = document.createElement("li");
    li.textContent = val;
    list.appendChild(li);
    input.value = "";
    input.focus();
  });
}