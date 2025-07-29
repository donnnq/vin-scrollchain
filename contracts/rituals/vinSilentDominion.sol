pragma solidity ^0.8.0;

contract vinSilentDominion {
    address public sovereign = msg.sender;
    string[] private softPowerMoves;

    event FlexLogged(string move, uint256 timestamp);

    function logMove(string memory move) external {
        require(msg.sender == sovereign, "Unauthorized NPC detected");
        softPowerMoves.push(move);
        emit FlexLogged(move, block.timestamp);
    }

    function lastDominionFlex() external view returns (string memory) {
        if (softPowerMoves.length == 0) return "Silence is building momentum...";
        return softPowerMoves[softPowerMoves.length - 1];
    }
}
