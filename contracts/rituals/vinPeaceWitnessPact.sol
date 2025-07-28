// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinPeaceWitnessPact {
    address public peaceArchitect;
    uint256 public decreeBlock;

    mapping(address => bool) public registeredWitnesses;
    string public prosperityVision;
    bool public sealed;

    event WitnessRegistered(address indexed observer, string pledge);
    event PactSealed(string vision);

    modifier onlyArchitect() {
        require(msg.sender == peaceArchitect, "Only the peace architect can modify the pact.");
        _;
    }

    constructor(string memory vision) {
        peaceArchitect = msg.sender;
        prosperityVision = vision;
        decreeBlock = block.number;
    }

    function registerWitness(string memory pledge) external {
        require(!sealed, "Pact has already been sealed.");
        require(!registeredWitnesses[msg.sender], "Already registered as a witness.");
        registeredWitnesses[msg.sender] = true;
        emit WitnessRegistered(msg.sender, pledge);
    }

    function sealPact() external onlyArchitect {
        require(!sealed, "Pact already sealed.");
        sealed = true;
        emit PactSealed(prosperityVision);
    }

    function viewPactStatus() external view returns (string memory status) {
        if (sealed) {
            return "Peace Vision Sealed. Observers locked into passive unity.";
        } else {
            return "Peace Vision Pending. Witnesses may still register.";
        }
    }
}
