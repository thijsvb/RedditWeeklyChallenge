var lexicon;
var result, inputA, inputB;

function setup() {
  noCanvas();

  lexicon = new RiLexicon();

  var middle = select('#middle');

  inputA = createInput("Structure sentence");
  inputA.style("width", "50%");

  inputB = createInput("Words");
  inputB.style("width", "50%");

  var button = createButton("Generate!");
  button.mousePressed(generateSentence);

  var example = createButton("Example");
  example.mousePressed(useExample);

  result = createElement("h1", '');

  middle.child(inputA);
  middle.child(createP(''));
  middle.child(inputB);
  middle.child(createP(''));
  middle.child(example);
  middle.child(createP(''));
  middle.child(button);
  middle.child(createP(''));
  middle.child(result);
}

function generateSentence() {
  var sa = new RiString(inputA.value());
  var sb = new RiString(inputB.value());

  var words = sb.words();
  var pos = sa.pos();
  var other = sb.pos();
  var output = "";

  for (var i = 0; i != pos.length; ++i) {
    var found = false;

    for (var j = 0; j != other.length; ++j) {
      if (pos[i] == other[j]) {
        output += words[j];
        words.splice(j, 1);
        other.splice(j, 1);
        found = true;
        break;
      }
    }

    if (!found) {
      output += lexicon.randomWord(pos[i]);
    }

    output += ' ';
  }

  var regex = /\W/;
  if (regex.test(sa.charAt(sa.length() - 1))) {
    output = trim(output);
    output += sa.charAt(sa.length() - 1);
  }

  output = output.charAt(0).toUpperCase() + output.slice(1);
  result.html(output);
}

function useExample() {
  inputA.value("The cat in the hat!");
  inputB.value("under each table a dog");
  generateSentence();
}
