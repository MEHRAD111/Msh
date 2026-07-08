const form = document.getElementById('login-form');
const usrname = document.getElementById('usrname');
const passwd = document.getElementById('passwd');
const message = document.getElementById('message');

form.addEventListener('submit', (event) => {
  event.preventDefault();

  if (!usrname.value.trim() || !passwd.value.trim()) {
    message.textContent = 'Login failed — please enter username and password.';
    message.className = 'message message--error';
    setTimeout(() => {
      message.textContent = '';
      message.className = 'message';
    }, 3000);
    return;
  }

  message.textContent = 'Redirecting...';
  message.className = 'message message--success';
  setTimeout(() => {
    location.href = 'panel/panel.html';
  }, 500);
});
