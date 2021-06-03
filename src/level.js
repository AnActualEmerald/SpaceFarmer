import {Mob} from './mobs';

export class Level{
    constructor(levID, spawnX, spawnY, width, height){
        this.id = levID;
        this.enemies = [];
        this.finished = false;
        this.spawnX = spawnX;
        this.spawnY = spawnY;
        this.spawnEnemies(width, height);
    }

    update() {
        console.log(this.enemies.length);
        this.enemies.forEach((e, i) => {
            e.update();
            if (e.x < -50) {
                this.enemies.splice(i, 1);
            }
        });
    }

    draw(ctx) {
        this.enemies.forEach((e) => {
            e.draw(ctx);
        });
    }

    spawnEnemies(w, h) {
        for(var i = 0; i < this.id; i++) {
            for(var e = 0; e < 30; e++) {
                this.enemies.push(new Mob((Math.random() * w) + w, (Math.random() * h - 20) + 20, 5, 'green'));
            }
        }
    }
}