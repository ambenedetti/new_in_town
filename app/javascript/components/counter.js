const textField = document.getElementById('tip_content');

const countContentChars = () => {
  if (!textField) {
    return;
  }

  textField.addEventListener("keyup", (event) => {
    const counter = document.getElementById('body-count');
    length = textField.value.length;
    counter.innerHTML = length + ' characters';
  });
}

export { countContentChars };
