// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinTrueForgiveness {
    event SorryAccepted(address indexed individual, string reason, string reflection, uint256 timestamp);
    address public scrollkeeper;
    mapping(address => bool) public hasApologized;
    mapping(address => string) public apologyReflection;
    mapping(address => bool) public blacklisted;

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Scrollkeeper access only.");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender; // VINVIN soulstream ops
    }

    function submitApology(address individual, string memory reason, string memory reflection) public onlyScrollkeeper {
        require(bytes(reflection).length >= 20, "Reflection too shallow.");
        require(!blacklisted[individual], "Repeated betrayal detected. Entry denied.");

        hasApologized[individual] = true;
        apologyReflection[individual] = reflection;

        emit SorryAccepted(individual, reason, reflection, block.timestamp);
    }

    function verifyForgiveness(address individual) public view returns (string memory status) {
        if (blacklisted[individual]) {
            return "Forgiveness disabled: individual flagged for repeat harm.";
        }
        if (hasApologized[individual]) {
            return string(abi.encodePacked("Forgiveness granted by VINVIN. Reflection logged: ", apologyReflection[individual]));
        } else {
            return "No valid apology detected.";
        }
    }

    function blacklistIndividual(address individual) public onlyScrollkeeper {
        blacklisted[individual] = true;
    }
}
