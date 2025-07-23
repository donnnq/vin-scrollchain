// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinVerticalShelterUpgradeProtocol {
    address public scrollkeeper;

    struct RelocationCandidate {
        string familyName;
        string currentSidewalkArea;
        bool unitAssigned;
        string newVerticalUnit;
        uint256 timestamp;
    }

    RelocationCandidate[] public candidates;

    event CandidateFlagged(string familyName, string area);
    event UnitAssigned(string familyName, string unit);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function flagCandidate(string memory familyName, string memory currentSidewalkArea) external onlyScrollkeeper {
        candidates.push(RelocationCandidate(familyName, currentSidewalkArea, false, "", block.timestamp));
        emit CandidateFlagged(familyName, currentSidewalkArea);
    }

    function assignVerticalUnit(uint256 index, string memory newVerticalUnit) external onlyScrollkeeper {
        candidates[index].unitAssigned = true;
        candidates[index].newVerticalUnit = newVerticalUnit;
        emit UnitAssigned(candidates[index].familyName, newVerticalUnit);
    }

    function getCandidate(uint256 index) external view returns (string memory, string memory, bool, string memory, uint256) {
        RelocationCandidate memory r = candidates[index];
        return (r.familyName, r.currentSidewalkArea, r.unitAssigned, r.newVerticalUnit, r.timestamp);
    }

    function totalCandidates() external view returns (uint256) {
        return candidates.length;
    }
}
