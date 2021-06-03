export class Canvas {
    constructor() {
        const canvas = document.querySelector("canvas");
        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;
        this.context = canvas.getContext("2d");
        this.bg = 'black';
        this.width = canvas.width;
        this.height = canvas.height;
    }

    drawRect(x1, y1, x2, y2) {
        this.context.fillRect(x1, y1, x2, y2);
    }

    drawCircle(x, y, rad) {
        this.context.beginPath();
        this.context.arc(x, y, rad, 0, Math.PI * 2);
        this.context.fill();
    }

    drawImage(img, x, y) {
        this.context.drawImage(img, x, y);
    }

    setFillStyle(style) {
        this.context.fillStyle = style;
    }

    setBackground(color) {
        this.bg = color;
    }

    clear() {
        this.setFillStyle(this.bg);
        this.context.fillRect(0, 0, this.width, this.height);
    }
}