// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AsiaPacificSovereigntyDAO {
    address public admin;

    struct SovereigntyEntry {
        string nationLabel;
        string sovereigntySignal;
        string emotionalTag;
        bool active;
        bool archived;
    }

    SovereigntyEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitSovereignty(string memory nationLabel, string memory sovereigntySignal, string memory emotionalTag) external onlyAdmin {
        entries.push(SovereigntyEntry(nationLabel, sovereigntySignal, emotionalTag, true, false));
    }

    function archiveSovereignty(uint256 index) external onlyAdmin {
        entries[index].archived = true;
    }

    function getSovereignty(uint256 index) external view returns (SovereigntyEntry memory) {
        return entries[index];
    }
}
