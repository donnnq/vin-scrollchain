// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FoundationsSovereigntyProtocol {
    address public admin;

    struct SovereigntyEntry {
        string foundationName; // "Open Society Foundations"
        string founder; // "George Soros"
        string threatVector; // "IRS audit", "Political targeting"
        string emotionalTag;
        bool protected;
        bool sealed;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function protectFoundation(string memory foundationName, string memory founder, string memory threatVector, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(foundationName, founder, threatVector, emotionalTag, true, false));
    }

    function sealSovereigntyEntry(uint256 index) external onlyAdmin {
        require(entries[index].protected, "Must be protected first");
        entries[index].sealed = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
