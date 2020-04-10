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
      text: "第1問　成田空港に乗り入れる路線は成田線と？",
      choice: ["京成線", "京葉線", "総武線", "常磐線", "東武野田線"],
      ansewer: "京成線"
    },
    {
      text: "第2問　千葉市の次に人口の多い市は？",
      choice: ["松戸市", "市川市", "船橋市", "柏市", "浦安市"],
      ansewer: "船橋市"
    },
    {
      text: "第3問　県民の日は？",
      choice: [
        "3月15日",
        "4月15日",
        "5月15日",
        "6月15日",
        "7月15日",
      ],
      ansewer: "6月15日"
    },
    {
      text: "第4問　千葉出身の嵐のメンバーは？",
      choice: ["相葉雅紀", '大野智', '櫻井翔', "二宮和也", "松本潤"],
      ansewer: "相葉雅紀"
    },
    {
      text: "第5問　風が吹けば？",
      choice: ["桶屋が儲かる", "京葉線が止まる", "最近は徐行運転が多い", '歌が流れる', '狩人'],
      ansewer: "最近は徐行運転が多い"
    },
    {
      text: "第6問　チーバくんは何の仲間？",
      choice: ["犬", "不思議ないきもの", "うさぎ", "きつね", "たぬき"],
      ansewer: "不思議ないきもの"
    },
    {
      text: "第7問　富津市にある観光スポットは？",
      choice: ["アンデルセン公園", "東京ドイツ村", "マザー牧場", "海ほたる", "養老渓谷"],
      ansewer: "マザー牧場"
    },
    {
      text: "第8問　千葉ポートタワーは何メートル？",
      choice: ["333メートル", "167メートル", "125メートル", "408メートル", "330メートル"],
      ansewer: "125メートル"
    },
    {
      text: "第9問　千葉駅前交番はなんのデザイン？",
      choice: ["あひる", "すずめ", "ふくろう", 'ひよこ', 'かもめ'],
      ansewer: "ふくろう"
    },
    {
      text: "第10問　ふなっしーの本名は？",
      choice: ["フナディウス４世", "船田梨男", "北見健二", 'ふなっしー', 'グラディウス'],
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
