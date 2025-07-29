// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title vinScrollOfJustice.sol
/// @notice Decodes moral weight, tracks penal resonance, offers redemption paths

contract vinScrollOfJustice {
    struct Judgment {
        address soul;
        string offense;
        string context;
        uint256 redemptionWeight; // Value from 0–100
        bool rehabilitated;
    }

    address public tribunal;
    mapping(address => Judgment) public soulLog;

    modifier onlyTribunal() {
        require(msg.sender == tribunal, "Not authorized");
        _;
    }

    constructor() {
        tribunal = msg.sender;
    }

    function logJudgment(address soul, string memory offense, string memory context) public onlyTribunal {
        soulLog[soul] = Judgment(soul, offense, context, 0, false);
    }

    function setRedemptionWeight(address soul, uint256 weight) public onlyTribunal {
        soulLog[soul].redemptionWeight = weight;
    }

    function markRehabilitated(address soul) public onlyTribunal {
        require(soulLog[soul].redemptionWeight >= 77, "Insufficient redemption weight");
        soulLog[soul].rehabilitated = true;
    }

    function fetchScroll(address soul) public view returns (Judgment memory) {
        return soulLog[soul];
    }
}
