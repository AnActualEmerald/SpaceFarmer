export class Player {
    constructor(startX, startY, sprite) {
        this.x = startX;
        this.y = startY;
        this.velX = 0;
        this.velY = 0;
        this.sprite = sprite;
    }

    update() {
        this.x += this.velX;
        this.y += this.velY;
    }

    draw(ctx){
        ctx.drawImage(this.sprite, this.x, this.y);
    }
}

export class Mob {
    constructor(x, y, sprite){
        this.x = x;
        this.y = y;
        this.move = () => console.log(`Current x ${x}\nCurrent y ${y}`);
        this.sprite = sprite;
    }

    update() {
        this.move();
    }

    draw(ctx) {
        ctx.drawImage(this.sprite, this.x, this.y);
    }
}