export class Player extends Mob {
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
    constructor(x, y){
        this.x = x;
        this.y = y;
    }
}