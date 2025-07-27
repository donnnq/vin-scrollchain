// Detects suspicious pipe creation behavior using metadata tracking
contract vinPipeSentinel {
    mapping(bytes32 => uint256) public pipeActivity;
    event PipePing(bytes32 indexed pipeId, uint256 timestamp);

    function pingPipe(string memory pipeName) public {
        bytes32 pipeId = keccak256(abi.encodePacked(pipeName));
        pipeActivity[pipeId] = block.timestamp;
        emit PipePing(pipeId, block.timestamp);
    }

    function checkRecent(bytes32 pipeId) public view returns (bool) {
        return block.timestamp - pipeActivity[pipeId] < 30; // pipe created within last 30 seconds
    }
}
