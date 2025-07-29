// SPDX-License-Identifier: SOV-BOND-UKR
pragma solidity ^0.8.0;

/// @title vinSovereignBond: Contract of defensive rites and allied greenlight for sovereignty
contract vinSovereignBond {
    address public initiator;
    string public decree = "The sovereign bond is invoked. Ukraine may proceed with righteous counterforce.";

    struct Countermeasure {
        string directive;
        string targetRegion;
        uint256 timestamp;
        string purpose;
    }

    Countermeasure[] public bondLog;

    event SovereigntyActivated(string decree);
    event CountermeasureLogged(string directive, string targetRegion, string purpose);

    constructor() {
        initiator = msg.sender;
        emit SovereigntyActivated(decree);
    }

    function logCountermeasure(string memory directive, string memory targetRegion, string memory purpose) public {
        bondLog.push(Countermeasure(directive, targetRegion, block.timestamp, purpose));
        emit CountermeasureLogged(directive, targetRegion, purpose);
    }

    function getAllLogs() public view returns (Countermeasure[] memory) {
        return bondLog;
    }
}
