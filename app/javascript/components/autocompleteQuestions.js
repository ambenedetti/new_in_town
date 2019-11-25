import places from 'places.js';

const initAutocompleteQuestions = () => {
  const questionInput = document.getElementById('question-city');
  if (questionInput) {
    places({ container: questionInput });
  }
};

export { initAutocompleteQuestions };
