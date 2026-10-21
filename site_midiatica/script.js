const menuToggle = document.querySelector('.menu-toggle');
const mainNav = document.querySelector('#main-nav');
const selectionNotice = document.querySelector('#selection-notice');
let noticeTimer;

function showSelectionNotice(message) {
  if (!selectionNotice) return;
  selectionNotice.textContent = `Selecionado: ${message}`;
  selectionNotice.classList.add('is-visible');
  window.clearTimeout(noticeTimer);
  noticeTimer = window.setTimeout(() => selectionNotice.classList.remove('is-visible'), 1900);
}

const currentPage = document.body.dataset.page;
const currentLink = mainNav?.querySelector(`[data-page="${currentPage}"]`);
if (currentLink) currentLink.setAttribute('aria-current', 'page');

if (menuToggle && mainNav) {
  menuToggle.addEventListener('click', () => {
    const isOpen = menuToggle.getAttribute('aria-expanded') === 'true';
    menuToggle.setAttribute('aria-expanded', String(!isOpen));
    menuToggle.setAttribute('aria-label', isOpen ? 'Abrir menu' : 'Fechar menu');
    mainNav.classList.toggle('is-open', !isOpen);
  });

  mainNav.querySelectorAll('a[data-page]').forEach((link) => {
    link.addEventListener('click', (event) => {
      event.preventDefault();
      const pageName = link.textContent.trim();
      menuToggle.setAttribute('aria-expanded', 'false');
      menuToggle.setAttribute('aria-label', 'Abrir menu');
      mainNav.classList.remove('is-open');
      showSelectionNotice(pageName);
      if (link.dataset.page !== currentPage) {
        window.setTimeout(() => { window.location.href = link.href; }, 220);
      }
    });
  });
}

const selectedPage = sessionStorage.getItem('elo-selected-page');
if (selectedPage && selectedPage === currentPage) {
  showSelectionNotice(document.body.dataset.pageTitle || selectedPage);
}
sessionStorage.removeItem('elo-selected-page');

// Preserve the selection message briefly across a page navigation.
if (mainNav) {
  mainNav.querySelectorAll('a[data-page]').forEach((link) => {
    link.addEventListener('click', () => {
      if (link.dataset.page !== currentPage) sessionStorage.setItem('elo-selected-page', link.dataset.page);
    });
  });
}

document.querySelector('#current-year')?.replaceChildren(String(new Date().getFullYear()));

const quizForm = document.querySelector('#quiz-form');
const quizFeedback = document.querySelector('#quiz-feedback');
const quizAnswers = { q1: 'a', q2: 'a', q3: 'b', q4: 'a' };
const quizExplanations = {
  q1: 'O ODS 5 busca alcançar a igualdade de gênero e empoderar mulheres e meninas.',
  q2: 'O ODS 10 propõe reduzir desigualdades dentro dos países e entre eles.',
  q3: 'Equidade considera barreiras que dificultam o exercício dos direitos.',
  q4: 'Gênero, raça, renda, deficiência e território podem se combinar e afetar oportunidades.',
};

if (quizForm && quizFeedback) {
  quizForm.addEventListener('submit', (event) => {
    event.preventDefault();
    const answers = new FormData(quizForm);
    const unanswered = Object.keys(quizAnswers).filter((question) => !answers.get(question));
    quizFeedback.classList.remove('is-correct', 'is-wrong');

    if (unanswered.length) {
      quizFeedback.textContent = `Responda todas as questões antes de conferir. Faltam ${unanswered.length}.`;
      quizFeedback.classList.add('is-wrong');
      quizForm.querySelector(`[name="${unanswered[0]}"]`)?.focus();
      return;
    }

    const correctCount = Object.entries(quizAnswers).filter(([question, answer]) => answers.get(question) === answer).length;
    const missed = Object.keys(quizAnswers).filter((question) => answers.get(question) !== quizAnswers[question]);
    if (correctCount === 4) {
      quizFeedback.textContent = 'Resultado: 4 de 4. Todas as respostas estão corretas.';
      quizFeedback.classList.add('is-correct');
    } else {
      const review = missed.map((question) => `${question.slice(1)}. ${quizExplanations[question]}`).join(' ');
      quizFeedback.textContent = `Resultado: ${correctCount} de 4. Revise: ${review}`;
      quizFeedback.classList.add('is-wrong');
    }
  });

  quizForm.addEventListener('reset', () => {
    window.setTimeout(() => {
      quizFeedback.textContent = '';
      quizFeedback.classList.remove('is-correct', 'is-wrong');
    }, 0);
  });
}
