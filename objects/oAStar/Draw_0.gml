/*draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_color(c_black)
for(var i = 0; i < fieldWidth; i++) {
    for(var j = 0; j < fieldHeight; j++) {
        draw_rectangle(i*blockSize, j*blockSize, (i+1)*blockSize, (j+1)*blockSize, walkable[i,j])
        //draw_text(i*blockSize,j*blockSize,string(i)+"#"+string(j));
    }
}

