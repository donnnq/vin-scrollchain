// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// vinSentimentSanctuary.sol
// A ritualistic scroll honoring collective emotion, narrative tension, and dignity in protest.

contract vinSentimentSanctuary {
    address public scrollsmith;
    uint256 public lastInvocation;
    mapping(address => bool) public empathicWitness;

    event SentimentLogged(address indexed witness, string mood, string cause);
    event DignityPulseTriggered(string message, uint256 karmaUnits);

    modifier onlyEmpath {
        require(empathicWitness[msg.sender], "Not yet bonded in emotional trust.");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
        lastInvocation = block.timestamp;
    }

    function bondEmpathicWitness(address _witness) external {
        require(msg.sender == scrollsmith, "Only scrollsmith can bond.");
        empathicWitness[_witness] = true;
    }

    function logSentiment(string memory _mood, string memory _cause) external onlyEmpath {
        emit SentimentLogged(msg.sender, _mood, _cause);
    }

    function triggerDignityPulse(string memory _message, uint256 _karmaUnits) external onlyEmpath {
        require(_karmaUnits <= 777, "Pulse too powerful; dignity must stay balanced.");
        lastInvocation = block.timestamp;
        emit DignityPulseTriggered(_message, _karmaUnits);
    }

    function scrollReflection() external view returns (string memory reflection) {
        if (block.timestamp - lastInvocation < 1 days) {
            reflection = "Empathy surge detected. Civil souls are echoing through this chain.";
        } else {
            reflection = "Stillness. The sanctuary awaits new truths.";
        }
    }
}
