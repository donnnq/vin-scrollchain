// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MacroAuditDAO {
    address public originator;

    struct MacroSignal {
        string macroEvent;
        string assetImpacted;
        string volatilityLevel;
        bool isScrollchainSealed;
        uint256 timestamp;
    }

    MacroSignal[] public macroLedger;

    constructor() {
        originator = msg.sender;
    }

    function logMacroSignal(
        string memory macroEvent,
        string memory assetImpacted,
        string memory volatilityLevel,
        bool isScrollchainSealed
    ) external {
        macroLedger.push(MacroSignal({
            macroEvent: macroEvent,
            assetImpacted: assetImpacted,
            volatilityLevel: volatilityLevel,
            isScrollchainSealed: isScrollchainSealed,
            timestamp: block.timestamp
        }));
    }
}
