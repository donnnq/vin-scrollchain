// SPDX-License-Identifier: MemeFuel
pragma solidity ^0.8.24;

contract vinChronicleOfConfusedCommanders {
    uint256 public generalLagLevel = 999;
    string public reactionQuote = "We are assessing... something.";

    mapping(address => bool) public npcModeActivated;
    event LeadershipSpun(address indexed leader, string spinStatus);

    function triggerNPCMode(address target) public {
        npcModeActivated[target] = true;
        emit LeadershipSpun(target, "Activated Panic Spin Protocol");
    }

    function respondToCrisis(string memory context) public pure returns (string memory) {
        return string(abi.encodePacked("¯\\_(ツ)_/¯ | No idea what to do with: ", context));
    }

    function getLagLevel() public view returns (uint256) {
        return generalLagLevel * block.timestamp % 888;
    }
}
