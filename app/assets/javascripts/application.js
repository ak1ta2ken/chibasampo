// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery/dist/jquery.js
//= require bootstrap/dist/js/bootstrap.min
//= require_tree .

(function() {
  const sceneTop = document.getElementById("sceneTop");
  const sceneGame = document.getElementById("sceneGame");
  const sceneResult = document.getElementById("sceneResult");
  const textQuestion = document.getElementById("textQuestion");
  const listAnswer = document.getElementById("listAnswer");
  const numResult = document.getElementById("numResult");
  const btnStart = document.getElementById("btnStart");
  const btnReset = document.getElementById("btnReset");

  const question = [
    {
      text: "第１問　成田空港に乗り入れる路線はJR成田線と？",
      choice: ["京成線", "京葉線", "常磐線"],
      ansewer: "京成線"
    },
    {
      text: "第２問　千葉市の次に人口の多い市は？",
      choice: ["松戸市", "市川市", "船橋市"],
      ansewer: "船橋市"
    },
    {
      text: "第３問　県民の日は？",
      choice: [
        "5月15日",
        "6月15日",
        "7月15日",
      ],
      ansewer: "6月15日"
    },
    {
      text: "第４問　千葉出身の嵐のメンバーは？",
      choice: ["相葉雅紀", "松本潤", "二宮和也"],
      ansewer: "相葉雅紀"
    },
    {
      text: "第５問　風が吹けば？",
      choice: ["桶屋が儲かる", "京葉線が止まる", "最近は徐行運転が多い"],
      ansewer: "最近は徐行運転が多い"
    },
    {
      text: "第６問　チーバくんは何の仲間？",
      choice: ["犬", "不思議ないきもの", "うさぎ"],
      ansewer: "不思議ないきもの"
    },
    {
      text: "第７問　富津市にある観光スポットは？",
      choice: ["アンデルセン公園", "東京ドイツ村", "マザー牧場"],
      ansewer: "マザー牧場"
    },
    {
      text: "第８問　千葉ポートタワーは何メートル？",
      choice: ["333メートル", "167メートル", "125メートル"],
      ansewer: "125メートル"
    },
    {
      text: "第９問　千葉駅前交番はなんのデザイン？",
      choice: ["きつね", "うさぎ", "ふくろう"],
      ansewer: "ふくろう"
    },
    {
      text: "第１０問　ふなっしーの本名は？",
      choice: ["フナディウス４世", "船田梨男", "北見健二"],
      ansewer: "フナディウス４世"
    },
  ];

  let state = {
    answer: "",
    gameCount: 0,
    success: 0
  };

  function init() {
    state.gameCount = 0;
    state.success = 0;
    changeScene(sceneResult, sceneTop);

    btnStart.addEventListener("click", gameStart, false);
  }

  function changeScene(hiddenScene, visibleScene) {
    hiddenScene.classList.add("is-hidden");
    hiddenScene.classList.remove("is-visible");
    visibleScene.classList.add("is-visible");
  }

  function showQuestion() {
    var str = "";
    question[state.gameCount].choice.forEach(function(value) {
      str += '<li class="questionChoice">' + value + "</li>";
    });
    textQuestion.innerHTML = question[state.gameCount].text;
    listAnswer.innerHTML = str;
  }

  function choiceQuestion() {
    let questionChoice = document.querySelectorAll(".questionChoice");
    questionChoice.forEach(function(choice) {
      choice.addEventListener(
        "click",
        function() {
          state.answer = this.textContent;
          checkAnswer(question[state.gameCount].ansewer);
        },
        false
      );
    });
  }

  function checkAnswer(answer) {
    if (answer === state.answer) {
      correctAnswer();
    } else {
      incorrectAnswer();
    }
    state.gameCount++;
    if (state.gameCount < question.length) {
      showQuestion();
      choiceQuestion();
    } else {
      gameEnd();
    }
  }

  function correctAnswer() {
    state.success++;
    console.log("正解");
  }

  function incorrectAnswer() {
    console.log("不正解");
  }

  function gameStart() {
    changeScene(sceneTop, sceneGame);
    showQuestion();
    choiceQuestion();
  }

  function gameEnd() {
    changeScene(sceneGame, sceneResult);
    numResult.innerHTML = state.success;
    btnReset.addEventListener("click", init, false);
  }

  init();
})();
