/*
//draw path elements
if path_get_number(path_index) >= 2 {
    //draw path
    draw_set_color(c_blue)
    for (var i = 0; i < path_get_number(path_index)-1; i++) {
        draw_line(
            path_get_point_x(path_index, i)+.5*oAStar.blockSize,
            path_get_point_y(path_index, i)+.5*oAStar.blockSize,
            path_get_point_x(path_index, i+1)+.5*oAStar.blockSize,
            path_get_point_y(path_index, i+1)+.5*oAStar.blockSize
        )
    }
	
    //draw starting and ending point
    draw_set_color(c_green)
    draw_circle(path_get_point_x(path_index,0)+.5*oAStar.blockSize,
        path_get_point_y(path_index,0)+.5*oAStar.blockSize, 5, false)
    draw_set_color(c_red)
    draw_circle(path_get_point_x(path_index,path_get_number(path_index)-1)+.5*oAStar.blockSize,
        path_get_point_y(path_index,path_get_number(path_index)-1)+.5*oAStar.blockSize, 5, false)
}
*/
draw_self()

