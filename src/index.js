import {Canvas} from './utils';
import img_ref from './assets/tekkit.png';

var image = new Image();
image.src = img_ref;

let c = new Canvas();

if (image.complete) {
    c.drawImage(image, 0, 0);
}else{
    image.onload = () => {
        c.drawImage(image, 0, 0);
    }
}

