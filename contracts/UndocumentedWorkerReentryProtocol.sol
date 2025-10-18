// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UndocumentedWorkerReentryProtocol {
    address public admin;

    struct ReentryEntry {
        string workerName;
        string countryOrigin;
        string emotionalTag;
        bool summoned;
        bool reentered;
    }

    ReentryEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonReentry(string memory workerName, string memory countryOrigin, string memory emotionalTag) external onlyAdmin {
        entries.push(ReentryEntry(workerName, countryOrigin, emotionalTag, true, false));
    }

    function reenterWorker(uint256 index) external onlyAdmin {
        entries[index].reentered = true;
    }

    function getReentryEntry(uint256 index) external view returns (ReentryEntry memory) {
        return entries[index];
    }
}
