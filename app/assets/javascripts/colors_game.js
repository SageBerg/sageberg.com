function componentToHex(c) {
  var hex = c.toString(16);
  return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(r, g, b) {
  return "#" + componentToHex(r) + componentToHex(g) + componentToHex(b);
}

function random_color() {
  color_string = "#"
  for (var i = 0; i < 6; i++) {
    color_string += Math.floor(Math.random() * 16).toString(16);
  }
  return color_string;
}

function guess_color() {
  guess = document.getElementById("guess_field").value;

  if (!valid_color(guess)) {
    clear_feedback();
    document.getElementById("off_by_red").innerHTML =
      "Please enter a valid color.";
    return;
  }

  guess = "#" + guess;
  actual_color = document.getElementById("colored_dot").style.backgroundColor;
  document.getElementById("guess_dot").style.backgroundColor = guess;
  rgb = actual_color.replace(/[^\d,]/g, '').split(',');
  r = parseInt(rgb[0]);
  g = parseInt(rgb[1]);
  b = parseInt(rgb[2]);
  guess_r = parseInt(guess.slice(1,3), 16);
  guess_g = parseInt(guess.slice(3,5), 16);
  guess_b = parseInt(guess.slice(5,7), 16);
  red_diff = Math.abs(r - guess_r);
  green_diff = Math.abs(g - guess_g)
  blue_diff = Math.abs(b - guess_b);
  difference = red_diff + green_diff + blue_diff;
  document.getElementById("actual_color").innerHTML = "Color: " + rgbToHex(r,g,b);
  document.getElementById("your_guess").innerHTML = "Your guess: #" + guess;
  document.getElementById("off_by_red").innerHTML = "Your red guess was off by " + red_diff;
  document.getElementById("off_by_green").innerHTML = "Your green guess was off by " + green_diff;
  document.getElementById("off_by_blue").innerHTML = "Your blue guess was off by " + blue_diff;
  document.getElementById("off_by").innerHTML = "Your guess was off by " +
    difference + " out of 765 " + "(" +
    letter_grade(100 - Math.round((parseInt(difference) / 765) * 100, 2)) +
    ")";
}

function letter_grade(percent) {
  var grade = "";
  if (percent < 60) {
    return "F";
  } else if (percent < 70) {
    grade += "D";
  } else if (percent < 80) {
    grade += "C";
  } else if (percent < 90) {
    grade += "B";
  } else {
    grade += "A";
  }
  if ((percent % 10) < 3) {
    grade += "-";
  } else if ((percent % 10) > 6) {
    grade += "+";
  }
  return grade;
}

function valid_color(color) {
  return /^(\d|[a-fA-F]){6}$/.test(color);
}

function start_color_game() {
  document.getElementById("guess_dot").style.backgroundColor = "#fff";
  document.getElementById("colored_dot").style.backgroundColor = random_color();
  document.getElementById("guess_field").value = "";
  clear_feedback();
}

function clear_feedback() {
  document.getElementById("actual_color").innerHTML = "Color: #??????";
  document.getElementById("your_guess").innerHTML = "Your guess:";
  document.getElementById("off_by_red").innerHTML = "";
  document.getElementById("off_by_green").innerHTML = "";
  document.getElementById("off_by_blue").innerHTML = "";
  document.getElementById("off_by").innerHTML = "";
}
