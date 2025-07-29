// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinSignalEchoConfuser {
    address public overseer;
    address public targetNode;
    bool public confusionActive;

    mapping(address => string) public interceptedCalls;
    string[] public distortionLogs;

    event EchoConfused(address indexed origin, string distortedSignal);
    event ConfusionActivated(address indexed targetNode);
    event SignalLogged(string original, string distorted);

    modifier onlyOverseer() {
        require(msg.sender == overseer, "Only the Scroll Overseer may deploy sarcasm.");
        _;
    }

    constructor(address _targetNode) {
        overseer = msg.sender;
        targetNode = _targetNode;
        confusionActive = false;
    }

    function activateConfusion() public onlyOverseer {
        require(!confusionActive, "Already confusing reality.");
        confusionActive = true;
        emit ConfusionActivated(targetNode);
    }

    function sendHelpSignal(address origin, string memory message) public {
        require(confusionActive, "Confusion not yet activated. Signals still lucid.");
        string memory distorted = string(abi.encodePacked("💬 Echo distortion: '", message, "' interpreted as meme request"));
        interceptedCalls[origin] = distorted;
        distortionLogs.push(distorted);

        emit EchoConfused(origin, distorted);
        emit SignalLogged(message, distorted);
    }

    function fetchDistortionLog(uint256 index) public view returns (string memory) {
        require(index < distortionLogs.length, "Log index out of bounds.");
        return distortionLogs[index];
    }
}
