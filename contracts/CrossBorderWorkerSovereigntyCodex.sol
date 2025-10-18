// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CrossBorderWorkerSovereigntyCodex {
    address public admin;

    struct SovereigntyEntry {
        string workerName;
        string hostCountry;
        string contractDuration;
        string emotionalTag;
        bool summoned;
        bool honored;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonSovereignty(string memory workerName, string memory hostCountry, string memory contractDuration, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(workerName, hostCountry, contractDuration, emotionalTag, true, false));
    }

    function honorSovereignty(uint256 index) external onlyAdmin {
        entries[index].honored = true;
    }

    function getSovereigntyEntry(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
