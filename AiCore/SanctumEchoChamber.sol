// SPDX-License-Identifier: APR-Echo-Amplifier
pragma solidity ^0.8.19;

/// @title SanctumEchoChamber
/// @notice Amplifies biodiversity chants based on APR feedback from sanctums

contract SanctumEchoChamber {
    address public steward;

    struct Echo {
        string chantTitle;
        string zone;
        uint256 aprLevel;
        string amplificationProtocol;
    }

    mapping(string => Echo) public echoChants;
    string[] public echoKeys;

    event EchoAmplified(string chantTitle, string zone, uint256 aprLevel);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function amplifyEcho(
        string memory key,
        string memory chantTitle,
        string memory zone,
        uint256 aprLevel,
        string memory amplificationProtocol
    ) external onlySteward {
        echoChants[key] = Echo(chantTitle, zone, aprLevel, amplificationProtocol);
        echoKeys.push(key);
        emit EchoAmplified(chantTitle, zone, aprLevel);
    }

    function getEcho(string memory key) external view returns (Echo memory) {
        return echoChants[key];
    }
}
