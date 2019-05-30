// allow fnc to be called only once

function debounce(fnc, interval) {
  let timeout = null
  let context = this
  return function(arg) {
    clearTimeout(timeout)
    timeout = setTimeout(function(){
      fnc.apply(context, [arg])
      isInprogress = false
    }, timeout)
  }
}

// control number of executions of an event
function throttle(fnc, interval) {
  let throttleTimer = null
  let context = this
  let previous = null
  return function(arg, a) {
    now = Date.now()
    if (previous == null ) {
      previous = now
    }
    diff = now - previous
    if (diff >= interval || throttleTimer == null) {
      clearInterval(throttleTimer)
      throttleTimer = setTimeout(function() {
        fnc.apply(context, arg)
        throttleTimer = null
      }, interval)
      previous = now
    }
  }
}

function cb (msg) {
  console.log(msg)
}
// cb("hello")
a = debounce(cb, 1000)

a('hello')

// a('world')

