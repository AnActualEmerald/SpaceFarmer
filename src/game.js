import {Level} from './level';
import {Player, Mob} from './mobs';
import {Canvas} from './utils';

const c = new Canvas();

let levels = {};
let currentLevel;

export function update() {
    currentLevel.update();
    currentLevel.draw(c);
}

export function init() {
    currentLevel = new Level(1, 100, c.height / 2);
    levels[currentLevel.id] = currentLevel;
    
}