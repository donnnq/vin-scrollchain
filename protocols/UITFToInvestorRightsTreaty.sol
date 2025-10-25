// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UITFToInvestorRightsTreaty {
    address public steward;

    struct RightsEntry {
        string fundName; // "UnionBank PHP Equity Fund"
        string investorID; // "Vinvin"
        string rightsGranted; // "Redemption access, NAVPU transparency, risk disclosure"
        string emotionalTag;
        bool ratified;
        bool sealed;
    }

    RightsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function ratifyRights(string memory fundName, string memory investorID, string memory rightsGranted, string memory emotionalTag) external onlySteward {
        entries.push(RightsEntry(fundName, investorID, rightsGranted, emotionalTag, true, false));
    }

    function sealRightsEntry(uint256 index) external onlySteward {
        require(entries[index].ratified, "Must be ratified first");
        entries[index].sealed = true;
    }

    function getRightsEntry(uint256 index) external view returns (RightsEntry memory) {
        return entries[index];
    }
}
