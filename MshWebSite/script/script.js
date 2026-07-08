document.querySelectorAll('.buttons, .buttons2').forEach((btn) => {
  btn.addEventListener('click', () => {
    btn.innerHTML = '<h3>Loading</h3>';
  });
});
