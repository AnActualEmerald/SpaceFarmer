import {update, draw, init} from './game';

init();

//rendering loop
function drawGame() {
    requestAnimationFrame(drawGame);
    draw();
}

//update the game 60 times a second
setInterval(update, 16.666666667);

//draw the game as fast as the browser will allow
requestAnimationFrame(drawGame);
