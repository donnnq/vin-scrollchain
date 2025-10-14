// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalRoboticsSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string country;
        string roboticsSector;
        string sovereigntyMeasure;
        string emotionalTag;
        bool ratified;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _country, string memory _roboticsSector, string memory _sovereigntyMeasure, string memory _emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(_country, _roboticsSector, _sovereigntyMeasure, _emotionalTag, false));
    }

    function ratifyEntry(uint256 index) external onlyAdmin {
        entries[index].ratified = true;
    }

    function getEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
