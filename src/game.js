import {Level} from './level';
import {Player, Mob} from './mobs';
import {Canvas} from './utils';

const c = new Canvas();

let levels = {};
let currentLevel;

export function update() {
    currentLevel.update();
}

export function draw() {
    c.clear();
    currentLevel.draw(c);
}

export function init() {
    currentLevel = new Level(1, 100, c.height / 2, c.width, c.height);
    levels[currentLevel.id] = currentLevel;
}