const crrProgress = [
  { id: 'crr-updates', target: 72 },
  { id: 'crr-mpkg', target: 85 },
  { id: 'crr-center', target: 60 },
];

function animateProgress(element, target) {
  let current = 0;
  const step = () => {
    if (current >= target) {
      element.value = target;
      return;
    }
    current += 2;
    element.value = current;
    requestAnimationFrame(step);
  };
  requestAnimationFrame(step);
}

document.addEventListener('DOMContentLoaded', () => {
  crrProgress.forEach(({ id, target }) => {
    const bar = document.getElementById(id);
    if (bar) animateProgress(bar, target);
  });
});
