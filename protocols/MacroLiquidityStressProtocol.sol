// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MacroLiquidityStressProtocol {
    address public steward;

    struct MacroSignal {
        string source;
        string signalType;
        string assetClass;
        string timestamp;
        string impactLevel;
        string emotionalTag;
    }

    MacroSignal[] public signals;

    event MacroStressLogged(string source, string signalType, string assetClass, string timestamp, string impactLevel, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function logMacroStress(
        string memory source,
        string memory signalType,
        string memory assetClass,
        string memory timestamp,
        string memory impactLevel,
        string memory emotionalTag
    ) public onlySteward {
        signals.push(MacroSignal(source, signalType, assetClass, timestamp, impactLevel, emotionalTag));
        emit MacroStressLogged(source, signalType, assetClass, timestamp, impactLevel, emotionalTag);
    }
}
