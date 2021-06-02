export class Level{
    constructor(levID, spawnX, spawnY){
        this.id = levID;
        this.enemies = [];
        this.finished = false;
        this.spawnX = spawnX;
        this.spawnY = spawnY;
    }

    update() {
        for(e in this.enemies) {
            e.update()
        }
    }

    draw(ctx) {
        for(e in this.enemies) {
            e.draw(ctx)
        }
    }

}