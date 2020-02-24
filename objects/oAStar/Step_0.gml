if !fieldGenerated {
    with objSolidParent {
        var blockX = x div oAStar.blockSize //x/y=2.25 x div y=2 floor(x/y);
        var blockY = y div oAStar.blockSize
        oAStar.walkable[blockX, blockY] = false
    }
    fieldGenerated = true
}

if hardMode and instance_exists(oPathFinder) and firstStep {
	oPathFinder.enemySpeed -= 1
	oPathFinder.attackDamage += 1
}
