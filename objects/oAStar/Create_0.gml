fieldGenerated=false;
blockSize=64;
camera = view_get_camera(0)

firstStep = true

fieldWidth=ceil(room_width/blockSize);
fieldHeight=ceil(room_height/blockSize);

for(var i=0;i<fieldWidth;i++){
    for(var j=0;j<fieldHeight;j++){
        walkable[i,j]=true;
    }
}

//Game Components
hardMode = false