const img = document.querySelectorAll('img');
img.forEach(img => {
    img.addEventListener('mouseover', () => {
    console.log('MouseOver Image!');
    });
});