function add334 (x) {
  return x + 334
}

function changeState () {
  var ele = document.getElementById("num")
  var ele_num = parseInt(ele.textContent,10)
  ele.textContent = '' + add334(ele_num)
}

function reset () {
  var ele = document.getElementById("num")
  ele.textContent = '0'
}
